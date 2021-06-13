import 'package:flutter/material.dart';
import 'package:port/components/molecules/appointment_card.dart';
import 'package:port/screens/details.dart';

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
              SizedBox(height: 19),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AppointmentCard(
                    organizationName:
                        widget.todaysAppointments.elementAt(index)["org_name"],
                  ),
                );
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
              SizedBox(height: 19),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AppointmentCard(
                    organizationName:
                        widget.otherAppointments.elementAt(index)["org_name"],
                    startTime:
                        widget.otherAppointments.elementAt(index)["time"],
                    approvalStatus: widget.otherAppointments
                        .elementAt(index)["status"]
                        .toString(),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> DetailsScreen()),
                      );
                    },
                  ),
                );
              },
              childCount: widget.otherAppointments.length,
            ),
          )
        ],
      ),
    );
  }
}
