import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/splash.dart';
import 'package:news/routes.dart';
import 'package:sizer/sizer.dart';

class NewsApp extends StatelessWidget {
  NewsApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          navigatorKey: navigatorKey,
          title: Strings.title,
          onGenerateRoute: Routes.onRouteGenerate,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
          home: const Splash());
    });
  }
}
