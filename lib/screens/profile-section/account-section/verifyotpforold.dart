import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/authcontroller.dart';
import 'package:yarn_modified/getxcontrollers/firebaseauthcontroller.dart';
import 'package:yarn_modified/getxcontrollers/phonenumberchangednew.dart';
import 'package:yarn_modified/getxcontrollers/phonenumberchangeold.dart';
import 'package:yarn_modified/getxcontrollers/updateuserdetails.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import 'package:yarn_modified/screens/profile-section/account-section/newmobilenumber.dart';
import 'package:yarn_modified/screens/root-app.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import 'package:yarn_modified/widgets/common_fields.dart';

class VerifyOtpOld extends StatefulWidget {
  final String phonenumber;
  final bool oldnumebr;
  const VerifyOtpOld(
      {super.key, required this.phonenumber, this.oldnumebr = false});

  @override
  State<VerifyOtpOld> createState() => _VerifyOtpOldState();
}

class _VerifyOtpOldState extends State<VerifyOtpOld>
    with SingleTickerProviderStateMixin {
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  void initState() {
    super.initState();
  }

  AuthController authController = Get.put(AuthController());
  UpdateUserController updateUserController = Get.put(UpdateUserController());
  @override
  void dispose() {
    super.dispose();
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
                  Colors.transparent,
                  Colors.white.withOpacity(0.30),
                  Colors.white.withOpacity(0.65),
                  Colors.white.withOpacity(0.85)
                ])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  'Verify Mobile Number',
                  textScaleFactor: 1,
                  style: TextStyle(color: MyTheme.appBarTextColor),
                ),
                // centerTitle: true,
                backgroundColor: MyTheme.appBarColor,
                elevation: 5,
                automaticallyImplyLeading: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white.withOpacity(0.20),
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.025),
                        Colors.transparent,
                      ])),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: Text(
                      widget.oldnumebr
                          ? 'Please enter the OTP sent to your old mobile number'
                          : 'Please enter the OTP sent to your new mobile number',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Pinput(
                              defaultPinTheme: PinTheme(
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                width: 56,
                                height: 56,
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(30, 60, 87, 1),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                              length: 6,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                FilteringTextInputFormatter.deny(
                                    RegExp('[\\.]')),
                              ],
                              onCompleted: (pin) async {
                                log(pin);
                                // if (pin == "123456") {
                                  if (widget.oldnumebr != true) {
                                    // updateUserController.updatemobilenumberpost(
                                    //     mobilenumber: widget.phonenumber);
                                    Get.put(PhoneNumberChangenew()).verifyOTP(smsCode: pin,phonenumber: widget.phonenumber);
                                    // FlutterToast.showCustomToast(
                                    //     "Mobile Number Changed Successfully");
                                    // Get.back();
                                    // Get.back();
                                  } else {
                                    Get.put(PhoneNumberChangeold()).verifyOTP(smsCode: pin);
                                  }
                                // } else {
                                //   FlutterToast.showCustomToast("Invalid OTP");
                                // }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      if (widget.oldnumebr != true){
                                        Get.put(PhoneNumberChangenew()).ResendOTP(widget.phonenumber);
                                      }else{
                                        Get.put(PhoneNumberChangeold()).ResendOTP(widget.phonenumber);
                                      }
                                      // await firebaseAuthContrller
                                      //     .sendOTP(widget.phonenumber);
                                    },
                                    style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.black
                                                    .withOpacity(0.2)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                    child: Text(
                                      'Resend OTP ',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ],
                            ),
                          ],
                        ),
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
