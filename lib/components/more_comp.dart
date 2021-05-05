import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class MoreComponent extends StatefulWidget {
  @override
  _MoreComponentState createState() => _MoreComponentState();
}

class _MoreComponentState extends State<MoreComponent> {
  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592)
      return 20;
    else if (screenWidth > 592 && screenWidth < 1000)
      return 40;
    else if (screenWidth > 1000) return 3;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(_screenSize.width),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PhysicalModel(
            color: opBackgroundColor,
            shadowColor: colorCardShadow,
            elevation: 10,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 152,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: SvgPicture.asset(
                      "lib/vectors/default_avatar.svg",
                      semanticsLabel: "Avatar",
                      height: 72,
                      width: 72,
                    ),
                    title: Text("Neelesh Chaudhary"),
                    subtitle: Text("UI/UX Designer"),
                  ),
                  InkResponse(
                    onTap: () {
                      print("Clicked edit profile");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      width: _screenSize.width / 2,
                      child: Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(color: opTextPrimaryColor),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: opTextPrimaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
