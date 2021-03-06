import 'package:flutter/material.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/todo/todo_list_container.dart';
import 'package:todo_list/todo/todo_header.dart';
import 'package:todo_list/todo/todo_list.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/db/todo_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(MyApp());
} 

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
        body: Provider<TodoBloc>.value(
            value: TodoBloc(),
            child: TodoListContainer()
        ),
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
        TodoHeader(),
        Expanded(child: TodoList())
        ],
      ),
    );
  }

}

