part of 'headline_bloc.dart';

@immutable
abstract class HeadlineState {}

class HeadlineInitial extends HeadlineState {}

class HeadlineLoading extends HeadlineState {}

class HeadlineLoaded extends HeadlineState {
  final List<Article> articles;

  HeadlineLoaded({required this.articles});
}
