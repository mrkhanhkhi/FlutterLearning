import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final String ingredient;
  const Ingredients({Key key, this.ingredient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      child: Column(
        children: <Widget>[
          // new CheckboxListTile(
          //     value: inputs[index],
          //     title: Text(ingredient),
          //     controlAffinity: ListTileControlAffinity.leading,
          //     onChanged: (bool val) {})
        ],
      ),
    );
  }
}
