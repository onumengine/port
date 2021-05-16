import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class CalendarBubble extends StatelessWidget {
  final String text;

  CalendarBubble({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: paleTextColor,
      ),
      child: Center(
        child: Text(this.text),
      ),
    );
  }
}
