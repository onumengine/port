import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class SubmitScreen extends StatefulWidget {
  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summary",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
