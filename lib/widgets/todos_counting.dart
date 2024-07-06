// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodosCounting extends StatelessWidget {
  final int todosCount;
  final int doneTodoCount;
  const TodosCounting({
    Key? key,
    required this.todosCount,
    required this.doneTodoCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todosCount.toString(),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Barcha rejalar",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                doneTodoCount.toString(),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Bajarilgan rejalar",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
