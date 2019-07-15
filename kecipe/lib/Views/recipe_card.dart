import 'package:flutter/material.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        clipBehavior: Clip.antiAlias,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 12.0,
              child: CachedNetworkImage(
                placeholder: (context, url) => new  SizedBox(
                  child: CircularProgressIndicator(),
                  height: 20.0,
                  width: 20.0,
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                imageUrl: recipe.image,
                fit: BoxFit.cover,
                ),
            ),
            SizedBox(height: 5.0),
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 10.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      recipe.label,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Constants.lightAccent,
                      fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Spacer(
                        flex: 20,
                      ),
                      Icon(
                        Icons.lightbulb_outline,
                        size: 24.0,
                      ),
                      Spacer(),
                      Text(
                        '${recipe.calories.round().toString()} kcal',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Constants.lightAccent,
//                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      Spacer(flex: 20),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      Spacer(
                        flex: 20,
                      ),
                      Icon(
                        Icons.restaurant,
                        size: 20.0,
                      ),
                      Spacer(),
                      Text(
                        '${recipe.yield.toString()} servings',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Constants.lightAccent,
//                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
