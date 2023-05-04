part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class SourceLoaded extends CategoryState {
  final List<Source>sources;

  SourceLoaded({required this.sources});
}

class SourceLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Article> articles;

  CategoryLoaded({required this.articles});
}
