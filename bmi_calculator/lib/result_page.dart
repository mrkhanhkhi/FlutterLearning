import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'constant.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({Key key}) : super(key: key);
  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpreation});

  final String bmiResult;
  final String resultText;
  final String interpreation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 40, 20, 20),
              child: Text('Your results', style: kcalculateTextStyle, ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kresultsTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextstyle,
                  ),
                  Text(
                    interpreation,
                    textAlign: TextAlign.center,
                    style: kbodyResultTextstyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Re calculate your BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
