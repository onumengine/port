import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/notifications/bloc.dart';
import 'package:port/bloc/notifications/event.dart';
import 'package:port/bloc/notifications/state.dart';
import 'package:port/components/molecules/notification_card.dart';
import 'package:port/utility/colors.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsBloc _notificationBloc;

  @override
  void initState() {
    _notificationBloc = BlocProvider.of<NotificationsBloc>(context);
    super.initState();
    _notificationBloc.add(NotificationsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (BuildContext context, NotificationsState state) {
          if (state is NotificationsRefreshingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NotificationsFetchUnsuccessfulState) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error, size: 50),
                SizedBox(height: 40),
                Text(
                  "Oops. Couldn't fetch Notifications",
                  style: TextStyle(
                    color: paleTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          } else if (state is PopulatedNotificationsState) {
            return Container(
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
                padding: EdgeInsets.only(top: 2, bottom: 40),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 8;
    else if (screenWidth > 592 && screenWidth < 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }
}
