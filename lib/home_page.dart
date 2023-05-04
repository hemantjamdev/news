import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/modules/category/category_list_page.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'package:news/modules/headlines/headline_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("-----> home page called <------");
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
          onPressed: API.getNews,
        ),*/
      //  appBar: AppBar(title: const Text("news")),
      body: TabBarView(
          controller: tabController,
          children: [
            BlocProvider<HeadlineBloc>(
              create: (context) => HeadlineBloc(),
              child: const HeadLinePage(),
            ),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(),
              child: CategoryPage(),
            )
          ]),
      bottomNavigationBar: TabBar(
        controller: tabController,
        tabs: [
          Tab(icon: Icon(Icons.home),
            child: Text("home"),
          ),
          Tab(
            icon: Icon(Icons.category),
            child: Text("cate"),
          ),
        ],
      ),
    );
  }
}
