import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/screens/date_picker.dart';
import 'package:port/utility/colors.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: SvgPicture.asset(
          "images/mike.svg",
          height: 64,
          width: 64,
          semanticsLabel: "Mike image",
        ),
        title: Text(
          "Mike456",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          "Receptionist",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: paleTextColor,
            letterSpacing: 0.2,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DatePickerScreen(),
            ),
          );
        },
      ),
    );
  }
}
