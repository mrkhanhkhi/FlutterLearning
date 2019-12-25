import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LatestMealsState {}

class InitialLatestMealsState extends LatestMealsState {}

class MealLoading extends LatestMealsState {}

class MealLoaded extends LatestMealsState {
  final List<MealDetail> meals;
  MealLoaded(this.meals);
}

class MealLoadEror extends LatestMealsState {
  @override
  List<Object> get props => [];
}
