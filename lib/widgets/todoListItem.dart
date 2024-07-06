
import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.circle_outlined),
      ),
      title: Text("title"),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete_forever),
      ),
    );
  }
}
