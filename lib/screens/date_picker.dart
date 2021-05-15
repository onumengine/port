import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:port/components/organisms/calendar.dart';
import 'package:port/screens/submit.dart';
import 'package:port/utility/colors.dart';

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
    var screenSize = MediaQuery.of(context).size;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Calendar(
                controller: controller,
              ),
            ),
            SliverFillRemaining(
              child: Text(
                "Choose time",
                style: TextStyle(
                  color: opBackgroundColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 26,
                crossAxisSpacing: 26,
                childAspectRatio: 2 / 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 62,
                    width: screenSize.width / 14,
                    decoration: BoxDecoration(
                      color: paleChipBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Time text",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: chipTextColorDisabled,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 6,
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: TextButton(
                  child: Text("Show Summary"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubmitScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    this.controller.dispose();
  }
}
