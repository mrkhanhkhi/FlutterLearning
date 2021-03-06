import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/database/favorite_db.dart';
import 'package:mealicious_prov/data/model/category.dart';
import 'package:mealicious_prov/data/model/latest_meal.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/data/network/api.dart';

class HomeProvider with ChangeNotifier {
  String messsage;
  LatestMeals latest = LatestMeals();
  Categories categories = Categories();
  bool loading = true;
  MealDetail meal;
  bool faved = false;
  var favDB = FavoriteDB();

  getFeeds() async {
    setLoading(true);
    Api.getLatestMeals(Api.latest).then((latest) {
      setLatest(latest);
      setLoading(false);
    }).catchError((e) {
      throw (e);
    });
  }

  bool isLoading() {
    return loading;
  }


  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setLatest(value) {
    latest = value;
    notifyListeners();
  }

  void setMeal(value) {
    meal = value;
    notifyListeners();
  }

  LatestMeals getLatest() {
    return latest;
  }
}
