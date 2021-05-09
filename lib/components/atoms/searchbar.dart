import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';

class SeachBar extends StatefulWidget {
  @override
  _SeachBarState createState() => _SeachBarState();
}

class _SeachBarState extends State<SeachBar> {
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: inputBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.search),
          TextField(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchText.dispose();
  }
}
