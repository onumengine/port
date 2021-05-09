import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: white,
      shadowColor: colorLightCardShadow,
      borderRadius: BorderRadius.circular(24),
      elevation: 24,
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
                "lib/vectors/bank_icon.svg",
                semanticsLabel: "Banks Icon",
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Banks",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
