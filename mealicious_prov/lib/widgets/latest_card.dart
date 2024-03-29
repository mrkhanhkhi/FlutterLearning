import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class LatestCard extends StatelessWidget {
  final String img;
  final MealDetail meal;

  LatestCard({
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
      width: 120,
      child: Column(children: [
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
              // Provider.of<DetailsProvider>(context, listen: false).setEntry(entry);
              // Provider.of<DetailsProvider>(context, listen: false).getFeed(entry.author.uri.t);
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.rightToLeft,
              //     child: Details(
              //       entry: entry,
              //       imgTag: imgTag,
              //       titleTag: titleTag,
              //       authorTag: authorTag,
              //     ),
              //   ),
              // );
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
        Expanded(
          child: Text(meal.strMeal,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
              overflow: TextOverflow.fade),
        )
      ]),
    );
  }
}
