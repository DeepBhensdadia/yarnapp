import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/firebaseauthcontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../widgets/common_fields.dart';
import 'verifyotpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final tenDigitsOnly = new RegExp(r'^\d{0,10}$');
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuthContrller firebaseAuthContrller =
      Get.put(FirebaseAuthContrller());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () => _onBackButtonPressed(context),
          child: Container(
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
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: MyTheme.appBarColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.white.withOpacity(0.75),
                          //     spreadRadius: 100,
                          //     blurRadius: 200
                          //   )
                          // ],
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
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: screenheight(context,dividedby: 10)),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: 155,
                                  width: 150,
                                  child: Image.asset(
                                      "images/RR_Textiles-r.png"))),
                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Let's Get Started",
                              textScaleFactor: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.scaffoldColor),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Please Enter Your Phone Number to Get Access',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 25),
                          Card(
                            color: Colors.white,
                            elevation: 10,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    CommonMobileTextField(
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return "Enter Mobile Number";
                                          } else if (p0.length < 10) {
                                            return "Enter Valid Mobile Number";
                                          }
                                        },
                                        controller: mobileController,
                                        labelText: "Mobile Number",
                                        hintText: "Enter Mobile Number"),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                    //     Text(
                                    //     'An OTP will be sent to this number',
                                    //     textScaleFactor: 0.9,
                                    //     style: TextStyle(
                                    //     fontWeight: FontWeight.w400,
                                    //     color: Colors.black),
                                    //     ),
                                    //   ],
                                    // ),

                                    // SizedBox(height: 20),
                                    SizedBox(height: 30),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // context.loaderOverlay.show();
                                              // await firebaseAuthContrller
                                              //     .sendOTP(
                                              //         mobileController.text);
                                              FlutterToast.showCustomToast(
                                                  "OTP sent Successfully");
                                              Get.to(VerifyOtpScreen(
                                                  phonenumber:
                                                      mobileController.text));
                                            }
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty
                                                  .all(RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(8))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      MyTheme.appBarColor)),
                                          child: Text('Get OTP')),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Text("Don't have an account?",
                          //         style: TextStyle(color: Colors.black)),
                          //     SizedBox(
                          //       width: 0,
                          //     ),
                          //     TextButton(
                          //         onPressed: () {
                          //           Get.off(SignUpScreen());
                          //         },
                          //         style: ButtonStyle(
                          //             overlayColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.black
                          //                         .withOpacity(0.2)),
                          //             shape: MaterialStateProperty.all(
                          //                 RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(10))),
                          //             backgroundColor: MaterialStateProperty.all(
                          //                 Colors.transparent.withOpacity(0)),
                          //             foregroundColor:
                          //                 MaterialStateProperty.all(
                          //                     Colors.transparent)),
                          //         child: Text(
                          //           'Register Now',
                          //           style: TextStyle(
                          //               color: Colors.black,
                          //               decoration: TextDecoration.underline),
                          //         )),
                          //   ],
                          // ),
                          // SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
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
