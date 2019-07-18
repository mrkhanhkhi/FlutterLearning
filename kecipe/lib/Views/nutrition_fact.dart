import 'package:flutter/material.dart';
import 'package:kecipe/models/meal_model.dart';


class NutritionFact extends StatelessWidget {
  final Recipe recipe;
  NutritionFact({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:
      expendableList()
      );
  }

  Widget expendableList(){
    return new ListView.builder(
      itemCount: recipe.digest.length,
      itemBuilder: (context, i) {
        if (recipe.digest[i].sub == null) {
          return new ListTile(
            title: Text(
              recipe.digest[i].label,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          );
        }
        return new ExpansionTile(
          title: new Text(
            recipe.digest[i].label,
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          children: <Widget>[
            new Column(
              children: <Widget>[
                subList(recipe.digest[i].sub)
              ],
            ),
          ],
        );
      },
    );
  }

  Widget subList(List<Sub> subList) {
    if (subList == null) {
      return new ListTile(
          title: Text('')
      );
    }
    subList.map((sub) {
      new ListTile(
        title: Text(sub.label)
      );
    });
  }
}



