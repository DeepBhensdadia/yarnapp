import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      // cardColor: cardColor2,
      // canvasColor: creamColor,
      // buttonColor: darkBluishColor,
      // accentColor: darkBluishColor,
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(color: Colors.white),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      ));

  static Color scaffoldColor = Color(0xff0AFFFF);
  static Color appBarColor = Color(0xff107698);
  static Color appBarTextColor = Colors.white;
}