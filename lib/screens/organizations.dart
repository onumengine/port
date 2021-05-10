import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class OrganizationsScreen extends StatefulWidget {
  @override
  _OrganizationsScreenState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends State<OrganizationsScreen> {
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
          "Choose Organization",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: CustomScrollView(),
    );
  }
}
