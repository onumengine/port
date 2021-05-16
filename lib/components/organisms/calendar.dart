import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:port/components/atoms/calendar_bubble.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int _year = 2021;
  DateTime _dateTime;
  int _currentMonth, _currentDay, _currentYear;

  Map<int, String> _numberToMonthMap = <int, String>{
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec",
  };

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: colorAppBackground,
      shadowColor: colorCardShadow,
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        height: 540,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.chevron_left_2),
                  onPressed: _decrementYear,
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.chevron_left),
                  onPressed: _decrementYear,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "$_year",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text("Month"),
                  ],
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.chevron_right),
                  onPressed: _incrementYear,
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.chevron_right_2),
                  onPressed: _incrementYear,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("M"),
                Text("T"),
                Text("W"),
                Text("T"),
                Text("F"),
                Text("S"),
                Text("S"),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return CalendarBubble(
                      text: (index + 1).toString(),
                      onTap: () {
                        print("Tapped the calendar bubble ${index + 1}");
                        print(_dateTime);
                      },
                    );
                  },
                  itemCount: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementYear() {
    setState(() {
      _year++;
    });
  }

  void _decrementYear() {
    setState(() {
      _year--;
    });
  }

  void _incrementMonth() {
    setState(() {
      if (_currentMonth == 12) {
        _currentMonth = 0;
      } else {
        _currentMonth++;
      }
    });
  }

  void _decrementMonth() {
    setState(() {
      if (_currentMonth == 1) {
        _currentMonth = 12;
      } else {
        _currentMonth--;
      }
    });
  }
}
