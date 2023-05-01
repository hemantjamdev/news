import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news/API/api.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: API.getNews,
      ),
      appBar: AppBar(title: Text("news")),
      body: Container(),
    );
  }
}
