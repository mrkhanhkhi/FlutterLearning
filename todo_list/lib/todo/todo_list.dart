import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/events/delete_todo_event.dart';
import 'package:todo_list/model/todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
      builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
          stream: bloc.todoListStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data[index].content,
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          bloc.event.add(DeleteTodoEvent(snapshot.data[index]));
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red[400],
                        ),
                      ),
                    );
                  },
                );
              case ConnectionState.none:
                return Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Text('Empty'),
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Text('Empty'),
                  ),
                );
              default:
                return Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(),
                  ),
                );
            }
          }),
    );
  }
}
