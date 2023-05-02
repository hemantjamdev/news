import 'dart:developer';

import 'package:news/constants/strings.dart';
import 'package:news/modules/headlines/model/news_model.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class API {
  static List<Articles> newList = <Articles>[];
  static NewsAPI newsAPI = NewsAPI(Strings.apikey);

  static Future<List<Article>> getNews() async {
    return await  newsAPI.getTopHeadlines(country: "in");
  }
}
