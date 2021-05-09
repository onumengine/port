import "package:flutter/material.dart";
import 'package:port/components/molecules/category_card.dart';

class CategoriesGrid extends StatefulWidget {
  @override
  _CategoriesGridState createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List<Widget>.generate(
        8,
        (index) => CategoryCard(),
      ),
    );
  }
}
