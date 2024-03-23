import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/getdetailscheckcontroller.dart';
import 'package:yarn_modified/getxcontrollers/packagecontroller.dart';
import 'package:yarn_modified/getxcontrollers/uploadphoto.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/fabric-section/fabric-category-screen.dart';
import 'package:yarn_modified/screens/package/packagelist.dart';
import 'package:yarn_modified/screens/yarn-section/yarn-category-screen.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/widgets/common_fields.dart';
import '../cricketscreens/admin/tournament/tournamentpage.dart';
import '../cricketscreens/audiance/tournamentlist.dart';
import '../cricketscreens/getx/usercontroller.dart';
import '../cricketscreens/selection page.dart';
import 'main-fabric root/fabric-screen-root.dart';
import 'main-yarn-root/yarn-screen-root.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PackageController packageController = Get.put(PackageController());
  GetDetailsCheck getdetailController = Get.put(GetDetailsCheck());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    getdetailController.getDeviceId13();
    packageController.PackageSummaryAPi();
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
                                child: Image.asset(
                                    "images/textilediary-logo-512-removebg-preview.png"))),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Center(
                                child: Text(
                              "Welcome ${saveUser()?.name}",
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
                              "Yarn Category",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                  color: MyTheme.appBarColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              getdetailController.getDeviceId13();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          YarnCategoryScreen()));
                            },
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              "Yarn Rate",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                  color: MyTheme.appBarColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              getdetailController.getDeviceId13();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => YarnScreenRoot()));
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
                              "Fabric Category",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                  color: MyTheme.appBarColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              getdetailController.getDeviceId13();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FabricCategoryScreen()));
                            },
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              "Fabric Cost",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                  color: MyTheme.appBarColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MyTheme.appBarColor,
                            ),
                            onTap: () {
                              getdetailController.getDeviceId13();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FabricScreenRoot()));
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

                  // SizedBox(
                  //   height: 20,
                  // ),
                  GetBuilder<PackageController>(
                    builder: (controller) => controller.showsummary
                        ? Column(
                            children: [
                              Visibility(
                                visible: Platform.isAndroid
                                    ? controller.packagessummary?.userPackages
                                                ?.cricketAndroid !=
                                            0
                                        ? true
                                        : false
                                    : controller.packagessummary?.userPackages
                                                ?.cricketIos !=
                                            0
                                        ? true
                                        : false,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: homeCardRadius),
                                    color: Colors.white,
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "CRICKET",
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
                                            "Player Registration",
                                            textScaleFactor: 1.4,
                                            style: TextStyle(
                                                color: MyTheme.appBarColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          trailing: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: MyTheme.appBarColor,
                                          ),
                                          onTap: () {
                                            userController
                                                .getuserconrollerCall();
                                          },
                                        ),
                                        ListTile(
                                          dense: true,
                                          title: Text(
                                            "View Tournaments",
                                            textScaleFactor: 1.4,
                                            style: TextStyle(
                                                color: MyTheme.appBarColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          trailing: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: MyTheme.appBarColor,
                                          ),
                                          onTap: () {
                                            Get.to(TournamentAudiance());
                                            // FlutterToast.showCustomToast(
                                            //     "Coming Soon....");
                                          },
                                        ),
                                        ListTile(
                                          dense: true,
                                          title: Text(
                                            "Organize a Tournament",
                                            textScaleFactor: 1.4,
                                            style: TextStyle(
                                                color: MyTheme.appBarColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          trailing: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: MyTheme.appBarColor,
                                          ),
                                          onTap: () {
                                            Get.to(TournamentPage());
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller
                                        .packagessummary?.packageVisible ??
                                    false,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      getdetailController.getDeviceId13();
                                      controller.PackagelistgetAPI();
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: homeCardRadius),
                                      color: Colors.white,
                                      elevation: 5,
                                      child: Container(
                                        width:
                                            screenwidth(context, dividedby: 1),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "SUBSCRIPTION",
                                              textScaleFactor: 1.3,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            ListTile(
                                              dense: true,
                                              title: Text(
                                                "Current Package",
                                                textScaleFactor: 1.4,
                                                style: TextStyle(
                                                    color: MyTheme.appBarColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              // trailing: Icon(
                                              //   Icons.keyboard_arrow_right_rounded,
                                              //   color: MyTheme.appBarColor,
                                              // ),
                                            ),
                                            ListTile(
                                              dense: true,
                                              title: Text(
                                                "${controller.packagessummary?.remaningDays} days left",
                                                textScaleFactor: 1.4,
                                                style: TextStyle(
                                                    color: MyTheme.appBarColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              trailing: Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: MyTheme.appBarColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
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
