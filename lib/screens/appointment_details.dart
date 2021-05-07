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
            PhysicalModel(
              color: colorAppBackground,
              shadowColor: colorCardShadow,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 228,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Day and Time",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                          Text(""),
                        ],
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
