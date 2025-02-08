import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
  return null;
}

void printLog(String message) {
  if (!kDebugMode) return;

  log(message);
}

showAlertDialog({
  required BuildContext context,
  String? title,
  TextStyle? titleStyle,
  Widget? titleWidget,
  bool hideTitle = false,
  required String body,
  Widget? bodyWidget,
  TextStyle? bodyStyle,
  List<Widget>? actions,
  String? defaultActionText,
  VoidCallback? defaultActionOnPressed,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog.adaptive(
        title: !hideTitle
            ? titleWidget ??
                Text(
                  title ?? 'Alert!',
                  style: titleStyle,
                )
            : null,
        content: bodyWidget ??
            Text(
              body,
              style: bodyStyle ?? Theme.of(context).textTheme.bodyLarge,
            ),
        actions: actions ??
            [
              TextButton(
                onPressed: defaultActionOnPressed ?? () => context.pop(),
                child: Text(
                  defaultActionText ?? "Okay",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
              ),
            ],
      );
    },
  );
}

bool isNullEmpty(dynamic value) {
  if (value == null) {
    return true;
  } else if ((value is String || value is List) && value.isEmpty) {
    return true;
  } else if (value.toString().isEmpty) {
    return true;
  } else {
    return false;
  }
}

String nullReplacer(value) {
  return value ?? "NA";
}

Future<File?> imagePicker(ImageSource imageSource, String? cameraView) async {
  File? file;
  final ImagePicker picker = ImagePicker();
  XFile? xFile = await picker.pickImage(
    source: imageSource,
    imageQuality: 20,
    preferredCameraDevice: cameraView != null && cameraView == "front"
        ? CameraDevice.front
        : CameraDevice.rear,
  );
  if (xFile != null) {
    Uint8List? fileUint8List = await getCompressedImage(File(xFile.path));
    if (fileUint8List != null) {
      file = await convertUint8ListToFile(
          fileUint8List, xFile.path.split("/").last);
    }
  }
  return file;
}

Future<Uint8List?> getCompressedImage(File file) async {
  var result = await FlutterImageCompress.compressWithFile(
    file.absolute.path,
    minWidth: 2300,
    minHeight: 1500,
    quality: 20,
  );
  return result;
}

Future<File> convertUint8ListToFile(Uint8List data, String fileName) async {
  Directory directory = await getApplicationDocumentsDirectory();
  String path = '${directory.path}/$fileName';
  File file = File(path);
  await file.writeAsBytes(data);
  return file;
}

void showSnackBar({
  required BuildContext context,
  required String message,
  bool emoji = false,
  bool error = false,
}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      left: 10,
      right: 10,
      bottom: MediaQuery.of(context).padding.bottom + 100,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: error
                  ? [const Color(0xFFFF6A6A), const Color(0xFFD32F2F)]
                  : [
                      const Color(0xFFBBB9FF),
                      const Color(0xFF7A78E8)
                    ], // Gradient background
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1),
                blurRadius: 10,
                offset: const Offset(0, 4), // Shadow effect
              ),
            ],
          ),
          child: Text(
            "${emoji == false ? '' : '🎉'} $message",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry into the overlay
  overlay.insert(overlayEntry);

  // Remove the overlay entry after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

getTimeTravel(String data) {
  String utcDateTimeStr = data;
  DateTime utcDateTime = DateTime.parse(utcDateTimeStr);
  Duration kolkataOffset = const Duration(hours: 5, minutes: 30);
  DateTime kolkataDateTime = utcDateTime.add(kolkataOffset);
  DateTime nowUtc = DateTime.now().toUtc();
  DateTime nowKolkata = nowUtc.add(kolkataOffset);
  Duration duration = nowKolkata.difference(kolkataDateTime);

  if (duration.inDays > 0) {
    return '${duration.inDays} days ago';
  } else if (duration.inHours > 0) {
    return '${duration.inHours} hours ago';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes} minutes ago';
  } else if (duration.inSeconds > 0) {
    return '${duration.inSeconds} seconds ago';
  } else {
    return 'just now';
  }
}

getMemoryImage(base64String) => base64Decode(base64String);

String getInitials(String name, {int numInitials = 2}) {
  if (name.isEmpty) {
    return '';
  }

  List<String> nameParts = name.split(' ');
  StringBuffer initials = StringBuffer();

  for (int i = 0; i < nameParts.length; i++) {
    if (nameParts[i].isNotEmpty) {
      initials.write(nameParts[i][0].toUpperCase());
      if (initials.length >= numInitials) {
        break;
      }
    }
  }

  return initials.toString();
}

void showProfileImage(base64String, context) {
  if (base64String != null) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color.fromRGBO(0, 0, 0, .9),
      context: context,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: const EdgeInsets.only(left: 250),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                    CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.memory(
                          getMemoryImage(base64String),
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
