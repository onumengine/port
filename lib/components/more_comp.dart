import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:port/screens/appointment_details.dart';
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
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: PhysicalModel(
              color: opBackgroundColor,
              shadowColor: colorCardShadow,
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
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
                      title: Text(
                        "Neelesh Chaudhary",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: opPrimaryColor,
                        ),
                      ),
                      subtitle: Text(
                        "UI/UX Designer",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("Clicked edit profile");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        width: _screenSize.width / 2,
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: opTextPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
              child: PhysicalModel(
                color: opBackgroundColor,
                shadowColor: colorCardShadow,
                elevation: 10,
                borderRadius: BorderRadius.circular(8),
                child: ListTile(
                  leading: SvgPicture.asset(
                    "lib/vectors/appointments_icon.svg",
                    semanticsLabel: "Appointments icon",
                  ),
                  title: Text(
                    "Appointments",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: PhysicalModel(
              color: opBackgroundColor,
              shadowColor: colorCardShadow,
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                leading: SvgPicture.asset(
                  "lib/vectors/settings_icon.svg",
                  semanticsLabel: "Settings icon",
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: PhysicalModel(
              color: opBackgroundColor,
              shadowColor: colorCardShadow,
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                leading: SvgPicture.asset(
                  "lib/vectors/share_icon.svg",
                  semanticsLabel: "Share icon",
                ),
                title: Text(
                  "Share",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: PhysicalModel(
              color: opBackgroundColor,
              shadowColor: colorCardShadow,
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                leading: SvgPicture.asset(
                  "lib/vectors/about_icon.svg",
                  semanticsLabel: "About icon",
                ),
                title: Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: PhysicalModel(
              color: opBackgroundColor,
              shadowColor: colorCardShadow,
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                leading: SvgPicture.asset(
                  "lib/vectors/logout_icon.svg",
                  semanticsLabel: "Logout icon",
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
