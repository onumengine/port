import 'package:flutter/material.dart';
import 'package:port/utility/colors_main.dart';

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
      body: Container(),
    );
  }
}
