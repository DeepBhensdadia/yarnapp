import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

showdialogboxalert(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Alert",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          content: Text(
            "Do you want to exit without saving?",
            style:
                TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
          ),
          actions: <Widget>[
            ElevatedButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.green.withOpacity(0.9)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
            ElevatedButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.blue.withOpacity(0.9)),
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
