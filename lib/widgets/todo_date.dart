// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TodoDate extends StatelessWidget {
  final Function openDatePicker;
  final DateTime pickedDate;
  final Function() previousDate; //argment qabul qilmasa () qo'yiladi
  final Function() nextDate;
  const TodoDate({
    Key? key,
    required this.openDatePicker,
    required this.pickedDate,
    required this.previousDate,
    required this.nextDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: previousDate,
            icon: Icon(Icons.arrow_left_sharp, size: 36)),
        TextButton(
          onPressed: () {
            openDatePicker(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              children: [
                TextSpan(
                  text: "${DateFormat("EEEE").format(pickedDate)} ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "${DateFormat("d MMM").format(pickedDate)}"),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: nextDate, icon: Icon(Icons.arrow_right_sharp, size: 36)),
      ],
    );
  }
}
