import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/getxcontrollers/packagecontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/model/packagelistresponse.dart';
import 'package:yarn_modified/services/app_url.dart';
import '../../const/const.dart';
import '../../const/themes.dart';

class packageListScreen extends StatefulWidget {
  const packageListScreen({super.key});

  @override
  State<packageListScreen> createState() => _packageListScreenState();
}

class _packageListScreenState extends State<packageListScreen> {
  PackageController packagelist = Get.put(PackageController());

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
              'Package List',
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
              SizedBox(
                height: 15,
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
                        Text(
                          packagelist.paymentdetails?.first.name ?? "",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Image.network(
                            width: screenwidth(context, dividedby: 1.5),
                            "${URLs.image_url}${packagelist.paymentdetails?.first.image}"),
                        Text(
                          "Scan to pay with any UPI app",
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                        MaterialButton(
                          onPressed: () {
                            _copyToClipboard(
                                packagelist.paymentdetails?.first.upiId ?? "");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "UPI ID: ${packagelist.paymentdetails?.first.upiId}  ",
                                textScaleFactor: 1,
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: packagelist.getData?.length,
                    itemBuilder: (context, index) {
                      Package package = packagelist.getData![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            // Get.to(PaymentCartScreen(packagedetails :package));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: homeCardRadius),
                            color: Colors.white,
                            elevation: 5,
                            child: Container(
                              width: screenwidth(context, dividedby: 1),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            package.name ?? "",
                                            textScaleFactor: 1.3,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            package.description ?? "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
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
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "${package.days} days",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          // MaterialButton(onPressed: () {
                                          //
                                          // },child: Text("Upgrade",style: TextStyle(color: Colors.black),),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
