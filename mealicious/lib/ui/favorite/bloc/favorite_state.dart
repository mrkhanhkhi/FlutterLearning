import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavoriteState {}

class InitialFavoriteState extends FavoriteState {
  final List<MealDetail> favoriteMeals = [];
}

class FavoriteMealsLoading extends FavoriteState {}

class FavoriteMealsLoaded extends FavoriteState {
  final List<MealDetail> favoriteMeals;

  FavoriteMealsLoaded(this.favoriteMeals);
}

class FavoriteMealsError extends FavoriteState {}
