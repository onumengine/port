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
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Summary",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
