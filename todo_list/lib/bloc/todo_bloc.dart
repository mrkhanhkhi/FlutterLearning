import 'dart:async';
import 'dart:math';
import 'package:todo_list/base/base_bloc.dart';
import 'package:todo_list/base/base_event.dart';
import 'package:todo_list/db/todo_table.dart';
import 'package:todo_list/model/todo.dart';
import '../events/add_todo_event.dart';
import '../events/delete_todo_event.dart';

class TodoBloc extends BaseBloc {

  TodoTable _todoTable = TodoTable();

  // StreamController
  StreamController<List<Todo>> _todoListStreamController = StreamController<List<Todo>>();

  //Output
  //Stream out
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  List<Todo> _todoListData = List<Todo>();

  var _randomInt = Random();


  initData() async {
    _todoListData = await _todoTable.selectAllTodo();
    if(_todoListData == null) {
      return;
    }
    _todoListStreamController.sink.add(_todoListData);
  }

  

  _addTodo(Todo todo) async {
    //insert to db
    await _todoTable.insertTodo(todo);

    _todoListData.add(todo);
    // Input
    // Add event in
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) async {
    await _todoTable.deleteTodo(todo);
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }


  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      Todo todo = Todo.fromData(_randomInt.nextInt(1000000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }

}