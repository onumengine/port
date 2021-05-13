import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:port/components/organisms/calendar.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen>
    with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    this.controller = TabController(
      length: 6,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Pick day and time",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Calendar(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    this.controller.dispose();
  }
}
