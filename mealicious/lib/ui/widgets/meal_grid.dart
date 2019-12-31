import 'package:flutter/material.dart';
import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:mealicious/ui/latest_meals/bloc/latest_meals_state.dart';
import 'package:mealicious/ui/widgets/grid_item.dart';

class MealGrid extends StatefulWidget {
  MealGrid({Key key, this.state}) : super(key: key);

  final MealLoaded state;

  @override
  _MealGridState createState() => _MealGridState();
}

class _MealGridState extends State<MealGrid> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Center(
      child: Container(
        height: 600.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
                children: widget.state.meals.map<Widget>((MealDetail meal) {
                  return GridItem(
                    meal: meal,
                    onBannerTap: (MealDetail meal) {
                      setState(() {
                        meal.isFavorite = !meal.isFavorite;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
