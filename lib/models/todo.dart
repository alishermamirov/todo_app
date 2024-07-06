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

  List<Todo> SortByDate(DateTime date) {
    return _items
        .where(
          (element) =>
              element.date.day == date.day &&
              element.date.month == date.month &&
              element.date.year == date.year,
        )
        .toList();
  }

  void addTodo(String title, DateTime date) {
    _items.add(Todo(id: "r${_items.length}", title: title, date: date));
  }

  void deleteTodo(String id) {
    _items.removeWhere(
      (element) => element.id == id,
    );
  }
}
