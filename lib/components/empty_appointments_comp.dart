import 'package:flutter/material.dart';
import 'package:port/utility/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyAppointmentsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: 221,
                width: 221,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xD222B45),
                ),
              ),
              Container(
                height: 180,
                width: 180,
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: opPrimaryColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "lib/vectors/empty_home_img.svg",
                  semanticsLabel: "New Logo",
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "You have not added any appointments yet.\nClick the add button below to get\nstarted",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              letterSpacing: 1,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
