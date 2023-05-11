import 'package:news_api_flutter_package/model/source.dart';

import '../../API/api.dart';

class SourceRepository {
  List<Source> newsList = <Source>[];

  Future<List<Source>> getSource() async {
    return newsList = await API.getSourceList();
  }
}
