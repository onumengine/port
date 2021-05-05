import 'package:flutter/material.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _navBarIndex;
  String title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PORT"),
        automaticallyImplyLeading: false,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              print("Pressed Notification Button");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 221,
                  width: 221,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xD222B45),
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: opPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "lib/vectors/empty_home_img.svg",
                    semanticsLabel: "New Logo",
                  ),
                ),
              ],
            ),
            Text(
              "You have not added any appointments yet,\nclick the add button below to get\nstarted",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: opPrimaryColor,
        foregroundColor: white,
        child: Icon(Icons.add),
        onPressed: () {
          print("Pressed the FAB");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: "Options",
          ),
        ],
      ),
    );
  }
}
