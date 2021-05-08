import "package:flutter/material.dart";
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
        height: 140,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(this.title),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(this.body),
            ),
          ],
        ),
      ),
    );
  }
}
