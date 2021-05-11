import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/components/atoms/searchbar.dart';
import 'package:port/components/molecules/category_card.dart';
import 'package:port/utility/colors_main.dart';

class OrganizationsScreen extends StatefulWidget {
  @override
  _OrganizationsScreenState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends State<OrganizationsScreen> {
  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592) {
      return 20;
    } else if (screenWidth > 592 && screenWidth < 1000) {
      return 40;
    } else if (screenWidth > 1000) {
      return 3;
    }
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
          "Choose Organization",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("lib/vectors/location_icon.svg"),
            onPressed: () {
              print("Pressed location icon");
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
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
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(screenSize.width),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              expandedHeight: 100,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: SearchBar(),
              ),
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return CategoryCard();
                },
                childCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
