class Todo {
  int _id;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String _content;

  Todo.fromData(id, content) {
    _id = id;
    _content = content;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

}