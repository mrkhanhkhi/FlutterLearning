
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constant.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                buttonTitle,
                style: kcalculateTextStyle,
              ),
            ],
          ),
        color: kBottomContainerColor,
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}