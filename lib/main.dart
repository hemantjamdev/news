import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'modules/notification/notification.dart';
import 'news_app.dart';
import 'package:background_fetch/background_fetch.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initBackgroundFetch();
  NotificationServices().initNotification();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(NewsApp());
}

void initBackgroundFetch() {
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15,
      stopOnTerminate: false,
      startOnBoot: true,
      enableHeadless: true,
      requiresBatteryNotLow: true,
      requiresCharging: false,
      requiresDeviceIdle: false,
      requiresStorageNotLow: false,
    ),
        (String taskId) async {
      log("--> background fetch task started: $taskId <-----");
      await fetchData();
      BackgroundFetch.finish(taskId);
    },
        (String taskId) async {
      log("--> background fetch task failed: $taskId <-----");
      BackgroundFetch.finish(taskId);
    },
  );
  BackgroundFetch.start();
}

Future<void> fetchData() async {
  log("--> fetch data  <-----");
  try {
    HeadlineBloc bloc = HeadlineBloc();
    bloc.add(FetchHeadlines());
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}



/*import 'package:flutter/material.dart';
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
}*/
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
