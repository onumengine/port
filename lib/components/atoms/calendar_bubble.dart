import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class CalendarBubble extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CalendarBubble({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: paleCircleAvatarBackground,
        ),
        child: Center(
          child: Text(this.text),
        ),
      ),
    );
  }
}
