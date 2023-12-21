import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yarn_modified/getxcontrollers/packagecontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/model/packagelistresponse.dart';
import 'package:yarn_modified/services/app_url.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared_pref/shared_pref.dart';
import '../auth-section/login-screen.dart';

class packageListScreen extends StatefulWidget {
  final Packagelistresponse package;
  const packageListScreen({super.key, required  this.package});

  @override
  State<packageListScreen> createState() => _packageListScreenState();
}

class _packageListScreenState extends State<packageListScreen> {
  // PackageController packagelist = Get.put(PackageController());

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    FlutterToast.showCustomToast("Copied UPI ID to clipboard");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Packages ',
              textScaleFactor: 1,
              style: TextStyle(color: MyTheme.appBarTextColor),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextButton(onPressed: () {
                  SharedPref.deleteAll();
                  Get.deleteAll(force: true);
                  Get.offAll(LoginScreen());
                }, child: Text("Sign Out",style: TextStyle(color: Colors.white),)),
              )
            ],
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Please share a screenshot after completing the payment.",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: homeCardRadius),
                  color: Colors.white,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: screenwidth(context, dividedby: 1),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              final whatsappUrl =
                                  "https://api.whatsapp.com/send?phone=${widget.package.paymentDetails?.first.mobileNumber}";
                              await launchUrl(Uri.parse(whatsappUrl));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        widget.package.paymentDetails?.first.name ??
                                            "",
                                        textScaleFactor: 1.5,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "+91 ${widget.package.paymentDetails?.first.mobileNumber}",
                                        textScaleFactor: 1.2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.green,
                                    size: 35,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Image.network(
                              width: screenwidth(context, dividedby: 1.5),
                              "${URLs.image_url}${widget.package.paymentDetails?.first.image}"),
                          Text(
                            "Scan to pay with any UPI app",
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          MaterialButton(
                            onPressed: () {
                              _copyToClipboard(
                                  widget.package.paymentDetails?.first.upiId ??
                                      "");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "UPI ID: ${widget.package.paymentDetails?.first.upiId}  ",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.copy,
                                  color: Colors.black,
                                  size: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Card(
                      shape:
                          RoundedRectangleBorder(borderRadius: homeCardRadius),
                      color: Colors.white,
                      elevation: 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.package.package?.length,
                        itemBuilder: (context, index) {
                          Package package = widget.package.package![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InkWell(
                              onTap: () {
                                // Get.to(PaymentCartScreen(packagedetails :package));
                              },
                              child: Container(
                                width: screenwidth(context, dividedby: 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${package.days} days",
                                              textScaleFactor: 1.3,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            // Text(
                                            //   package.description ?? "",
                                            //   style: TextStyle(
                                            //       color: Colors.black,
                                            //       fontSize: 14,
                                            //       fontWeight: FontWeight.w400),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "₹${package.amount}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
