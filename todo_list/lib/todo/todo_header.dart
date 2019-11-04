import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/events/add_todo_event.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);

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
        RaisedButton.icon(onPressed: (){
            bloc.event.add(AddTodoEvent(textTodoController.text));
        },
          icon: Icon(Icons.add),
          label: Text("Add"),)
      ],
    );
  }
}