import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_date.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/widgets/todos_counting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          TodosCounting(),
          TodoList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
