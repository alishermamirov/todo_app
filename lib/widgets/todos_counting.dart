import 'package:flutter/material.dart';

class TodosCounting extends StatelessWidget {
  const TodosCounting({
    super.key,
  });

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
                "5",
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
                "0",
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
