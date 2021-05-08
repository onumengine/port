import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port/components/atoms/appointment_status_tile.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class DetailsScreen extends StatefulWidget {
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 8;
    else if (screenWidth > 592 && screenWidth < 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(screenSize.width),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 212,
                height: 50,
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
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            PhysicalModel(
              color: colorAppBackground,
              shadowColor: colorCardShadow,
              elevation: 16,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 228,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Day and Time",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 41,
                      decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 12),
                            child: Icon(
                              Icons.watch_later,
                              size: 15,
                            ),
                          ),
                          Text("Monday, 20 July 2021"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 41,
                      decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 12),
                            child: Icon(
                              Icons.watch_later,
                              size: 15,
                            ),
                          ),
                          Text("9:00 AM"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 41,
                      decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 12),
                            child: Icon(
                              Icons.watch_later,
                              size: 15,
                            ),
                          ),
                          Text("30 minutes"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            PhysicalModel(
              color: colorAppBackground,
              shadowColor: colorCardShadow,
              elevation: 16,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Purpose",
                        style: TextStyle(
                          color: paleTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 41,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Business Discussion",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: paleTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 17),
                      child: Center(
                        child: Text(
                          "Went to present a proposal on a solution that can help your business improve and skyrocket your business to the next level",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            PhysicalModel(
              color: colorAppBackground,
              shadowColor: colorCardShadow,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.only(top: 17, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AppointmentStatusTile(
                      iconPath: "lib/vectors/request_sent_icon.svg",
                      semanticLabel: "Request sent icon",
                      appointmentStatus: "Request sent",
                      timeStamp: "22 Jan 2020, 10:59 AM",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
