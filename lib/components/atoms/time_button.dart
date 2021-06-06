import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class TimeButton extends StatefulWidget {
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: 62,
      width: screenSize.width / 14,
      decoration: BoxDecoration(
        color: paleChipBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "11:00",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: chipTextColorDisabled,
          ),
        ),
      ),
    );
  }
}