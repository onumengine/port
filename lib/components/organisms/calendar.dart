import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("S"),
              Text("M"),
              Text("T"),
              Text("W"),
              Text("T"),
              Text("F"),
              Text("S"),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.purpleAccent,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: paleChipBackground,
                      shape: BoxShape.circle,
                    ),
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
