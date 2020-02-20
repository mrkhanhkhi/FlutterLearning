import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  String ingredient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      child: Column(
        children: <Widget>[
          new CheckboxListTile(
              value: inputs[index],
              title: new Text('item ${index}'),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool val) {
                ItemChange(val, index);
              })
        ],
      ),
    );
  }
}
