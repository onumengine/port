import "package:flutter/material.dart";
import 'package:port/components/atoms/calendar_bubble.dart';
import 'package:port/utility/colors.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int _year = 2021;
  DateTime _dateTime;
  DateTimeRange _dateTimeRange;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 540,
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _decrementYear,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _decrementYear,
              ),
              Text("${_year}"),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _incrementYear,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _incrementYear,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              color: Colors.purpleAccent,
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("Calendar disposed");
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
}
