import "package:flutter/material.dart";
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class OrganizationCard extends StatelessWidget {
  String organizationSymbol;
  String organizationName;
  double distanceFromUser;

  OrganizationCard({
    @required this.organizationSymbol,
    @required this.organizationName,
    @required this.distanceFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: PhysicalModel(
        color: colorAppBackground,
        shadowColor: colorCardShadow,
        borderRadius: BorderRadius.circular(8),
        elevation: 8,
        child: Container(
          height: 94,
          child: ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: paleCircleAvatarBackground,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            title: Text("Bank of America"),
            subtitle: Row(
              children: [
                Icon(Icons.lock_clock),
                Text("${distanceFromUser}km away"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
