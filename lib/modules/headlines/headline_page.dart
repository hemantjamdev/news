import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'package:news/widgets/news_loading.dart';
import 'package:news/widgets/search.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../widgets/news_widget.dart';

class HeadLinePage extends StatelessWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HeadlineBloc>(context)
        .add(FetchHeadlines());
    return Scaffold(
      appBar: AppBar(title: const Text("Top Headlines")),
      body: Column(
        children: [
          Search(
            onSearch: (query) {
              BlocProvider.of<HeadlineBloc>(context).add(
                SearchHeadlines(query, "general"),
              );
            },
          ),
          BlocBuilder<HeadlineBloc, HeadlineState>(
            builder: (context, HeadlineState state) {
              if (state is HeadlineLoading) {
                return const NewsLoading();
              } else if (state is HeadlineLoaded) {
                return HeadlineNewsList(
                  articles: state.articles,
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: Text("something went wrong ! please try again"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class HeadlineNewsList extends StatelessWidget {
  final List<Article> articles;

  const HeadlineNewsList({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadlineBloc, HeadlineState>(
      bloc: HeadlineBloc(),
      builder: (context, HeadlineState state) {
        return Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, int index) {
              Article news = articles[index];
              return NewsWidget(
                article: news,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              );
            },
          ),
        );
      },
    );
  }
}
