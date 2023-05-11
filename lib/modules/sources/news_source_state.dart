part of 'news_source_bloc.dart';

@immutable
abstract class NewsSourceState {}

class NewsSourceInitial extends NewsSourceState {}

class SourceLoading extends NewsSourceState {}

class SourceLoaded extends NewsSourceState {
  final List<Source> articles;

  SourceLoaded({required this.articles});
}