import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class NotificationCard extends StatelessWidget {
  String title, body, timeStamp;

  NotificationCard({
    @required this.title,
    @required this.body,
    @required this.timeStamp,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: white,
      shadowColor: colorCardShadow,
      borderRadius: BorderRadius.circular(8),
      elevation: 8,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23,
        ),
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                this.title,
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  this.body,
                  style: TextStyle(
                    color: paleTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                this.timeStamp,
                style: TextStyle(
                  color: paleTextColor,
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
