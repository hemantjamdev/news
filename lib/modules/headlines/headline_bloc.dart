
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_flutter_package/model/article.dart';

import 'headline_provider.dart';

part 'headline_event.dart';

part 'headline_state.dart';

class HeadlineBloc extends Bloc<HeadlineEvent, HeadlineState> {
  HeadlineProvider repo = HeadlineProvider();
  List<Article> newsList = <Article>[];

  HeadlineBloc() : super(HeadlineInitial()) {
    on<HeadlineEvent>(
      (event, emit) async {
        if (event is FetchHeadlines) {
          emit(HeadlineLoading());
          newsList = await repo.getHeadLine();
          newsList.isNotEmpty
              ? emit(HeadlineLoaded(articles: newsList))
              : emit(HeadlineLoading());
        } else if (event is SearchHeadlines) {
          emit(HeadlineLoading());
          newsList = await repo.search(event.query, event.category);
          newsList.isNotEmpty
              ? emit(HeadlineLoaded(articles: newsList))
              : emit(HeadlineLoading());
        }
      },
    );
  }
}
