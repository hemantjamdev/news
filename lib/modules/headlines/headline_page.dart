import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'package:news/modules/headlines/news_model.dart';
import 'package:news/widgets/headline_loading.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../widgets/news_widget.dart';

class HeadLinePage extends StatefulWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  State<HeadLinePage> createState() => _HeadLinePageState();
}

class _HeadLinePageState extends State<HeadLinePage> {
  @override
  void initState() {
    //  log("-----> headline page called <------");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HeadlineBloc>(context).add(FetchHeadlines());
    log("-----> headline page called <------");
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          HeadlineBloc bloc = HeadlineBloc();
          bloc.add(FetchHeadlines());
        },
      ),*/
      appBar: AppBar(title: const Text("Headlines")),
      body: BlocBuilder<HeadlineBloc, HeadlineState>(
        // bloc: HeadlineBloc(),
        builder: (context, HeadlineState state) {
          if (state is HeadlineLoading) {
            return headLineLoading();
          } else if (state is HeadlineLoaded) {
            return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, int index) {
                  Article news = state.articles[index];
                  return NewsWidget(article: news);
                });
          } else {
            return const Center(
                child: Text("something went wrong ! please try again"));
          }
        },
      ),
    );
  }
}
