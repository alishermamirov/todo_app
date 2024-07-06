// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newtodo extends StatefulWidget {
  final Function addTodo;
  const Newtodo({
    Key? key,
    required this.addTodo,
  }) : super(key: key);

  @override
  State<Newtodo> createState() => _NewtodoState();
}

class _NewtodoState extends State<Newtodo> {
  DateTime? addingTodoDate;
  final _controller = TextEditingController();
  void addTodoDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    ).then(
      (value) {
        print(value);
        if (value != null) {
          setState(() {
            addingTodoDate = value;
          });
        }
      },
    );
  }

  void submit(BuildContext context) {
    if (_controller.text.isNotEmpty && addingTodoDate != null) {
      setState(() {
        widget.addTodo(_controller.text, addingTodoDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 20
              : 100,
        ),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "title",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(addingTodoDate == null
                    ? "Kun tanlanmagan"
                    : DateFormat("EEEE, d MMMM yyyy").format(addingTodoDate!)),
                TextButton(
                  onPressed: () {
                    addTodoDate(context);
                  },
                  child: Text("Kunni tanlash"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Bekor qilish"),
                ),
                ElevatedButton(
                  onPressed: () {
                    submit(context);
                  },
                  child: Text("Saqlash"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
