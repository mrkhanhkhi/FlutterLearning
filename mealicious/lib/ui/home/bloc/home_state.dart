import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:mealicious/data/model/home/latest_meals.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class MealLoading extends HomeState {}

class MealLoaded extends HomeState {
  final LatestMeals meals;
  MealLoaded(Future<LatestMeals> fetchResults, {this.meals});
}

class MealLoadEror extends HomeState {
  @override
  List<Object> get props => [];
}
