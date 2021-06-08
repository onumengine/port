import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class TimestampCard extends StatefulWidget {
  String selectedDate, selectedTime, selectedDuration;

  TimestampCard({
    this.selectedDate = "Monday, 20 July 2021",
    this.selectedTime = "9:00AM",
    this.selectedDuration = "30 minutes",
  });

  @override
  _TimestampCardState createState() => _TimestampCardState();
}

class _TimestampCardState extends State<TimestampCard> {
  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 8;
    else if (screenWidth > 592 && screenWidth < 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(screenSize.width),
      ),
      child: PhysicalModel(
        color: colorAppBackground,
        shadowColor: colorCardShadow,
        elevation: 16,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 228,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Day and Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 41,
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 12),
                      child: Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                    ),
                    Text(
                      widget.selectedDate,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 41,
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 12),
                      child: Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                    ),
                    Text(
                      widget.selectedTime,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 41,
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 12),
                      child: Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                    ),
                    Text(
                      widget.selectedDuration,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
