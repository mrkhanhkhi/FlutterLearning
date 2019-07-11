import 'package:flutter/material.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/models/meal_model.dart';

class RecipeCard extends StatelessWidget {

  final Recipe recipe;
  final Function onPressed;

  RecipeCard(
      {@required this.recipe,
        @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                child: Image.network(
                  recipe.image,
                  width: 150,
                  height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    recipe.label,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
