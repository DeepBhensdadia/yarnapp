import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:yarn_modified/getxcontrollers/authcontroller.dart';
import 'package:yarn_modified/getxcontrollers/firebaseauthcontroller.dart';
import 'package:yarn_modified/screens/auth-section/verifyotpscreen.dart';
import 'package:yarn_modified/screens/root-app.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../widgets/common_fields.dart';
import 'login-screen.dart';

class SignUpScreen extends StatefulWidget {
  final String? phonenumber;
  const SignUpScreen({super.key, this.phonenumber});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  AuthController authController = Get.put(AuthController());
  FirebaseAuthContrller firebaseAuthContrller =
      Get.put(FirebaseAuthContrller());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final tenDigitsOnly = new RegExp(r'^\d{0,10}$');

  final RegExp gmailRegex = RegExp(r'[a-z \d _\-\.]+@[a-z]{5}\.[a-z]{2,3}$');

  final RegExp passwordValidationExp =
      RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  void initState() {
    super.initState();
    authController.mobileController.text = widget.phonenumber ?? '';
  }

  // @override
  // void dispose() {
  //   authController.nameController.dispose();
  //   authController.mobileController.dispose();
  //   authController.emailController.dispose();
  //   super.dispose();
  // }

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
                                      Image.asset("images/textilediary-logo-512-removebg-preview.png"))),
                          Center(
                            child: Text(
                              'Create Account',
                              textScaleFactor: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.scaffoldColor),
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
                            // decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.all(Radius.circular(20))
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    CommonTextField(
                                      validatoe: (p0) {
                                        if (p0!.isEmpty) {
                                          return "Enter Name";
                                        }
                                        return null;
                                      },
                                      controller: authController.nameController,
                                      labelText: 'Name *',
                                      keyboardType: TextInputType.text,
                                      hintText: 'Enter Your Full Name',
                                      inputFormatters:
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'[/\\-_]')),
                                    ),

                                    SizedBox(height: 25),
                                    CommonMobileTextField(
                                        read: true,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return "Enter Mobile Number";
                                          } else if (p0.length < 10) {
                                            return "Enter Valid Mobile Number";
                                          }
                                        },
                                        controller:
                                            authController.mobileController,
                                        labelText: "Mobile Number *",
                                        hintText: "Enter Mobile Number"),

                                    SizedBox(height: 20),
                                    CommonTextField(
                                      controller:
                                          authController.emailController,
                                      labelText: 'Email',
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: 'Enter Your Email Address',
                                      inputFormatters:
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'[/\\]')),
                                    ),
                                    SizedBox(height: 20),
                                    CommonTextField(
                                      controller:
                                          authController.businessnameController,
                                      labelText: 'Business Name',
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: 'Enter Your Email Address',
                                      inputFormatters:
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'[/\\]')),
                                    ),
                                    SizedBox(height: 20),
                                    CommonTextField(
                                      controller:
                                          authController.locationController,
                                      labelText: 'Location',
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: 'Enter Your Location',
                                      inputFormatters:
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'[/\\]')),
                                    ),

                                    // CheckboxListTile(
                                    //   shape: RoundedRectangleBorder(
                                    //       borderRadius: BorderRadius.circular(10)),
                                    //   checkboxShape: CircleBorder(),
                                    //   checkColor: Colors.white,
                                    //   activeColor: Colors.blueAccent,
                                    //   side: BorderSide(color: Colors.black),
                                    //   contentPadding: EdgeInsets.all(0),
                                    //   value: checkboxValue,
                                    //   onChanged: (value) {
                                    //     setState(() => checkboxValue = value!);
                                    //   },
                                    //   title: Padding(
                                    //     padding: const EdgeInsets.all(5),
                                    //     child: RichText(
                                    //       textScaleFactor: 1.2,
                                    //       text: TextSpan(
                                    //           text: 'I agree to the ',
                                    //           style: TextStyle(
                                    //               color: MyTheme.appBarColor),
                                    //           children: [
                                    //             TextSpan(
                                    //               text: 'terms',
                                    //               style: TextStyle(
                                    //                   color: MyTheme.appBarColor,
                                    //                   decoration:
                                    //                   TextDecoration.underline,
                                    //                   fontWeight: FontWeight.bold),
                                    //             ),
                                    //             TextSpan(
                                    //               text: ' and ',
                                    //               style: TextStyle(
                                    //                   color: MyTheme.appBarColor),
                                    //             ),
                                    //             TextSpan(
                                    //               text: 'conditions.',
                                    //               style: TextStyle(
                                    //                   color: MyTheme.appBarColor,
                                    //                   decoration:
                                    //                   TextDecoration.underline,
                                    //                   fontWeight: FontWeight.bold),
                                    //             )
                                    //           ]),
                                    //     ),
                                    //   ),
                                    //   controlAffinity: ListTileControlAffinity.leading,
                                    // ),
                                    // checkboxValue
                                    //     ? SizedBox()
                                    //     : Align(
                                    //   alignment: AlignmentDirectional.centerStart,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(left: 15),
                                    //     child: Text(
                                    //         'Please accept terms and conditions.',
                                    //         textScaleFactor: 1,
                                    //         style: TextStyle(color: Colors.red)),
                                    //   ),
                                    // ),
                                    SizedBox(height: 30),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              authController.registerlogin();
                                              print("deep");
                                            }
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      MyTheme.appBarColor)),
                                          child: Text('Register')),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      constraints: BoxConstraints(),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Colors.white70),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child: Text(
                                              'Back',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 15),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Text("Already have an account ?",
                          //           textScaleFactor: 1.25,
                          //           style: TextStyle(color: Colors.black)),
                          //       SizedBox(
                          //         width: 5,
                          //       ),
                          //       TextButton(
                          //           onPressed: () {
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         LoginScreen()));
                          //           },
                          //           style: ButtonStyle(
                          //               overlayColor:
                          //                   MaterialStateColor.resolveWith(
                          //                       (states) => Colors.black
                          //                           .withOpacity(0.2)),
                          //               shape: MaterialStateProperty.all(
                          //                   RoundedRectangleBorder(
                          //                       borderRadius:
                          //                           BorderRadius.circular(10))),
                          //               backgroundColor: MaterialStateProperty.all(
                          //                   Colors.transparent.withOpacity(0)),
                          //               foregroundColor:
                          //                   MaterialStateProperty.all(
                          //                       Colors.transparent)),
                          //           child: Text(
                          //             'Login',
                          //             textScaleFactor: 1.25,
                          //             style: TextStyle(
                          //                 color: Colors.black.withOpacity(1),
                          //                 decoration: TextDecoration.underline),
                          //           )),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 10),
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
