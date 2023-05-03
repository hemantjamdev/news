
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'package:news/modules/headlines/headline_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    log("-----> home page called <------");
    return Scaffold(
        /* floatingActionButton: FloatingActionButton(
          onPressed: API.getNews,
        ),*/
      //  appBar: AppBar(title: const Text("news")),
        body: BlocProvider<HeadlineBloc>(
          create: (context) => HeadlineBloc(),
          child: const HeadLinePage(),
        ));
  }
}
