import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
