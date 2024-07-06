import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/newTodo.dart';
import 'package:todo_app/widgets/todo_date.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/widgets/todos_counting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todos = Todos();

  DateTime pickedDate = DateTime.now();

  void openDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    ).then(
      (value) {
        print(value);
        if (value != null) {
          setState(() {
            pickedDate = value;
          });
        }
      },
    );
  }

  void previousDate() {
    setState(() {
      pickedDate =
          DateTime(pickedDate.year, pickedDate.month, pickedDate.day - 1);
    });
  }

  void nextDate() {
    setState(() {
      pickedDate =
          DateTime(pickedDate.year, pickedDate.month, pickedDate.day + 1);
    });
  }

  void toggleDone(String id) {
    setState(() {
      todos.SortByDate(pickedDate)
          .firstWhere((element) => element.id == id)
          .toggleDone();
    });
  }

  void deleteTodo(String id) {
    setState(() {
      todos.deleteTodo(id);
    });
  }

  int get todosCount {
    return todos.SortByDate(pickedDate).length;
  }

  int get doneTodoCount {
    return todos.SortByDate(pickedDate)
        .where(
          (element) => element.isDone,
        )
        .length;
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return Newtodo(addTodo: addTodo);
      },
    );
  }

  void addTodo(String title, DateTime date) {
    setState(() {
      todos.addTodo(title, date);
    });
    print(title);
    print(date);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TodoDate(
              openDatePicker: openDatePicker,
              pickedDate: pickedDate,
              previousDate: previousDate,
              nextDate: nextDate),
          TodosCounting(todosCount: todosCount, doneTodoCount: doneTodoCount),
          TodoList(
              todos: todos.SortByDate(pickedDate),
              toggleDone: toggleDone,
              deleteTodo: deleteTodo),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
