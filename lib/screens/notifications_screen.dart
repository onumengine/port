import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:port/components/molecules/notification_card.dart';
import 'package:port/utility/colors.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: opPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(screenSize.width),
        ),
        height: screenSize.height,
        width: screenSize.width,
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 10),
            child: NotificationCard(
              title: "Request Approved",
              body:
                  "Your request to meet with Citi bank has been approved and is scheduled for 9:00AM, 20th april, 2021",
              timeStamp: "24, April 2021",
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ),
    );
  }
}
