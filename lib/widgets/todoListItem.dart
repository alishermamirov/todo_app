// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/models/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final Function toggleDone;
  final Function deleteTodo;
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.toggleDone,
    required this.deleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: IconButton(
        onPressed: () {
          toggleDone(todo.id);
        },
        icon: Icon(
          todo.isDone
              ? Icons.check_circle_outline_rounded
              : Icons.circle_outlined,
          color: todo.isDone ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          decorationThickness: 2,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          deleteTodo(todo.id);
        },
        icon: Icon(Icons.delete_forever),
      ),
    );
  }
}
