import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  int index;

  AppointmentCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text("${index}"),
    );
  }
}
