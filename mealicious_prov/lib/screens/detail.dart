import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/detail_provider.dart';
import 'package:mealicious_prov/providers/shopping_cart_provider.dart';
import 'package:mealicious_prov/widgets/ingredients.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

class MealDetails extends StatelessWidget {
  final MealDetail meal;

  const MealDetails({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ingredients = [
      meal.strIngredient1,
      meal.strIngredient2,
      meal.strIngredient3,
      meal.strIngredient4,
      meal.strIngredient5,
      meal.strIngredient6,
      meal.strIngredient7,
      meal.strIngredient8,
      meal.strIngredient9,
      meal.strIngredient10,
      meal.strIngredient11,
      meal.strIngredient12,
      meal.strIngredient13,
      meal.strIngredient14,
      meal.strIngredient15,
      meal.strIngredient16,
      meal.strIngredient17,
      meal.strIngredient18,
      meal.strIngredient19,
      meal.strIngredient20
    ].where((ingredient) => ingredient != null && ingredient != '').toList();

    // var measure = [
    //   meal.strMeasure1,
    //   meal.strMeasure2,
    //   meal.strMeasure3,
    //   meal.strMeasure4,
    //   meal.strMeasure5,
    //   meal.strMeasure6,
    //   meal.strMeasure7,
    //   meal.strMeasure8,
    //   meal.strMeasure9,
    //   meal.strMeasure10,
    //   meal.strMeasure11,
    //   meal.strMeasure12,
    //   meal.strMeasure13,
    //   meal.strMeasure14,
    //   meal.strMeasure15,
    //   meal.strMeasure16,
    //   meal.strMeasure17,
    //   meal.strMeasure18,
    //   meal.strMeasure19,
    //   meal.strMeasure20
    // ].where((measure) => measure != null && measure != '').toList();

    return Consumer<DetailsProvider>(builder: (context, detailProvider, child) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                expandedHeight: 350.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: null,
                  background: AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: CachedNetworkImage(
                          imageUrl: meal.strMealThumb, fit: BoxFit.fill)),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () async {
                      if (detailProvider.faved) {
                        detailProvider.removeFav();
                      } else {
                        detailProvider.addFav();
                      }
                    },
                    icon: Icon(
                      detailProvider.faved ? Icons.favorite : Feather.heart,
                      color: detailProvider.faved
                          ? Colors.red
                          : Theme.of(context).iconTheme.color,
                    ),
                  ),
                ]),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      meal.strMeal,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Expanded(
                                      child: Column(
                                    children: <Widget>[
                                      meal.strTags != null
                                          ? Wrap(
                                              spacing: 6.0,
                                              runSpacing: 6.0,
                                              children: meal.strTags
                                                  .split(',')
                                                  .map((String text) =>
                                                      ActionChip(
                                                        backgroundColor:
                                                            RandomColor()
                                                                .randomColor(),
                                                        label: Text(
                                                          text,
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ))
                                                  .toList(),
                                            )
                                          : Container(),
                                      Container(
                                        width: 500,
                                        height: 70,
                                        child: FlatButton(
                                          color: Colors.red,
                                          onPressed: () {},
                                          child: Text(
                                            "Watch Video",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 600,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 20, 50),
                                              child: Align(
                                                alignment: Alignment(-1, 0),
                                                child: Text(
                                                  'Ingredients',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  itemCount: ingredients.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    Provider.of<ShoppingCartProvider>(
                                                            context,
                                                            listen: false)
                                                        .setIngredient(
                                                            ingredients[index]);
                                                    Provider.of<ShoppingCartProvider>(
                                                            context,
                                                            listen: false)
                                                        .getFeeds();
                                                    if (ingredients[index] !=
                                                        null) {
                                                      return Card(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Ingredients(
                                                                ingredient:
                                                                    ingredients[
                                                                        index],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Container();
                                                    }
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
