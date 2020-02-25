import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/database/cart_db.dart';
import 'package:mealicious_prov/data/database/favorite_db.dart';
import 'package:mealicious_prov/data/model/category.dart';
import 'package:mealicious_prov/data/model/latest_meal.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/data/network/api.dart';

class ShoppingCartProvider with ChangeNotifier {
  MealDetail meal;
  String ingredient;
  bool added = false;
  var cartDB = CartDB();

  getFeeds() async {
    checkCart();
  }

  addToCart() async {
    await cartDB.add({"ingredient": ingredient});
    print('added: $ingredient');
    checkCart();
  }

  checkCart() async {
    List i = await cartDB.check({"ingredient": ingredient});
    if (i.isNotEmpty) {
      setAdded(true);
    } else {
      setAdded(false);
    }
  }

  removeFromCart() async {
    cartDB.remove({"ingredient": ingredient}).then((v) {
      print(v);
      checkCart();
    });
  }

  void setAdded(value) {
    added = value;
    notifyListeners();
  }

  void setIngredient(value) {
    ingredient = value;
    notifyListeners();
  }
}
