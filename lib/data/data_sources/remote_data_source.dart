import 'package:http/http.dart' as http;

import 'api_helper.dart';
import 'api_methods.dart';

abstract class RemoteDataSource {
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> body);
  Future<Map<String, dynamic>> sendOtp(Map<String, dynamic> body);
  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> body);
  Future<Map<String, dynamic>> city();
  Future<Map<String, dynamic>> getCurrentUser();
  Future<Map<String, dynamic>> usersUpdate(Map<String, dynamic> body);
  Future<Map<String, dynamic>> createTempPost(Map<String, dynamic> body);
  Future<Map<String, dynamic>> updateTempPost(
      int id, Map<String, dynamic> body);
  Future<Map<String, dynamic>> getPosts();
  Future<Map<String, dynamic>> createMeetup(Map<String, dynamic> body);
  Future<Map<String, dynamic>> updateMeetup(int id, Map<String, dynamic> body);
  Future<Map<String, dynamic>> getMeetups();
  Future<Map<String, dynamic>> createTempSellItem(Map<String, dynamic> body);
  Future<Map<String, dynamic>> updateTempSellItem(
      int id, Map<String, dynamic> body);
  Future<Map<String, dynamic>> getAllTempSellItem();
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> body);
  Future<Map<String, dynamic>> getHomePosts(String query);
  Future<Map<String, dynamic>> getMyPostables(String query);
  Future<Map<String, dynamic>> getMyReactions(String query);
  Future<Map<String, dynamic>> deletePost(int id);
  Future<Map<String, dynamic>> addComments(Map<String, dynamic> body);
  Future<Map<String, dynamic>> removeComment(Map<String, dynamic> body);
  Future<Map<String, dynamic>> addLike(int postId, String type);
  Future<Map<String, dynamic>> createMeetUp(Map<String, dynamic> body);
  Future<Map<String, dynamic>> deleteMeetUp(int id);
  Future<Map<String, dynamic>> createSell(Map<String, dynamic> body);
  Future<Map<String, dynamic>> deleteSell(int id);
  Future<Map<String, dynamic>> getBusinessCategory();
  Future<Map<String, dynamic>> getSpecializations();
  Future<Map<String, dynamic>> saveServiceprovider(Map<String, dynamic> body);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.createUser,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> sendOtp(Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.sendOtp,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.verifyOtp,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> city() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.city,
      requestType: APIRequestType.get,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getCurrentUser() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getCurrentUser,
      requestType: APIRequestType.get,
      modelFromJson: (data) => data,
    );
  }

  @override
  Future<Map<String, dynamic>> usersUpdate(Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.usersUpdate,
      requestType: APIRequestType.postMultipart,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> createTempPost(Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.createTempPost,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> updateTempPost(
      int id, Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.updateTempPost(id),
      requestType: APIRequestType.put,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getPosts() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getPosts,
      requestType: APIRequestType.get,
      modelFromJson: (data) => data,
    );
  }

  @override
  Future<Map<String, dynamic>> createMeetup(Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.createMeetup,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> updateMeetup(
      int id, Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.updateMeetup(id),
      requestType: APIRequestType.put,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getMeetups() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getMeetups,
      requestType: APIRequestType.get,
      modelFromJson: (data) => data,
    );
  }

  @override
  Future<Map<String, dynamic>> createTempSellItem(
      Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.createTempSellItem,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> updateTempSellItem(
      int id, Map<String, dynamic> body) async {
    return await apiRequest(
      body: body,
      client: client,
      api: ApiMethods.updateTempSellItem(id),
      requestType: APIRequestType.put,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getAllTempSellItem() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getAllTempSellItem,
      requestType: APIRequestType.get,
      modelFromJson: (data) => data,
    );
  }

  @override
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> body) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.savePost,
      body: body,
      requestType: APIRequestType.postMultipart,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getHomePosts(String query) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getHomePosts(query),
      requestType: APIRequestType.get,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getMyPostables(String query) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getMyPostables(query),
      requestType: APIRequestType.get,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getMyReactions(String query) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getMyReactions(query),
      requestType: APIRequestType.get,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> deletePost(int id) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.deletePost(id),
      requestType: APIRequestType.delete,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> addComments(Map<String, dynamic> body) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.addComments,
      body: body,
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> removeComment(Map<String, dynamic> body) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.removeComment,
      body: body,
      requestType: APIRequestType.delete,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> addLike(int postId, String type) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.addLike(postId, type),
      requestType: APIRequestType.post,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> createMeetUp(Map<String, dynamic> body) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.saveMeetUp,
      body: body,
      requestType: APIRequestType.postMultipart,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> deleteMeetUp(int id) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.deleteMeetUp(id),
      requestType: APIRequestType.delete,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> createSell(Map<String, dynamic> body) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.saveSell,
      body: body,
      requestType: APIRequestType.postMultipart,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> deleteSell(int id) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.deleteSell(id),
      requestType: APIRequestType.delete,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }

  @override
  Future<Map<String, dynamic>> getBusinessCategory() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getBusinessCategory,
      requestType: APIRequestType.get,
      modelFromJson: (data) => data,
    );
  }

  @override
  Future<Map<String, dynamic>> getSpecializations() async {
    return await apiRequest(
      client: client,
      api: ApiMethods.getSpecializations,
      requestType: APIRequestType.get,
      modelFromJson: (data) => data,
    );
  }

  @override
  Future<Map<String, dynamic>> saveServiceprovider(
      Map<String, dynamic> body) async {
    return await apiRequest(
      client: client,
      api: ApiMethods.saveServiceprovider,
      body: body,
      requestType: APIRequestType.postMultipart,
      modelFromJson: (data) => Map<String, dynamic>.from(data),
    );
  }
}
