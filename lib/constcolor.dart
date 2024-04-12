import 'package:flutter/material.dart';
import 'package:yarn_modified/const/themes.dart';

final kwhite = Colors.white;
final kthemecolor = MyTheme.appBarColor;
final kblack = Colors.black;
final backgroundcolor = Colors.grey.shade100;
final darkBlue = MyTheme.appBarColor;
const Cricket_white = Color(0xFFffffff);
const Cricket_Primary = Color(0xFF232883);
const Cricket_Gradient_color1 = Color(0xFFF92C5B);
const Cricket_Gradient_color2 = Color(0xFF2b33bf);
const Cricket_textColorPrimary = Color(0xFF333333);
const Cricket_textColorSecondary = Color(0xFF9D9D9D);
const Cricket_ShadowColor = Color(0X95E9EBF0);
const Cricket_color1 = Color(0xFF8f93d6);
const Cricket_SkyBlue_Color = Color(0xFF65f7ff);
const Cricket_app_Background = Color(0xFFf3f5f9);
const Cricket_BlackColor = Color(0xFF000000);

BoxDecoration decration = BoxDecoration(
    gradient: LinearGradient(

        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          MyTheme.scaffoldColor,
          Colors.white.withOpacity(0.30),
          Colors.white.withOpacity(0.65),
          Colors.white.withOpacity(0.85)
        ]));

TextStyle textbar  = TextStyle(
    color: Colors
        .blueGrey,
    fontWeight:
    FontWeight
        .bold,
    fontSize: 12);