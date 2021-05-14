import "package:flutter/material.dart";

class Calendar extends StatefulWidget {
  TabController controller;

  Calendar({
    @required this.controller,
  });

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: widget.controller,
      tabs: <Widget>[
        Text("January"),
        Text("February"),
        Text("March"),
        Text("April"),
        Text("May"),
        Text("June"),
      ],
    );
  }
}
