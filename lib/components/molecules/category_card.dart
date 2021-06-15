import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class CategoryCard extends StatefulWidget {
  final String iconPath, semanticLabel, categoryName;
  final VoidCallback onTap;

  CategoryCard({
    this.iconPath,
    this.semanticLabel,
    this.categoryName,
    this.onTap,
  });

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: PhysicalModel(
        color: white,
        shadowColor: colorCardShadow,
        borderRadius: BorderRadius.circular(24),
        elevation: 12,
        child: Container(
          height: 185,
          width: (MediaQuery.of(context).size.width / 3) * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 61,
                width: 61,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: paleCircleAvatarBackground,
                ),
                child: Image.network(widget.iconPath),
              ),
              SizedBox(height: 30),
              Text(
                widget.categoryName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
