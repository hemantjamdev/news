import 'package:flutter/material.dart';
import 'package:news/routes.dart';

import 'home_page.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onRouteGenerate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: HomePage(),
    );
  }
}
