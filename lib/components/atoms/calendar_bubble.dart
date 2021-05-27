import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class CalendarBubble extends StatelessWidget {
  final String text;
  Color color;
  final VoidCallback onTap;

  CalendarBubble({
    this.text,
    this.onTap,
    this.color = paleCircleAvatarBackground,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.color,
        ),
        child: Center(
          child: Text(this.text),
        ),
      ),
    );
  }
}
