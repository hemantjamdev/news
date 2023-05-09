import 'dart:developer';

import 'package:news/API/api.dart';
import 'package:news/modules/headlines/news_model.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/source.dart';

class CategoryProvider {
  List<Article> newsList = <Article>[];
  List<Source> sourceList = <Source>[];

  Future<List<Article>> getCategoryNews(String cateName) async {
    return newsList = await API.getCategoryNews(cateName);
  }

 /* Future<List<Source>> getSourceList(String cateName) async {
    return sourceList = await API.getSourceList(cateName: cateName);
  }*/
}
