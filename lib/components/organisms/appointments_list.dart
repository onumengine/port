import 'package:flutter/material.dart';
import 'package:port/components/organisms/appointment_card.dart';

class AppointmentsListComponent extends StatefulWidget {
  List listOfAppointments;

  AppointmentsListComponent({@required this.listOfAppointments});

  @override
  _AppointmentsListComponentState createState() =>
      _AppointmentsListComponentState();
}

class _AppointmentsListComponentState extends State<AppointmentsListComponent> {
  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 20;
    else if (screenWidth > 592 && screenWidth < 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(screenSize.width),
      ),
      width: screenSize.width,
      child: ListView.separated(
        itemBuilder: (context, index) => AppointmentCard(
          organizationName: widget.listOfAppointments.elementAt(index),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}
