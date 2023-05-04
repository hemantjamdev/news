import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_provider.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/source.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryProvider repo = CategoryProvider();
  List<Article> newsList = <Article>[];
List<Source>sourceList=<Source>[];
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>(
      (event, emit) async {
        if (event is FetchCategoryDetails) {
          emit(CategoryLoading());
          newsList = await repo.getCategoryNews(event.cateName);
          newsList.isNotEmpty
              ? emit(CategoryLoaded(articles: newsList))
              : emit(CategoryLoading());
        }else if(event is FetchSourcesList){
          emit(SourceLoading());
          sourceList=await repo.
        }
      },
    );
  }
}
