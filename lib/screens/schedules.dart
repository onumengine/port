import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:port/bloc/home/bloc.dart';
import 'package:port/bloc/home/event.dart';
import 'package:port/bloc/home/state.dart';
import 'package:port/components/molecules/appointment_card.dart';
import 'package:port/components/molecules/network_error.dart';
import 'package:port/components/organisms/appointments.dart';
import 'package:port/components/organisms/empty_appointments.dart';
import 'package:port/screens/details.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class SchedulesScreen extends StatefulWidget {
  _SchedulesScreenState createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context)..add(SchedulesFetchEvent());
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 8;
    else if (screenWidth > 592 && screenWidth < 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Your Schedules",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset("lib/vectors/calendar_icon.svg"),
              onPressed: () {
                print("Pressed calendar icon");
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: opPrimaryColor,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 34),
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
              color: tabSelectedTextColor,
            ),
            unselectedLabelColor: tabUnselectedTextColor,
            tabs: [
              Tab(text: "All"),
              Tab(text: "Approved"),
            ],
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, AppointmentState>(
              builder: (context, state) {
            if (state is BookedState) {
              List approvedAppointments = state.otherSchedules.where((element) => element["action"] == "Approved").toList();
              print("YOUR APPROVED APPOINTMENTS LIST IS $approvedAppointments");

              return TabBarView(
                children: [
                  Center(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: _getHorizontalPadding(screenSize.width),
                        vertical: 24,
                      ),
                      itemBuilder: (context, index) {
                        return AppointmentCard(
                          organizationName:
                              state.todaysSchedules.elementAt(index)["org_name"],
                          startTime:
                              state.todaysSchedules.elementAt(index)["time"],
                          approvalStatus: state.todaysSchedules
                              .elementAt(index)["status"]
                              .toString(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  appointment:
                                      state.todaysSchedules.elementAt(index),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(height: 10),
                      itemCount: state.todaysSchedules.length,
                    ),
                  ),
                  Center(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: _getHorizontalPadding(screenSize.width),
                        vertical: 24,
                      ),
                      itemBuilder: (context, index) {
                        return AppointmentCard(
                          organizationName:
                          approvedAppointments.elementAt(index)["org_name"],
                          startTime:
                          approvedAppointments.elementAt(index)["time"],
                          approvalStatus: approvedAppointments.elementAt(index)["status"]
                              .toString(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  appointment: approvedAppointments.elementAt(index),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(height: 10),
                      itemCount: approvedAppointments.length,
                    ),
                  ),
                ],
              );
            } else if (state is AppointmentsFetchingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EmptyAppoinmentsState) {
              return EmptyAppointmentsComponent();
            } else {
              return NetworkErrorComp(onTap: () {});
            }
          }),
        ),
      ),
    );
  }
}
