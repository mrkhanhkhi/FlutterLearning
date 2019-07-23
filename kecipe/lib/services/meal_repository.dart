import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';

class MealRepository {
  Future<RecipeModel> getMeals(String mealType) {
    MealApiProvider _mealApiProvider = MealApiProvider();
    return _mealApiProvider.getMeals(mealType);
  }
}