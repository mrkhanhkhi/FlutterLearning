import 'package:meta/meta.dart';

@immutable
abstract class LatestMealsEvent {}

class StartLoadMeal extends LatestMealsEvent {}

class LoadMeal extends LatestMealsEvent {}

