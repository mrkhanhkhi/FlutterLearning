import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/favorite_provider.dart';
import 'package:mealicious_prov/widgets/latest_card.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: false);
    favoritesProvider.getFeed();
    return Consumer<FavoritesProvider>(
      builder: (BuildContext context, favoritesProvider, Widget child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Favorites",
            ),
          ),
          body: favoritesProvider.posts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/empty.png",
                        height: 300,
                        width: 300,
                      ),
                      Text(
                        "Nothing is here",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  shrinkWrap: true,
                  itemCount: favoritesProvider.posts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 200 / 340,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    MealDetail meal = MealDetail.fromJson(
                        favoritesProvider.posts[index]["item"]);
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: LatestCard(
                        img: meal.strMealThumb,
                        meal: meal,
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
