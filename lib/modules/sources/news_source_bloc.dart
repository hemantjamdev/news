
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/sources/source_provider.dart';
import 'package:news_api_flutter_package/model/source.dart';

part 'news_source_event.dart';

part 'news_source_state.dart';

class NewsSourceBloc extends Bloc<NewsSourceEvent, NewsSourceState> {
  SourceRepository repo = SourceRepository();
  List<Source> sourceList = <Source>[];

  NewsSourceBloc() : super(NewsSourceInitial()) {
    on<NewsSourceEvent>((event, emit) async {
      if (event is GetSources) {
        emit(SourceLoading());
        sourceList = await repo.getSource();
        sourceList.isNotEmpty
            ? emit(SourceLoaded(articles: sourceList))
            : emit(SourceLoading());
      }
    });
  }
}
