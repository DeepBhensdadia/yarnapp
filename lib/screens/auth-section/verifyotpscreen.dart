import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:yarn_modified/getxcontrollers/authcontroller.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../widgets/common_fields.dart';
import '../root-app.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phonenumber;
  final bool register;
  const VerifyOtpScreen(
      {super.key, required this.phonenumber, this.register = false});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen>
    with SingleTickerProviderStateMixin {
  // final tenDigitsOnly = new RegExp(r'^\d{0,10}$');
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  void initState() {
    super.initState();
  }

  AuthController authController = Get.put(AuthController());

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Exit",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            content: Text(
              "Are you sure you would like exit the application ?",
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            ),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white.withOpacity(0.9)),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white.withOpacity(0.9)),
                  onPressed: () {
                    exit(0);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          );
        });
    return exitApp ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: MyTheme.scaffoldColor,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        color: MyTheme.appBarColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              // Colors.transparent.withOpacity(0.05),
                              // Colors.transparent.withOpacity(0.05),
                              Color(0xff1EAFDF),
                              Color(0xff1EAFDF),
                              Color(0xff107698),
                              Color(0xff107698),
                              Color(0xff107698),
                              Color(0xff107698),
                            ])),
                  ),
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: 125,
                                  width: 150,
                                  child:
                                      Image.asset("images/RR_Textiles-r.png"))),
                          Center(
                            child: Text(
                              'Verify Mobile Number',
                              textScaleFactor: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.scaffoldColor),
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Center(
                          //   child: Text(
                          //     'Enter The OTP Send To +91 ${widget.phonenumber}',
                          //     textScaleFactor: 1,
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.white),
                          //   ),
                          // ),
                          SizedBox(height: 25),
                          Card(
                            color: Colors.white,
                            elevation: 10,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Align(
                                    //   alignment: AlignmentDirectional.topStart,
                                    //   child: Text(
                                    //     "Enter OTP to Verify",
                                    //     textScaleFactor: 1.3,
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.w500,
                                    //         color: MyTheme.appBarColor),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Pinput(
                                      defaultPinTheme: PinTheme(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 6),
                                        width: 56,
                                        height: 56,
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          color: Color.fromRGBO(30, 60, 87, 1),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                      ),
                                      length: 4,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        FilteringTextInputFormatter.deny(
                                            RegExp('[\\.]')),
                                      ],
                                      onCompleted: (pin) async {
                                        if (pin == "1234") {
                                          if (widget.register != true) {
                                            context.loaderOverlay.show();
                                            await getlogindetails(
                                                    keyword: widget.phonenumber)
                                                .then((value) {
                                              context.loaderOverlay.hide();

                                              if (value.success != false) {
                                                SharedPref.save(
                                                    value: jsonEncode(
                                                        value.toJson()),
                                                    prefKey:
                                                        PrefKey.loginDetails);
                                                Get.offAll(RootApp());
                                                FlutterToast.showCustomToast(
                                                    value.message ?? "");
                                              } else {
                                                Get.offAll(SignUpScreen(
                                                    phonenumber:
                                                        widget.phonenumber));
                                              }

                                              print(value);
                                            }).onError((error, stackTrace) {
                                              context.loaderOverlay.hide();
                                              print("error..$error");
                                            });
                                          } else {
                                            authController.registerlogin();
                                          }
                                        } else {
                                          FlutterToast.showCustomToast(
                                              "Invalid OTP");
                                        }
                                        print(pin);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            constraints: BoxConstraints(),
                            child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) =>
                                                Colors.black.withOpacity(0.2)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.black)),
                                child: Text(
                                  '<- Back ->',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//======================Rough=========================

// Stack(
//   children: [
//     Positioned.fill(
//         child: Image(
//       image: AssetImage('images/login-yarn.png'),
//       fit: BoxFit.fill,
//     )),
//     Positioned.fill(
//       child: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//         Colors.black.withOpacity(0.65),
//         Colors.black.withOpacity(0.65),
//       ], end: Alignment.topCenter, begin: Alignment.bottomCenter))),
//     ),
//   ],
// ),
