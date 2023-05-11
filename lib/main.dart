import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/notification/notification.dart';
import 'news_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( NewsApp());
}
/*

  await FlutterBackgroundFetch.configure(
    minimumFetchInterval: 15, // Fetch news every 15 minutes
    onBackgroundFetch: backgroundFetchHandler,
    onStop: stopHandler,
    onStart: startHandler,
  );


void backgroundFetchHandler() async {
  // Fetch news and show notification
}

void stopHandler() async {
  // Handle background fetch stopped event
}

void startHandler() async {
  // Handle background fetch started event
}
void startBackgroundFetch() {
  FlutterBackgroundFetch.start();
}
void stopBackgroundFetch() {
  FlutterBackgroundFetch.stop();
}*/
