import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class UserCard extends StatelessWidget {
  String imagePath, name, jobTitle;
  VoidCallback onTap;

  UserCard(
      {this.imagePath,
      this.name,
      this.jobTitle,
      this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          height: 64,
          width: 64,
          child: Image.network(
            this.imagePath,
          ),
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
