import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/home_provider.dart';
import 'package:mealicious_prov/widgets/latest_card.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
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
                        Container(
                          height: 200,
                          child: Center(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: homeProvider.latest.meals.length,
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
                      ],
                    ),
                  ));
      },
    );
  }
}
