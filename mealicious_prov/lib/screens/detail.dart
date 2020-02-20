import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

class MealDetails extends StatelessWidget {
  final MealDetail meal;

  const MealDetails({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              actions: null,
            ),
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
                                        width: 400,
                                        height: 200,
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
