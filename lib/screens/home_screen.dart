import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_date.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/widgets/todos_counting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todos = Todos().items;
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
      todos.firstWhere((element) => element.id == id).toggleDone();
    });
  }

  void deleteTodo(String id) {
    setState(() {
      todos.removeWhere(
        (element) => element.id == id,
      );
    });
  }

  int get todosCount {
    return todos.length;
  }

  int get doneTodoCount {
    return todos
        .where(
          (element) => element.isDone,
        )
        .length;
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "title",
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kun tanlanmagan"),
                    TextButton(
                      onPressed: () {},
                      child: Text("Kunni tanlash"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Bekor qilish"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Saqlash"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
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
              todos: todos, toggleDone: toggleDone, deleteTodo: deleteTodo),
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
