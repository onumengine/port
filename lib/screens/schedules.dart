import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:port/bloc/home/bloc.dart';
import 'package:port/components/molecules/appointment_card.dart';
import 'package:port/components/organisms/appointments.dart';
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
    _homeBloc = BlocProvider.of<HomeBloc>(context);
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
            flexibleSpace: Container(
              width: 212,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: colorOrangeChip,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Bank of America",
                  style: TextStyle(
                    color: Color(0xFFFD9453),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              indicatorColor: opPrimaryColor,
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
              child: TabBarView(
            children: [
              Center(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: _getHorizontalPadding(screenSize.width), vertical: 24,),
                  itemBuilder: (context, index) => AppointmentCard(organizationName: "REVERB NATION"),
                  separatorBuilder: (context, _) => SizedBox(height: 10),
                  itemCount: 20,
                )
              ),
              Center(
                child: Text("Approved"),
              ),
            ],
          ),),),
    );
  }
}
