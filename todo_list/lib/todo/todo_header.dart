import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTodoController = TextEditingController();
    return Row(
      children: <Widget>[
        Expanded(
            child: TextFormField(
            controller: textTodoController, 
            decoration: InputDecoration(
              labelText: "Add to do",
              hintText: "Add to do"
            ),
          ),
        ),
        SizedBox(width: 10.0),
        RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Add"),)
      ],
    );
  }
}