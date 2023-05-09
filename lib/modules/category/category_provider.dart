
import 'package:news/API/api.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/source.dart';

class CategoryProvider {
  List<Article> newsList = <Article>[];
  List<Source> sourceList = <Source>[];

  Future<List<Article>> getCategoryNews(String cateName) async {
    return newsList = await API.getCategoryNews(cateName);
  }
  Future<List<Article>> search(String query, String category) async {
    return newsList = await API.search(query, category);
  }

}
