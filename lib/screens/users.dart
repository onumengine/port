import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:port/components/molecules/user_card.dart';
import 'package:port/utility/colors_main.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Users",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 30),
        itemBuilder: (context, index) => UserCard(),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            indent: 20,
            endIndent: 20,
          ),
        ),
        itemCount: 4,
      ),
    );
  }
}
