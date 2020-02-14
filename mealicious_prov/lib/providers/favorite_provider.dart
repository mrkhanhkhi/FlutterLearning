import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/database/favorite_db.dart';
import 'package:mealicious_prov/data/model/category.dart';
import 'package:mealicious_prov/data/model/latest_meal.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/data/network/api.dart';

class FavoriteProvider with ChangeNotifier {
  MealDetail meal;
  bool faved = false;
  var favDB = FavoriteDB();

  getFeeds() async {
    checkFav();
  }

  addFav() async {
    await favDB.add({"id": meal.idMeal, "item": meal.toJson()});
    print('added: ${meal.idMeal}');
    checkFav();
  }

  checkFav() async {
    List m = await favDB.check({"id": meal.idMeal});
    if (m.isNotEmpty) {
      setFaved(true);
    } else {
      setFaved(false);
    }
  }

  removeFav() async {
    favDB.remove({"id": meal.idMeal}).then((v) {
      print(v);
      checkFav();
    });
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
