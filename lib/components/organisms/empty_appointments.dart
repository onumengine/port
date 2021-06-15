import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/home/bloc.dart';
import 'package:port/bloc/home/event.dart';
import 'package:port/utility/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// I hard-coded the onTap handler of this component because it is rendered in the UI
/// before its [BlocProvider] is initialized.
class EmptyAppointmentsComponent extends StatelessWidget {
  final String instructionalText;
  VoidCallback onTap;

  EmptyAppointmentsComponent({
    this.instructionalText =
        "You have not added any appointments yet.\nClick the add button below to get\nstarted",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 221,
                  width: 221,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xD222B45),
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: opPrimaryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "lib/vectors/empty_home_img.svg",
                    semanticsLabel: "New Logo",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              this.instructionalText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 1,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
