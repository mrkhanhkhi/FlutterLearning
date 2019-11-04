import 'dart:async';
import 'package:todo_list/base/base_bloc.dart';
import 'package:todo_list/base/base_event.dart';
import 'package:todo_list/model/todo.dart';
import '../events/add_todo_event.dart';
import '../events/delete_todo_event.dart';

class TodoBloc extends BaseBloc {
  StreamController<List<Todo>> _todoListStreamController = StreamController<List<Todo>>();

  _addTodo(Todo todo) {

  }

  _deleteTodo(Todo todo) {

  }


  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
    if (event is AddTodoEvent) {

    } else if (event is DeleteTodoEvent) {

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListStreamController.close();
  }

}