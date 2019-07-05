import 'package:flutter/material.dart';
import 'package:kecipe/common/constant.dart';
class MealTypeCard extends StatelessWidget {
  final String type;
  final String imageName;
  final Function onFavoriteButtonPressed;

  MealTypeCard(
      {@required this.type,
        @required this.imageName,
        @required this.onFavoriteButtonPressed});

  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(type),
        elevation: 2.0,
        fillColor: Constants.lightBG,
        shape: CircleBorder(),
      );
    }

//    Stack _buildTitleSection() {
//      return Stack(
//          children: <Widget>[
//            yourImageWidget,
//            Center(child: Text("someText")),
//          ]
//      )
//    }

    return GestureDetector(
      onTap: () => print("Tapped!"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
//          height: 300,
          child: Card(
            shape: CircleBorder(),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/$imageName',
                fit: BoxFit.fill,
                ),
                Center(child: Text(type)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}