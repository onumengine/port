import 'package:flutter/material.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

enum ApprovalStatus {
  Approved,
  Pending,
  Active,
}

class AppointmentCard extends StatefulWidget {
  String organizationName;
  ApprovalStatus approvalStatus;
  DateTime startTime, expirationTime;

  AppointmentCard({
    this.organizationName = "Access Bank",
    this.approvalStatus = ApprovalStatus.Approved,
    this.startTime,
    this.expirationTime,
  });

  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      shadowColor: colorCardShadow,
      borderRadius: BorderRadius.circular(8),
      elevation: 5.0,
      child: Container(
        height: 100,
        padding: EdgeInsets.fromLTRB(24, 18, 12, 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.organizationName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.watch_later,
                      color: paleTextColor,
                      size: 14,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${widget.startTime} - ${widget.expirationTime}",
                      style: TextStyle(
                        color: paleTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: Color(0x1AB3B6C0)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.check),
                  Text("Approved"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
