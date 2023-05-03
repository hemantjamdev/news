import 'dart:developer';

import 'package:news/constants/strings.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class API {
  static NewsAPI newsAPI = NewsAPI(Strings.apikey);

  static Future getNews() async {
    return await newsAPI.getTopHeadlines(country: "in");
  }
}
