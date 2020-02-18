import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:mealicious_prov/providers/detail_provider.dart';
import 'package:mealicious_prov/screens/detail.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MealCard extends StatelessWidget {
  final String img;
  final MealDetail meal;

  MealCard({
    Key key,
    @required this.img,
    @required this.meal,
  }) : super(key: key);

  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 350,
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              onTap: () {
                Provider.of<DetailsProvider>(context, listen: false)
                    .setMeal(meal);
                Provider.of<DetailsProvider>(context, listen: false).getFeeds();
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: MealDetails(
                        meal: meal,
                      )),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Hero(
                  tag: imgTag,
                  child: CachedNetworkImage(
                    imageUrl: "$img",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/place.png",
                      fit: BoxFit.cover,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 300.0,
            left: 15.0,
            right: 15.0,
            bottom: 0.0,
            child: Text(meal.strMeal,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                overflow: TextOverflow.fade),
          ),
          // Positioned(
          //   right: 20.0,
          //   top: 15.0,
          //   child: IconButton(
          //       onPressed: () async {
          //         if (favedStatus) {
          //           favoriteProvider.removeFav();
          //         } else {
          //           favoriteProvider.addFav();
          //         }
          //       },
          //       icon: Icon(
          //         favedStatus ? Icons.favorite : Feather.heart,
          //         color: favedStatus
          //             ? Colors.red
          //             : Theme.of(context).iconTheme.color,
          //       )),
          // ),
        ],
      ),
    );
  }
}
