
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todoListItem.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 0),
        itemCount: 4,
        itemBuilder: (context, index) {
          return TodoListItem();
        },
      ),
    );
  }
}
