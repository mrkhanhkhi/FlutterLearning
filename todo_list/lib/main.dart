import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('To Do List'),),
        body: TodoListContainer(),
      )
    );
  }
}

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
        _buildHeader()
        ],
      ),
    );
  }

  Widget _buildHeader() {
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

