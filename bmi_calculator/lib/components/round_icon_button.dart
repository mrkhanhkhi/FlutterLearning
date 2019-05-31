import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constant.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  const RoundIconButton({Key key, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(this.icon),
      onPressed: this.onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: kGreyButtonColor,
    );
  }
}