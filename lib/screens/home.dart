import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/home/bloc.dart';
import 'package:port/bloc/home/state.dart';
import 'package:port/components/organisms/appointments_list.dart';
import 'package:port/components/organisms/empty_appointments.dart';
import 'package:port/components/organisms/more.dart';
import 'package:port/screens/categories.dart';
import 'package:port/screens/notifications.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _navbarIndex = 0;
  String title;
  HomeBloc _homeBloc;

  final _tabs = [
    EmptyAppointmentsComponent(),
    MoreComponent(),
  ];

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _tabs[_navbarIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: opPrimaryColor,
        foregroundColor: white,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoriesScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navbarIndex,
        onTap: (int selectedIndex) {
          setState(() {
            _navbarIndex = selectedIndex;
          });
          print(_navbarIndex);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "lib/vectors/home_icon.svg",
            ),
            label: "",
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
