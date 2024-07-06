class Todo {
  final String id;
  final String title;
  final DateTime date;
  bool isDone = false;
  Todo({
    required this.id,
    required this.title,
    required this.date,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}

class Todos {
  List<Todo> _items = [
    Todo(id: "r1", title: "reja 1", date: DateTime.now()),
    Todo(id: "r2", title: "reja 2", date: DateTime.now()),
    Todo(id: "r3", title: "reja 3", date: DateTime.now()),
  ];

  List<Todo> get items {
    return _items;
  }
}
