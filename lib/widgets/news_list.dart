import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../widgets/news_widget.dart';
class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
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
          }),
    );
  }
}

