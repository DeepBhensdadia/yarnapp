import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constcolor.dart';

class FlutterToast {
  static showCustomToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
      gravity: ToastGravity.TOP, // Change the gravity to customize the position
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 20.0,
    );
  }

  final BoxDecoration appBarBoxDecoration = BoxDecoration();
}

showFlutterToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: 15,
    // backgroundColor: Colors.white,
    // textColor: Colors.black
  );
}

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.androidId; // Using Android ID as an example
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo
        .identifierForVendor; // Using Identifier for Vendor as an example
  }
  return '';
}

TextStyle primaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : 14,
    color: color ?? Colors.black,
    fontWeight: weight ?? FontWeight.w500,
    fontFamily: fontFamily ?? "",
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}


BoxDecoration PCboxDecoration({double radius = 1.0, Color color = Colors.transparent, Color bgColor = Cricket_white, double borderWidth = 1.0, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [ BoxShadow(color: Cricket_ShadowColor, blurRadius: 10, spreadRadius: 3)] : [const BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

final BorderRadius homeCardRadius = BorderRadius.all(Radius.circular(8));
final BorderRadius categoryCardRadius = BorderRadius.all(Radius.circular(8));
final BorderRadius defaultCardRadius = BorderRadius.all(Radius.circular(8));

showdialogboxalert(BuildContext context, String textfor) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade300,
          title: Text(
            "Alert",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          content: Text(
            textfor,
            style:
                TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
          ),
          actions: <Widget>[
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white70),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
            SizedBox(
              width: 0,
            ),
            ElevatedButton(
                  style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
        (states) => Colors.white70),
        ),
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Text(
                  "Yes",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
          ],
        );
      });
}
