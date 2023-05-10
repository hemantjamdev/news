import 'package:flutter/material.dart';
import 'package:news/presentation/splash.dart';
import 'package:news/routes.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News",
      onGenerateRoute: Routes.onRouteGenerate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      home: const Splash()
    );
  }
}
