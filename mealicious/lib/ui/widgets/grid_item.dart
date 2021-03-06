import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealicious/common/centered_message.dart';
import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mealicious/ui/favorite/bloc/bloc.dart';

typedef BannerTapCallback = void Function(MealDetail meal);

class GridItem extends StatelessWidget {
  GridItem({
    Key key,
    @required this.meal,
    @required this.onBannerTap,
  })  : assert(meal != null),
        assert(onBannerTap != null),
        super(key: key);

  final MealDetail meal;
  final BannerTapCallback
      onBannerTap; // User taps on the photo's header or footer.

  void showMeal(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final IconData icon = meal.isFavorite ? Icons.star : Icons.star_border;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
      child: Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black45,
                  title: _GridTitleText(meal.strMeal),
                  subtitle: _GridTitleText(meal.strCategory),
                  trailing: FavoriteButton(
                      onBannerTap: onBannerTap, meal: meal, icon: icon),
                ),
                child: image(context),
              ))),
    );
  }

  Widget image(context) => GestureDetector(
        onTap: () {
          showMeal(context);
        },
        child: CachedNetworkImage(
          imageUrl: meal.strMealThumb,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.white),
        ),
        child: InkWell(
          onTap: () {},
        ),
      ),
    );
    ;
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key key,
    @required this.onBannerTap,
    @required this.meal,
    @required this.icon,
  }) : super(key: key);

  final BannerTapCallback onBannerTap;
  final MealDetail meal;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      if (state is FavoriteMealsLoaded) {
        return GestureDetector(
            onTap: () {
              onBannerTap(meal);
              BlocProvider.of<FavoriteBloc>(context).add(AddFavoriteMeal(meal));
            },
            child: Icon(
              icon,
              color: Colors.white,
            ));
      }
    });
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}
