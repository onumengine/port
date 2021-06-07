import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class TimeButton extends StatefulWidget {
  bool isSelected;
  String label;
  VoidCallback onTap;

  TimeButton({this.label, this.isSelected = false});

  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 62,
        width: screenSize.width / 14,
        decoration: BoxDecoration(
          color: (widget.isSelected) ? opPrimaryColor : paleChipBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: (widget.isSelected) ? opBackgroundColor : chipTextColorDisabled,
            ),
          ),
        ),
      ),
    );
  }
}