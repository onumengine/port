import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/utility/colors.dart';

class UserCard extends StatelessWidget {
  String imagePath, semanticLabel, name, jobTitle;
  VoidCallback onTap;

  UserCard(
      {this.imagePath,
      this.semanticLabel,
      this.name,
      this.jobTitle,
      this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.network(
          this.imagePath,
          height: 64,
          width: 64,
        ),
        title: Text(
          this.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          this.jobTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: paleTextColor,
            letterSpacing: 0.2,
          ),
        ),
        onTap: this.onTap,
      ),
    );
  }
}
