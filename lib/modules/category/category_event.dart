part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class FetchCategoryDetails extends CategoryEvent {
  final String cateName;

  FetchCategoryDetails(this.cateName);
}

class FetchSourcesList extends CategoryEvent {}

class SearchCategory extends CategoryEvent {
  final String query;
  final String category;

  SearchCategory(this.query, this.category);
}
