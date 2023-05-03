import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_flutter_package/model/article.dart';

import 'headline_provider.dart';
import 'news_model.dart';

part 'headline_event.dart';

part 'headline_state.dart';

class HeadlineBloc extends Bloc<HeadlineEvent, HeadlineState> {
  HeadlineProvider repo = HeadlineProvider();
  List<Article> newsList = <Article>[];

  HeadlineBloc() : super(HeadlineInitial()) {
    log("-----> bloc called <------");
    on<HeadlineEvent>(
      (event, emit) async {
        log("-----> on method called <------");
        log("-----> this is current event ${event.toString()} <------");
        if (event is FetchHeadlines) {
          log("-----> if called  <------");
          emit(HeadlineLoading());
          newsList = await repo.getHeadLine();
          newsList.isNotEmpty
              ? emit(HeadlineLoaded(articles: newsList))
              : emit(HeadlineLoading());
        } else {
          log("-----> else called <------");
        }
      },
    );
    log("-----> bloc finished <------");
  }
}
