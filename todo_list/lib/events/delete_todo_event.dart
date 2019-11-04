import 'package:todo_list/base/base_event.dart';
import 'package:todo_list/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);

}