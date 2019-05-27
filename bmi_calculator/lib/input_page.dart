import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';

const bottomContainerHeight = 80.0;
const inactiveColor = Color(0xFF1111328);
const activeCardColor = Color(0xFF101E33);
const bottomContainerColor = Color(0xFFEB1555);

  enum Gender {
    male,
    female,
  }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour:selectedGender == Gender.male ? activeCardColor : inactiveColor,
                    cardChild: IconContent(gender: 'MALE', icon: FontAwesomeIcons.mars),
                    ),
                  ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? activeCardColor : inactiveColor,
                    cardChild: IconContent(gender: 'FEMALE', icon: FontAwesomeIcons.venus),
                    ),
                ),
              ],
            )),
          Expanded(
            child: ReusableCard(colour:activeCardColor,),
            ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour:Color(0xFF101E33),),
                ),
                Expanded(
                  child: ReusableCard(colour:Color(0xFF101E33),),
                ),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
        ],
      ),
    );
  }
}




