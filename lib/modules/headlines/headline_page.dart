import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'package:news/widgets/search.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../widgets/news_widget.dart';
import '../../widgets/shimmer_box.dart';

class HeadLinePage extends StatefulWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  State<HeadLinePage> createState() => _HeadLinePageState();
}

class _HeadLinePageState extends State<HeadLinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HeadlineBloc>(context).add(FetchHeadlines());
    return Scaffold(
      appBar: AppBar(title: const Text("Headlines")),
      body: Column(
        children: [
          Search(
            onSearch: (query) {
              BlocProvider.of<HeadlineBloc>(context)
                  .add(SearchHeadlines(query, "general"));
            },
          ),
          BlocBuilder<HeadlineBloc, HeadlineState>(
            builder: (context, HeadlineState state) {
              if (state is HeadlineLoading) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, int index) {
                        return loading();
                      }),
                );
              } else if (state is HeadlineLoaded) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.articles.length,
                      itemBuilder: (context, int index) {
                        Article news = state.articles[index];
                        return NewsWidget(
                          article: news,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        );
                      }),
                );
              } else {
                return const Center(
                    child: Text("something went wrong ! please try again"));
              }
            },
          ),
        ],
      ),
    );
  }
}
