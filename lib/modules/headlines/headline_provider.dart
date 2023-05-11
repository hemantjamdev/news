import 'package:news/API/api.dart';
import 'package:news/modules/notification/notification.dart';
import 'package:news_api_flutter_package/model/article.dart';

class HeadlineProvider {
  List<Article> newsList = <Article>[];

  Future<List<Article>> getHeadLine() async {
    if (newsList.isNotEmpty) {
      List<Article> oldList = newsList;
      newsList = await API.getNews();
      if (newsList.first.title != oldList.first.title) {
        NotificationServices().showNotification(
          id: 1,
          title: newsList.first.title.toString(),
          body: newsList.first.description.toString(),
          payload: "",
        );
      }
      return newsList;
    } else {
      return newsList = await API.getNews();
    }
  }

  Future<List<Article>> search(String query, String category) async {
    return newsList = await API.search(query, category);
  }
}
