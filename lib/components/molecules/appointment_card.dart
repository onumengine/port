import 'package:flutter/material.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class AppointmentCard extends StatefulWidget {
  String organizationName;
  String approvalStatus;
  String startTime, duration;
  VoidCallback onTap;

  AppointmentCard({
    @required this.organizationName,
    this.approvalStatus,
    this.startTime,
    this.duration,
    this.onTap,
  });

  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: PhysicalModel(
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
                        "${widget.startTime} | ${widget.duration}mins",
                        style: TextStyle(
                          color: paleTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              (widget.approvalStatus == "0")
                  ? Container(
                      decoration: BoxDecoration(color: Color(0x1AB3B6C0)),
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 11),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.check),
                          Text("Approved"),
                        ],
                      ),
                    )
                  : (widget.approvalStatus == "1")
                      ? Container(
                          decoration: BoxDecoration(color: paleOrangeChipColor),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 11),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.check, color: orangeChipTextColor),
                              Text(
                                "Pending",
                                style: TextStyle(
                                  color: orangeChipTextColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : (widget.approvalStatus == "2")
                          ? Container(
                              decoration: BoxDecoration(color: paleBlueChipColor),
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 11),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: blueChipTextColor),
                                  Text(
                                    "Active",
                                    style: TextStyle(color: blueChipTextColor),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              decoration:
                                  BoxDecoration(color: paleOrangeChipColor),
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 11),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: orangeChipTextColor),
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                      color: orangeChipTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
