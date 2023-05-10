part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetLoss extends InternetEvent {}
class InternetGained extends InternetEvent {}
