// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todoListItem.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function toggleDone;
  final Function deleteTodo;
  const TodoList({
    Key? key,
    required this.todos,
    required this.toggleDone,
    required this.deleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: todos.length > 0
            ? ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoListItem(
                      todo: todos[index],
                      toggleDone: toggleDone,
                      deleteTodo: deleteTodo);
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Rejalar mavjud emas"),
                  Image.asset(
                    "assets/to-do-list.png",
                    width: 300,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ));
  }
}
