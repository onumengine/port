import 'package:flutter/material.dart';
import 'package:port/bloc/home/bloc.dart';
import 'package:port/screens/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import '../bloc/sign_in/bloc.dart';
import 'home.dart';
import '../repository/user_repository.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserRepository _userRepository;
  bool isUserLoggedIn = false;
  @override
  void initState() {
    _userRepository = UserRepository();
    _userRepository.isLoggedIn().then((value) => {
          setState(() {
            isUserLoggedIn = value;
          }),
          startTime(),
        });
    super.initState();
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    if (!isUserLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(userRepository: UserRepository()),
            child: SignInScreen(),
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
            child: MyHomePage(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222B45),
      body: Center(
        child: Container(
          child: Text(
            "PORT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
