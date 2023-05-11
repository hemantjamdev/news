import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/splash.dart';
import 'package:news/routes.dart';
import 'package:sizer/sizer.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: Strings.title,
          onGenerateRoute: Routes.onRouteGenerate,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
          home: const Splash());
    });
  }
}
