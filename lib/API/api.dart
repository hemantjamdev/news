
import 'package:news/constants/strings.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class API {
  static NewsAPI newsAPI = NewsAPI(Strings.apikey);

  static Future getNews() async {
    return await newsAPI.getTopHeadlines(country: "in");
  }

  static Future search(String query, String category) async {
    return await newsAPI.getTopHeadlines(
      country: "in",
      query: query,
      category: category,
    );
  }

  static Future getSourceList() async {
    return await newsAPI.getSources( country: "in");
  }

  static Future getCategoryNews(String category) async {
    return await newsAPI.getTopHeadlines(country: "in", category: category);
  }
}
