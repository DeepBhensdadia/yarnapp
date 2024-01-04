import 'dart:async';
import 'dart:convert';
import 'dart:developer';
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
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import 'package:yarn_modified/screens/profile-section/account-section/verifyotpforold.dart';
import 'package:yarn_modified/screens/root-app.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import 'package:yarn_modified/widgets/common_fields.dart';

class NewMobileNumber extends StatefulWidget {
  const NewMobileNumber(
      {super.key});

  @override
  State<NewMobileNumber> createState() => _NewMobileNumberState();
}

class _NewMobileNumberState extends State<NewMobileNumber>
    with SingleTickerProviderStateMixin {
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
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
                  'Enter New Mobile Number',
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
              body:  Column(
                children: [
                  SizedBox(height: 30,),
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
                                labelText: "Enter New Mobile Number",
                                hintText: "Enter Mobile Number"),

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
                                      Get.put(PhoneNumberChangenew()).sendOTP( mobileController.text);
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
