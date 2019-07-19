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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${recipe.digest[i].label}',
                  style: new TextStyle(
                      fontSize: 15.0,
//                  fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(width: 80.0),
                Text(
                  '${recipe.digest[i].total.round().toString()} ${recipe.digest[i].unit}',
                    textAlign: TextAlign.right,
                  style: new TextStyle(

                      fontSize: 15.0,
//                  fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),

              ],
            )
          );
        }
        return new ExpansionTile(
          title: new Text(
            recipe.digest[i].label,
            style: new TextStyle(
                fontSize: 15.0,
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
    List<Widget> subTiles = [];
    if (subList == null) {
      return new ListTile(
          title: Text('')
      );
    }
    subList.forEach((sub) {
        subTiles.add(new ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${sub.label}',
                style: new TextStyle(
                    fontSize: 15.0,
//                  fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(width: 80.0),
              Text(
                '${sub.total.round().toString()} ${sub.unit}',
                textAlign: TextAlign.right,
                style: new TextStyle(

                    fontSize: 15.0,
//                  fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),

              ],
            )
          )
        );
    });
    return Column(children: subTiles);
  }
}



