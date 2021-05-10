import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/screens/organizations.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class CategoryCard extends StatefulWidget {
  String iconPath, semanticLabel, categoryName;

  CategoryCard({
    this.iconPath,
    this.semanticLabel,
    this.categoryName,
  });

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrganizationsScreen(),
          ),
        );
      },
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
                child: SvgPicture.asset(
                  widget.iconPath,
                  semanticsLabel: widget.semanticLabel,
                ),
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
