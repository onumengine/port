import 'package:flutter/material.dart';
import 'package:port/components/appointment_card.dart';

class AppointmentsListComponent extends StatefulWidget {
  @override
  _AppointmentsListComponentState createState() =>
      _AppointmentsListComponentState();
}

class _AppointmentsListComponentState extends State<AppointmentsListComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      child: ListView.separated(
        itemBuilder: (context, index) => AppointmentCard(index),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}
