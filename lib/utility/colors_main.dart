import 'dart:ui';

import 'package:flutter/material.dart';

const  colorPrimary = Colors.white;
const  colorGrey= Color(0xff707070);
const  colorOrangeAccent= Color(0xffFF8C1C);
const  colorScaffold = Color(0xffF5F5F9);
const  colorPrimaryDark = Color(0XFFff8080);
const  colorAccent = Color(0XFFff8080);
const  textColorPrimary = Color(0XFF333333);
const  textColorSecondary = Color(0XFF747474);
const  app_background = Color(0XFFf8f8f8);
const  view_color = Color(0XFFDADADA);
const  sign_in_background = Color(0XFFDADADA);
const  white = Color(0XFFffffff);
const  icon_color = Color(0XFF747474);
const  selected_tab = Color(0XFFFCE9E9);
const  red = Color(0XFFF10202);
const  blue = Color(0XFF1D36C0);
const  edit_text_background = Color(0XFFE8E8E8);
const  shadow = Color(0X70E2E2E5);
var t1White = materialColor(0XFFFFFFFF);
var t1TextColorPrimary = materialColor(0XFF212121);
const shadow_color = Color(0X95E9EBF0);
const  color_primary_light = Color(0XFFFCE8E8);
const  bg_bottom_sheet = Color(0XFFFFF1F1);


// bottom bar color scheme
const bottom_textColorPrimary = Color(0xFFD2D2D4);
const bottom_textColorSecondary = Color(0xFFA6A6A8);
const bottom_textColorThird = Color(0xFF77787A);
const bottom_white = Color(0xFFFFFFFF);
const bottom_appBackground = Color(0xFF26272B);
const bottom_navigationBackground = Colors.white;
const bottom_shadow_color = Color(0X95E9EBF0);


Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0XFF5959fc, color);
