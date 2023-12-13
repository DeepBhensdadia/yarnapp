import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/updateuserdetails.dart';
import 'package:yarn_modified/screens/auth-section/login-screen.dart';
import 'package:yarn_modified/screens/profile-section/account-section/deleteaccoutotpscreen.dart';
import 'package:yarn_modified/screens/profile-section/account-section/verifyotpforold.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import 'package:yarn_modified/widgets/common_fields.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Future<bool> _onBackButtonPressed(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Delete Account",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            content: Text(
              "if you delete this account, next time you will not get free package",
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
                  onPressed: () async {
                    Get.to(DeleteAccountVerifyOtp(phonenumber: saveUser()?.mobileNumber ?? "",));
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          );
        });
    return false;
  }

  TextEditingController nameController =
      TextEditingController(text: saveUser()?.name);
  TextEditingController mobileController =
      TextEditingController(text: saveUser()?.mobileNumber);
  TextEditingController emailController =
      TextEditingController(text: saveUser()?.email);
  TextEditingController businessnameController =
      TextEditingController(text: saveUser()?.companyName);
  TextEditingController locationController =
      TextEditingController(text: saveUser()?.city);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UpdateUserController updateUserController = Get.put(UpdateUserController());

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
              'Profile',
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
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
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
                                    controller: nameController,
                                    labelText: 'Name *',
                                    keyboardType: TextInputType.text,
                                    hintText: 'Enter Your Full Name',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\-_]')),
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonMobileTextField(
                                            read: true,
                                            validator: (p0) {
                                              if (p0!.isEmpty) {
                                                return "Enter Mobile Number";
                                              } else if (p0.length < 10) {
                                                return "Enter Valid Mobile Number";
                                              }
                                            },
                                            controller: mobileController,
                                            labelText: "Mobile Number *",
                                            hintText: "Enter Mobile Number"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(VerifyOtpOld(
                                            phonenumber:
                                                saveUser()?.mobileNumber ?? '',
                                            oldnumebr: true,
                                          ));
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Colors.white70),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Change Number',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  CommonTextField(
                                    controller: emailController,
                                    labelText: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Email Address',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\]')),
                                  ),
                                  SizedBox(height: 20),
                                  CommonTextField(
                                    controller: businessnameController,
                                    labelText: 'Business Name',
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Email Address',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\]')),
                                  ),
                                  SizedBox(height: 20),
                                  CommonTextField(
                                    controller: locationController,
                                    labelText: 'Location',
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Location',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\]')),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            updateUserController.updateuserpost(
                                                name: nameController.text,
                                                email: emailController.text,
                                                companyname:
                                                    businessnameController.text,
                                                city: locationController.text);
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
                                        child: Text('Update')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(25),
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                                _onBackButtonPressed(context);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              child: Text('Delete Account')),
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
    );
  }
}
