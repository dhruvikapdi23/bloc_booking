import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;
import 'package:bloc_booking/common_path.dart';
import 'package:shared_preferences/shared_preferences.dart';




bool isFlutterLocalNotificationsInitialized = false;

//when app in background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message ${message.messageId}');
  debugPrint("message.datass : ${message.data}");

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  showFlutterNotification(message);
}

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) async {
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin!
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel!);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  RemoteNotification? notification = message.notification;

  if (message.data["image"] != null || message.data["image"] != "") {
    final http.Response response =
    await http.get(Uri.parse(message.data["image"]));
    BigPictureStyleInformation bigPictureStyleInformation =
    BigPictureStyleInformation(
      ByteArrayAndroidBitmap.fromBase64String(base64Encode(response.bodyBytes)),
      largeIcon: ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes)),
    );
    flutterLocalNotificationsPlugin!.show(
      notification.hashCode,
      notification!.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel!.id,
          channel!.name,
          channelDescription: channel!.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          styleInformation: bigPictureStyleInformation,

          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: '@mipmap/ic_launcher',
          showProgress: true
        ),
      ),
    );
  } else {
    flutterLocalNotificationsPlugin!.show(
      notification.hashCode,
      notification!.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel!.id,
          channel!.name,
          channelDescription: channel!.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: '@mipmap/ic_launcher',
          showProgress: true
        ),
      ),
    );
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class CustomNotificationController {
  AndroidNotificationChannel? channel;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification(context) async {
    log('initCall');
    //when app in background
    //when app in background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // titledescription
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel!);
    }

    //when app is [closed | killed | terminated]
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        flutterLocalNotificationsPlugin.cancelAll();
debugPrint("CHECK NOTI");
        showFlutterNotification(message, true,context);
      }
    });

    var initialzationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    //when app in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;

      AndroidNotification? android = message.notification?.android;

      log("Njdfh :$notification");
      log("Njdfh :${message.data["image"]}");
      if (android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel!.id,
              channel!.name,
              channelDescription: channel!.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: '@mipmap/ic_launcher',
              showProgress: true,
            ),
          ),
        );
      }
      // ignore: unnecessary_null_comparison
      log("notification1 : ${message.data}");
      flutterLocalNotificationsPlugin.cancelAll();

      showFlutterNotification(message, false,context);
    });

    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      log('A new onMessageOpenedApp event was published!');
      log("onMessageOpenedApp: $message");
      flutterLocalNotificationsPlugin.cancelAll();
      AndroidNotification? android = message.notification?.android;
      if (android != null) {
        showFlutterNotification(message, true,context);
      }
    });

    requestPermissions(context);
  }

  void showFlutterNotification(RemoteMessage message, isOpen,context) async {
    RemoteNotification? notification = message.notification;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification!.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel!.id,
          channel!.name,
          channelDescription: channel!.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }


  requestPermissions(BuildContext context) async {
    NotificationSettings settings =
    await FirebaseMessaging.instance.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool(session.notificationPermission, true);
      context.pushNamed(RouteName.dashboard);
    }

    debugPrint("settings.authorizationStatus: ${settings.authorizationStatus}");
  }
}
