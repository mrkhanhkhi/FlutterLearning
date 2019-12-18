import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {}

abstract class FetchInitated extends HomeEvent {}

class LoadMeal extends HomeEvent {}
