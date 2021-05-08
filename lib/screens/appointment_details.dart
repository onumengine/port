import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              elevation: 8,
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
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 199,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Purpose",
                      style: TextStyle(color: paleTextColor),
                    ),
                    Container(
                      height: 41,
                      child: Center(
                        child: Text("Business Discussion"),
                      ),
                      decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text(
                      "Description",
                      style: TextStyle(color: paleTextColor),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Went to present a proposal on a solution that can help your business improve and skyrocket your business to the next level",
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
          ],
        ),
      ),
    );
  }
}
