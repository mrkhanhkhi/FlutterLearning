import 'package:flutter/material.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kecipe/Views/nutrition_pie_chart.dart';

class RecipeNutrition extends StatelessWidget {

  final Recipe recipe;
  final double padding;

  RecipeNutrition({this.recipe, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NutritionPieChart(recipe: recipe),
        ],
      ),
    );
  }
}
