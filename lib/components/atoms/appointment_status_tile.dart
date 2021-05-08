import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/utility/colors.dart';

class AppointmentStatusTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: paleCircleAvatarBackground,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          "lib/vectors/request_sent_icon.svg",
          semanticsLabel: "Request sent icon",
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Request sent",
            style: TextStyle(
              fontSize: 14,
              color: opPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "22 Jan 2020",
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
