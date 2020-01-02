import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavoriteEvent {}

class LoadFavoriteMeals extends FavoriteEvent {}

class AddFavoriteMeal extends FavoriteEvent {
  final MealDetail meal;

  AddFavoriteMeal(this.meal);
}

class RemoveFavoriteMeal extends FavoriteEvent {
  final MealDetail meal;

  RemoveFavoriteMeal(this.meal);
}
