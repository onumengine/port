import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:port/components/atoms/appointment_status_tile.dart';
import 'package:port/components/organisms/timestamp_card.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

enum AppointmentReasons {
  reason1,
  reason2,
  reason3,
}

class SubmitScreen extends StatefulWidget {
  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  AppointmentReasons _dropdownButtonValue;

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth <= 592)
      return 8;
    else if (screenWidth <= 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Summary",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _getHorizontalPadding(screenSize.width),
              ),
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
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TimestampCard(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(screenSize.width),
            ),
            child: PhysicalModel(
              color: colorAppBackground,
              shadowColor: colorCardShadow,
              elevation: 16,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 20,
                ),
                child: DropdownButton<AppointmentReasons>(
                  isExpanded: true,
                  value: _dropdownButtonValue,
                  icon: Icon(CupertinoIcons.chevron_down),
                  underline: SizedBox(),
                  onChanged: (selectedAppointmentReason) {
                    setState(() {
                      _dropdownButtonValue = selectedAppointmentReason;
                    });
                    print("${_dropdownButtonValue}");
                  },
                  hint: Text("Choose reason for appointment"),
                  disabledHint: Text("Disabled"),
                  items: <DropdownMenuItem<AppointmentReasons>>[
                    DropdownMenuItem(
                      child: Container(
                        child: Center(
                          child: Text("Reason1"),
                        ),
                      ),
                      value: AppointmentReasons.reason1,
                    ),
                    DropdownMenuItem(
                      child: Container(
                        child: Center(
                          child: Text("Reason2"),
                        ),
                      ),
                      value: AppointmentReasons.reason2,
                    ),
                    DropdownMenuItem(
                      child: Container(
                        child: Center(
                          child: Text("Reason3"),
                        ),
                      ),
                      value: AppointmentReasons.reason3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(screenSize.width),
            ),
            child: PhysicalModel(
              color: colorAppBackground,
              shadowColor: colorCardShadow,
              elevation: 16,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding:
                    EdgeInsets.only(top: 17, left: 20, right: 20, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AppointmentStatusTile(
                      iconPath: "lib/vectors/request_sent_icon.svg",
                      semanticLabel: "Request sent icon",
                      appointmentStatus: "Request sent",
                      timeStamp: "4 Jan 2020, 10:59 AM",
                    ),
                    AppointmentStatusTile(
                      iconPath: "lib/vectors/eye_icon.svg",
                      semanticLabel: "Review icon",
                      appointmentStatus: "Under Review",
                      timeStamp: "22 Jan 2020, 10:59 AM",
                    ),
                    AppointmentStatusTile(
                      iconPath: "lib/vectors/smiley_icon.svg",
                      semanticLabel: "Approved icon",
                      appointmentStatus: "Approved",
                      timeStamp: "10:59 AM",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              print("Tapped Edit button");
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 54,
              decoration: BoxDecoration(
                color: opPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: opBackgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
