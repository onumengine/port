import 'package:flutter/material.dart';
import 'package:port/components/organisms/appointment_card.dart';

class AppointmentsListComponent extends StatefulWidget {
  List todaysAppointments, otherAppointments;

  AppointmentsListComponent({
    @required this.todaysAppointments,
    @required this.otherAppointments,
  });

  @override
  _AppointmentsListComponentState createState() =>
      _AppointmentsListComponentState();
}

class _AppointmentsListComponentState extends State<AppointmentsListComponent> {
  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 12;
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
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container();
              },
              childCount: widget.todaysAppointments.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  "Others",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AppointmentCard(),
                );
              },
              childCount: widget.otherAppointments.length,
            ),
          )
        ],
      ),
      /*
      child: ListView.separated(
        itemBuilder: (context, index) => AppointmentCard(
          organizationName:
              widget.listOfAppointments.elementAt(index)["rep_id"],
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: widget.listOfAppointments.length,
      ), */
    );
  }
}
