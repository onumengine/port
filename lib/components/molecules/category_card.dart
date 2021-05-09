import "package:flutter/material.dart";
import 'package:port/utility/colors_main.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: colorAppBackground,
      shadowColor: colorCardShadow,
      elevation: 8,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 185,
        width: (MediaQuery.of(context).size.width / 3) * 2,
        decoration: BoxDecoration(boxShadow: <BoxShadow>[BoxShadow()]),
      ),
    );
  }
}
