import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/database/favorite_db.dart';
import 'package:mealicious_prov/data/model/category.dart';
import 'package:mealicious_prov/data/model/latest_meal.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/data/network/api.dart';

class DetailsProvider with ChangeNotifier {
  MealDetail meal;
  bool faved = false;
  var favDB = FavDB();

  getFeeds() async {
    checkFav();
  }

  checkFav() async {
    var check = await favDB.check(meal);
    if (check) {
      setFaved(true);
    } else {
      setFaved(false);
    }
  }

  addFav() async {
    await favDB.insert(meal);
    checkFav();
  }

  removeFav() async {
    favDB.delete(meal);
    checkFav();
  }

  void setFaved(value) {
    faved = value;
    notifyListeners();
  }

  void setMeal(value) {
    meal = value;
    notifyListeners();
  }
}
