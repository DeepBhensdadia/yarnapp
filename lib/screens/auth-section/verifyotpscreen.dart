import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:yarn_modified/getxcontrollers/authcontroller.dart';
import 'package:yarn_modified/getxcontrollers/firebaseauthcontroller.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../widgets/common_fields.dart';
import '../root-app.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phonenumber;

  const VerifyOtpScreen({
    super.key,
    required this.phonenumber,
  });

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

  void getDeviceId12(pin) async {
    String deviceId = await getDeviceId();
    firebaseAuthContrller.verifyOTP(pin, widget, deviceId);
  }

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
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white70),
                  ),
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

  FirebaseAuthContrller firebaseAuthContrller =
      Get.put(FirebaseAuthContrller());

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
                          SizedBox(height: 40),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 30,
                                    )),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: Image.asset(
                                        "images/textilediary-logo-512-removebg-preview.png"),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      // Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 30,
                                      color: Colors.transparent,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                      length: 6,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        FilteringTextInputFormatter.deny(
                                            RegExp('[\\.]')),
                                      ],
                                      onCompleted: (pin) async {
                                        getDeviceId12(pin);
                                        log(pin);

                                        // if (pin == "123456") {
                                        //   context.loaderOverlay.show();
                                        //   DeviceInfoPlugin deviceInfo =
                                        //       DeviceInfoPlugin();
                                        //   AndroidDeviceInfo androidInfo =
                                        //       await deviceInfo.androidInfo;
                                        //   String deviceId =
                                        //       androidInfo.androidId;
                                        //   context.loaderOverlay.show();
                                        //   await getlogindetails(
                                        //           keyword: widget.phonenumber,
                                        //           deviceinfo: deviceId)
                                        //       .then((value) {
                                        //     context.loaderOverlay.hide();
                                        //
                                        //     if (value.success != false) {
                                        //       SharedPref.save(
                                        //           value: jsonEncode(
                                        //               value.toJson()),
                                        //           prefKey:
                                        //               PrefKey.loginDetails);
                                        //       Get.offAll(RootApp());
                                        //       FlutterToast.showCustomToast(
                                        //           value.message ?? "");
                                        //     } else {
                                        //       Get.off(SignUpScreen(
                                        //           phonenumber:
                                        //               widget.phonenumber));
                                        //     }
                                        //
                                        //     print(value);
                                        //   }).onError((error, stackTrace) {
                                        //     context.loaderOverlay.hide();
                                        //     print("error..$error");
                                        //   });
                                        // } else {
                                        //   context.loaderOverlay.hide();
                                        //   FlutterToast.showCustomToast(
                                        //       "Invalid OTP");
                                        // }
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              await firebaseAuthContrller
                                                  .ResendOTP(
                                                      widget.phonenumber);
                                            },
                                            style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateColor.resolveWith(
                                                        (states) => Colors.black
                                                            .withOpacity(0.2)),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                                foregroundColor:
                                                    MaterialStateProperty.all(Colors.black)),
                                            child: Text(
                                              'Resend OTP ',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       margin: EdgeInsets.only(top: 10),
                          //       constraints: BoxConstraints(),
                          //       child: ElevatedButton(
                          //           onPressed: () {
                          //             Get.back();
                          //           },
                          //           style: ButtonStyle(
                          //
                          //               backgroundColor:
                          //                   MaterialStateProperty.all(
                          //                       Colors.blueAccent),),
                          //           child: Text(
                          //             'Back',
                          //             style: TextStyle(fontSize: 16,color: Colors.white),
                          //           )),
                          //     ),
                          //   ],
                          // ),
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
