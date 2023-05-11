import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('android_icon');
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
    DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onBackgroundNotificationTap,
        onDidReceiveBackgroundNotificationResponse:
            _onBackgroundNotificationTap);
  }

  Future showNotification(
      {int id = 1,
      String title = "title",
      String body = "body",
      String? payload}) async {
    return flutterLocalNotificationsPlugin
        .show(id, title, body, notificationDetails(), payload: payload);
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          "channelId",
          "channelName",
          importance: Importance.max,
          fullScreenIntent: true,
        ),
        iOS: DarwinNotificationDetails());
  }

  static Future<void> _onBackgroundNotificationTap(
      NotificationResponse notificationResponse) async {}

}
