part of 'headline_bloc.dart';

@immutable
abstract class HeadlineEvent {}

class FetchHeadlines extends HeadlineEvent {}
class SearchHeadlines extends HeadlineEvent {
  final String query;
  final String category;

  SearchHeadlines(this.query, this.category);
}
