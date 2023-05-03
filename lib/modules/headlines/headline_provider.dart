import 'dart:developer';

import 'package:news/API/api.dart';
import 'package:news/modules/headlines/news_model.dart';
import 'package:news_api_flutter_package/model/article.dart';

class HeadlineProvider {
  List<Article> newsList = <Article>[];

  Future<List<Article>> getHeadLine() async {
    return newsList = await API.getNews();
  }
}
