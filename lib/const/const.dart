import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class FlutterToast {
  static showCustomToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 12,
      // backgroundColor: Colors.white,
      // textColor: Colors.black
    );
  }

  final BoxDecoration appBarBoxDecoration = BoxDecoration();
}

showFlutterToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: 12,
    // backgroundColor: Colors.white,
    // textColor: Colors.black
  );
}

final BorderRadius homeCardRadius = BorderRadius.all(Radius.circular(8));
final BorderRadius categoryCardRadius = BorderRadius.all(Radius.circular(8));
final BorderRadius defaultCardRadius = BorderRadius.all(Radius.circular(8));
