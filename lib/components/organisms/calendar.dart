import "package:flutter/material.dart";

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int year = 2021;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 540,
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
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
              Text("${this.year}"),
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
        ],
      ),
    );
  }

  void _incrementYear() {
    setState(() {
      year++;
    });
  }

  void _decrementYear() {
    setState(() {
      year--;
    });
  }
}
