import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/constants/strings.dart';
import 'package:news/modules/internet/internet_bloc.dart';
import 'package:news/presentation/splash.dart';
import 'package:news/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/home_page.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onRouteGenerate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      home: const Splash()
    );
  }
}
