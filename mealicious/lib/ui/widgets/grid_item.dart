import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealicious/data/model/detail/meal_model.dart';

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
    final Widget image = GestureDetector(
      onTap: () {
        showMeal(context);
      },
      child: Hero(
        key: Key(meal.idMeal),
        tag: meal.strTags,
        child: CachedNetworkImage(
          imageUrl: meal.strMealThumb,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );

    final IconData icon = meal.isFavorite ? Icons.star : Icons.star_border;

    return GridTile(
      footer: GestureDetector(
        onTap: () {
          onBannerTap(meal);
        },
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(meal.strMeal),
          subtitle: _GridTitleText(meal.strCategory),
          trailing: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      child: image,
    );
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
