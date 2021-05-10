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
        title: Text("Choose Organization"),
      ),
    );
  }
}
