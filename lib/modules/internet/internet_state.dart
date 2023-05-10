part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetSuccess extends InternetState {}

class InternetFailure extends InternetState {}
