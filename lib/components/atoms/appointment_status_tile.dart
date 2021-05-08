import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/utility/colors.dart';

class AppointmentStatusTile extends StatelessWidget {
  String iconPath, semanticLabel, appointmentStatus, timeStamp;

  AppointmentStatusTile({
    this.iconPath,
    this.semanticLabel,
    this.appointmentStatus,
    this.timeStamp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: EdgeInsets.all(10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: paleCircleAvatarBackground,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          this.iconPath,
          semanticsLabel: this.semanticLabel,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.appointmentStatus,
            style: TextStyle(
              fontSize: 14,
              color: opPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            this.timeStamp,
            style: TextStyle(
              color: paleTextColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
