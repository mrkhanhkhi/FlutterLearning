import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/detail_provider.dart';
import 'package:provider/provider.dart';

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
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  meal.strMeal,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {/* ... */},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(height: 1200.0, color: Colors.teal),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
