import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/packagecontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/auth-section/login-screen.dart';
import 'package:yarn_modified/screens/fabric-section/fabric-category-screen.dart';
import 'package:yarn_modified/screens/yarn-section/yarn-category-screen.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  // PackageController packageController = Get.put(PackageController());
  @override
  void initState() {
    // packageController.PackageSummaryAPi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.scaffoldColor,
      body: Container(
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
        child: Stack(
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
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                height: 125,
                                width: 150,
                                child:
                                Image.asset("images/textilediary-logo-512-removebg-preview.png"))),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Center(
                                child: Text(
                                  "Welcome Guest",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.6,
                                  style: TextStyle(
                                      color: MyTheme.scaffoldColor,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      shape:
                      RoundedRectangleBorder(borderRadius: homeCardRadius),
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "YARN",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              "YARN CATEGORY",
                              textScaleFactor: 1.3,
                              style: TextStyle(color: MyTheme.appBarColor),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              Get.off(LoginScreen());

                            },
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              "YARN RATE",
                              textScaleFactor: 1.3,
                              style: TextStyle(color: MyTheme.appBarColor),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              Get.off(LoginScreen());

                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      shape:
                      RoundedRectangleBorder(borderRadius: homeCardRadius),
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "FABRIC",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              "FABRIC CATEGORY",
                              textScaleFactor: 1.3,
                              style: TextStyle(color: MyTheme.appBarColor),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              Get.off(LoginScreen());

                            },
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              "FABRIC COST",
                              textScaleFactor: 1.3,
                              style: TextStyle(color: MyTheme.appBarColor),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                   Get.off(LoginScreen());
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: homeCardRadius),
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: screenwidth(context, dividedby: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text(
                                  "SUBSCRIPTION",
                                  textScaleFactor: 1.3,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Current package",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight:
                                            FontWeight.w400),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 15,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Free Package",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "30 days left",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    // MaterialButton(onPressed: () {
                                    //
                                    // },child: Text("Upgrade",style: TextStyle(color: Colors.black),),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
