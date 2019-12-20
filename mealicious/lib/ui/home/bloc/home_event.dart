import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {}

class FetchInitated extends HomeEvent {}

class LoadMeal extends HomeEvent {}
