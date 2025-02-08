import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../core/error/exceptions.dart';
import '../../core/helper/global.dart';
import '../../core/route/route_names.dart';
import '../../injection_container.dart';
import 'local_data_source.dart';

Uri getUrlWithParams(String url, Map<String, dynamic> queryParameters) {
  String urlParams =
      queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&');

  if (urlParams.isNotEmpty) {
    url += '?$urlParams';
  }

  return Uri.parse(url);
}

Map<String, String> headers(String api) {
  var data = {'Accept': 'application/json', 'Content-Type': 'application/json'};
  List tokenNotAllowedIn = [
    "/v1/authentication/verifyOtp",
    "/v1/authentication/sendOtp"
  ];
  String? authToken = locator.get<LocalDataSource>().getAuthToken();
  String url = api.split("/api").last;
  if (authToken != null &&
      authToken.isNotEmpty &&
      !tokenNotAllowedIn.contains(url)) {
    data['Authorization'] = "Bearer $authToken";
  }
  log("header: $data");
  return data;
}

Future<T> postRequest<T>(
    {required http.Client client,
    required String api,
    dynamic body,
    required T Function(dynamic) modelFromJson}) async {
  try {
    log('Api url: $api');
    //log('Api body: ${jsonEncode(body)}');

    final http.Response response = await client
        .post(
      Uri.parse(api),
      body: body != null ? jsonEncode(body) : null,
      headers: headers(api),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(
          "{\"message\": \"Request time out\"}",
          408,
        ); // Request Timeout response status code
      },
    );

    // log('Api response: ${response.statusCode}, ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return modelFromJson(data);
    } else {
      if (response.statusCode == 403) {
        _handleUnauthorizedUser();
        RemoteException(
          statusCode: response.statusCode,
          message: (response.statusCode == 403
              ? 'Validation failed'
              : 'Server exception'),
        );
      }

      return Future.error(
        RemoteException(
          statusCode: response.statusCode,
          message: (response.statusCode == 422
              ? 'Validation failed'
              : 'Server exception'),
        ),
      );
    }
  } on Exception catch (e) {
    return Future.error(
      RemoteException(
        statusCode: e.runtimeType.hashCode,
        message: e.toString(),
      ),
    );
  }
}

enum APIRequestType { get, post, put, postMultipart, delete }

Future<T> apiRequest<T>({
  required http.Client client,
  required String api,
  required APIRequestType requestType,
  required T Function(dynamic) modelFromJson,
  Map<String, dynamic>? body,
}) async {
  try {
    log('Api Method: $requestType');
    log('Api url: $api');
    // if (kDebugMode) {
    //   print('Api body: ${body}');
    // }

    http.Response response;
    if (requestType == APIRequestType.postMultipart) {
      var request = http.MultipartRequest('PUT', Uri.parse(api));
      if (body!["files"] != null && body["files"].length > 0) {
        for (int i = 0; i < body["files"].length; i++) {
          request.files.add(body["files"][i]);
        }
      }

      body.remove("files");
      Map<String, String> stringMap =
          body.map((key, value) => MapEntry(key, value.toString()));
      request.fields.addAll(stringMap);
      request.headers.addAll(headers(api));

      var streamedResponse = await request.send();
      response = await http.Response.fromStream(streamedResponse).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
            "{\"message\": \"Request time out\"}",
            408,
          ); // Request Timeout response status code
        },
      );
    } else if (requestType == APIRequestType.post) {
      response = await client
          .post(
        Uri.parse(api),
        body: body != null ? jsonEncode(body) : null,
        headers: headers(api),
      )
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
            "{\"message\": \"Request time out\"}",
            408,
          ); // Request Timeout response status code
        },
      );
    } else if (requestType == APIRequestType.delete) {
      response = await client
          .delete(
        Uri.parse(api),
        body: body != null ? jsonEncode(body) : null,
        headers: headers(api),
      )
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
            "{\"message\": \"Request time out\"}",
            408,
          ); // Request Timeout response status code
        },
      );
    } else if (requestType == APIRequestType.put) {
      String queryParams = "";
      if (body != null) {
        body.forEach((k, v) {
          queryParams += "${queryParams.isEmpty ? '?' : '&'}$k=$v";
        });
      }

      api += queryParams;

      response = await client
          .put(Uri.parse(api),
              body: body != null ? jsonEncode(body) : null,
              headers: headers(api))
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
            "{\"message\": \"Request time out\"}",
            408,
          ); // Request Timeout response status code
        },
      );
    } else {
      String queryParams = "";
      if (body != null) {
        body.forEach((k, v) {
          queryParams += "${queryParams.isEmpty ? '?' : '&'}$k=$v";
        });
      }

      api += queryParams;

      response =
          await client.get(Uri.parse(api), headers: headers(api)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
            "{\"message\": \"Request time out\"}",
            408,
          ); // Request Timeout response status code
        },
      );
    }

    // log('Api response: ${response.statusCode}, ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return modelFromJson(data);
    } else {
      if (response.statusCode == 403) {
        _handleUnauthorizedUser();
        RemoteException(
          statusCode: response.statusCode,
          message: (response.statusCode == 403
              ? 'Validation failed'
              : 'Server exception'),
        );
      }

      return Future.error(
        RemoteException(
          statusCode: response.statusCode,
          message: (response.statusCode == 422
              ? 'Validation failed'
              : 'Server exception'),
        ),
      );
    }
  } on Exception catch (e) {
    return Future.error(
      RemoteException(
        statusCode: e.runtimeType.hashCode,
        message: e.toString(),
      ),
    );
  }
}

void _handleUnauthorizedUser() {
  // remove local data
  LocalDataSource localDataSource = locator.get<LocalDataSource>();
  localDataSource.removeAuthToken();
  localDataSource.removeUser();

  // navigate to login
  final GlobalVariable globalVariable = locator.get<GlobalVariable>();
  globalVariable.navState.currentContext!.goNamed(RouteName.signIn);
}
