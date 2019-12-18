import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class MealLoading extends HomeState {}

class MealLoaded extends HomeState {
  final List<MealDetail> meals;
  MealLoaded({this.meals});
}

class MealLoadEror extends HomeState {
  @override
  List<Object> get props => [];
}
