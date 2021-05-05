import 'package:flutter/material.dart';
import 'package:port/components/empty_appointments_comp.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _navBarIndex;
  int _currentIndex = 0;
  String title;

  final _tabs = [
    EmptyAppointmentsComponent(),
    Container(
      child: Text("Tab 2"),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PORT",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
            onPressed: () {
              print("Pressed Notification Button");
            },
          ),
        ],
      ),
      body: _tabs[_currentIndex],
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
        currentIndex: _currentIndex,
        onTap: (int selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
          print(_currentIndex);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "lib/vectors/home_icon.svg",
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "lib/vectors/options_icon.svg",
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
