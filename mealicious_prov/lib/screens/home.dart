import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/app_provider.dart';
import 'package:mealicious_prov/providers/home_provider.dart';
import 'package:mealicious_prov/widgets/latest_card.dart';
import 'package:mealicious_prov/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<HomeProvider>(context);
    return Consumer<HomeProvider>(
      builder: (BuildContext context, app, Widget child) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Mealicious",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            body: homeProvider.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => homeProvider.getFeeds(),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Latest",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          child: Center(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: app.latest.meals.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                MealDetail entry =
                                    homeProvider.latest.meals[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: LatestCard(
                                    img: entry.strMealThumb,
                                    meal: entry,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Meals of the day",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 600,
                          child: Center(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.vertical,
                              itemCount: homeProvider.latest.meals.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                MealDetail entry =
                                    homeProvider.latest.meals[index];
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: MealCard(
                                    img: entry.strMealThumb,
                                    meal: entry,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
      },
    );
  }
}
