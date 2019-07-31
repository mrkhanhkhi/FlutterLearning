import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kecipe/Views/recipe_detail.dart';
import 'package:kecipe/services/bloc_provider.dart';
import 'package:kecipe/services/favorite_bloc.dart';
import 'package:kecipe/services/meal_favorite_bloc.dart';

class RecipeCard extends StatefulWidget {
  RecipeCard({
    Key key,
    @required this.recipe,
    @required this.favoritesStream,
    @required this.onFavoriteButtonPressed,
    @required this.onPressed,
    this.noHero: false,
  }) : super(key: key);

  final Recipe recipe;
  final VoidCallback onFavoriteButtonPressed;
  final VoidCallback onPressed;
  final Stream<List<Recipe>> favoritesStream;
  final bool noHero;

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  MealFavoriteBloc _bloc;
  FavoriteBloc _favoriteBloc;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _createBloc();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    List<Widget> children = <Widget>[
      ClipRect(
        clipper: _SquareClipper(),
        child: widget.noHero
            ? CachedNetworkImage(
                placeholder: (context, url) => new SizedBox(
                      child: CircularProgressIndicator(),
                      height: 20.0,
                      width: 20.0,
                    ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                imageUrl: widget.recipe.image,
                fit: BoxFit.cover,
              )
            : Hero(
                child: CachedNetworkImage(
                  placeholder: (context, url) => new SizedBox(
                        child: CircularProgressIndicator(),
                        height: 20.0,
                        width: 20.0,
                      ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  imageUrl: widget.recipe.image,
                  fit: BoxFit.cover,
                ),
//        tag: 'movie_${widget.movieCard.id}',
              ),
      ),
      Container(
        decoration: _buildGradientBackground(),
        padding: const EdgeInsets.only(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: _buildTextualInfo(widget.recipe),
      ),
    ];

    children.add(
      StreamBuilder<bool>(
          stream: _bloc.outIsFavorite,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onTap: () {
                        favoriteBloc.inRemoveFavorite.add(widget.recipe);
                      },
                    )),
              );
            } else {
              return Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      onTap: () {
                        favoriteBloc.inAddFavorite.add(widget.recipe);
                      },
                    )),
              );;
            }
          }),
    );

    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: children,
        ),
      ),
    );
  }

  void _createBloc() {
    _bloc = MealFavoriteBloc(widget.recipe);
    _favoriteBloc = FavoriteBloc();

    // Simple pipe from the stream that lists all the favorites into
    // the BLoC that processes THIS particular movie
    _subscription = widget.favoritesStream.listen(_bloc.inFavorites.add);
  }

  void _disposeBloc() {
    _subscription.cancel();
    _bloc.dispose();
    _favoriteBloc.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _disposeBloc();
  }
}

class _SquareClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

Widget _buildTextualInfo(Recipe recipe) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        recipe.label,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 4.0),
      Text(
        recipe.calories.toString(),
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.white70,
        ),
      ),
    ],
  );
}

BoxDecoration _buildGradientBackground() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: <double>[0.0, 0.7, 0.7],
      colors: <Color>[
        Colors.black,
        Colors.transparent,
        Colors.transparent,
      ],
    ),
  );
}

//class RecipeCard1 extends StatelessWidget {
//
//  final Recipe recipe;
//  final Function onFavoriteButtonPressed;
//  final bool inFavorites;
//
//  RecipeCard1(
//      {@required this.recipe,
//     @required this.inFavorites,
//        @required this.onFavoriteButtonPressed});
//
//  @override
//  Widget build(BuildContext context) {
//
//    RawMaterialButton _buildFavoriteButton() {
//      return RawMaterialButton(
//        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
//        onPressed: () => onFavoriteButtonPressed(recipe.label),
//        child: Icon(
//          // Conditional expression:
//          // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
//          inFavorites == true ? Icons.favorite : Icons.favorite_border,
//        ),
//        elevation: 2.0,
//        fillColor: Colors.white,
//        shape: CircleBorder(),
//      );
//    }
//
//    return GestureDetector(
//      onTap: () =>  Navigator.of(context).push(
//          MaterialPageRoute(builder: (BuildContext context) {
//              return RecipeDetail(recipe: recipe,);
//            }
//          )
//      ),
//      child: Card(
//        clipBehavior: Clip.antiAlias,
//        elevation: 1.0,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        color: Colors.white,
//        child: Column(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                AspectRatio(
//                  aspectRatio: 18.0 / 12.0,
//                  child: CachedNetworkImage(
//                    placeholder: (context, url) => new  SizedBox(
//                      child: CircularProgressIndicator(),
//                      height: 20.0,
//                      width: 20.0,
//                    ),
//                    errorWidget: (context, url, error) => new Icon(Icons.error),
//                    imageUrl: recipe.image,
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                Positioned(
//                  child: _buildFavoriteButton(),
//                  top: 2.0,
//                  right: 2.0,
//                ),
//              ],
//            ),
//            SizedBox(height: 5.0),
//            new Padding(
//              padding: EdgeInsets.fromLTRB(4.0, 10.0, 4.0, 2.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      recipe.label,
//                      style: TextStyle(
//                        fontSize: 20.0,
//                        color: Constants.lightAccent,
//                      fontWeight: FontWeight.bold,
//                      ),
//                      maxLines: 1,
//                      softWrap: true,
//                      textAlign: TextAlign.center,
//                    ),
//                  ),
//                  SizedBox(height: 5.0),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Spacer(
//                        flex: 20,
//                      ),
//                      Icon(
//                        Icons.lightbulb_outline,
//                        size: 24.0,
//                      ),
//                      Spacer(),
//                      Text(
//                        '${recipe.calories.round().toString()} kcal',
//                        style: TextStyle(
//                          fontSize: 20.0,
//                          color: Constants.lightAccent,
////                          fontWeight: FontWeight.bold,
//                        ),
//                        maxLines: 2,
//                        softWrap: true,
//                        textAlign: TextAlign.center,
//                      ),
//                      Spacer(flex: 20),
//                    ],
//                  ),
//                  SizedBox(height: 5.0),
//                  Row(
//                    children: <Widget>[
//                      Spacer(
//                        flex: 20,
//                      ),
//                      Icon(
//                        Icons.restaurant,
//                        size: 20.0,
//                      ),
//                      Spacer(),
//                      Text(
//                        '${recipe.yield.toString()} servings',
//                        style: TextStyle(
//                          fontSize: 20.0,
//                          color: Constants.lightAccent,
////                          fontWeight: FontWeight.bold,
//                        ),
//                        maxLines: 2,
//                        softWrap: true,
//                        textAlign: TextAlign.center,
//                      ),
//                      Spacer(
//                        flex: 20,
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//
//          ],
//        ),
//      ),
//    );
//  }
//}
