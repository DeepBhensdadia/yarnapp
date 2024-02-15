import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yarn_modified/screens/profile-section/aboutusscreen.dart';
import 'package:yarn_modified/screens/profile-section/account-section/account.dart';
import 'package:yarn_modified/screens/profile-section/contectus.dart';
import 'package:yarn_modified/screens/profile-section/favourite-section/favourites.dart';
import 'package:yarn_modified/screens/profile-section/notification-section/notifications.dart';
import 'package:yarn_modified/screens/profile-section/orders-section/my-order.dart';
import 'package:yarn_modified/screens/profile-section/settings-section/settings.dart';
import 'package:yarn_modified/screens/profile-section/termsandconditionscreen.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../static_json/profile_json.dart';
import '../auth-section/login-screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Sign Out",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            content: Text(
              "Are you sure you want to sign out?",
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
                    SharedPref.deleteAll();
                    Get.deleteAll(force: true);
                    Get.offAll(LoginScreen());
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
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10),
                    //   child: Text(
                    //     'Hello, ${saveUser()?.name}.',
                    //     textScaleFactor: 1.75,
                    //     style: TextStyle(
                    //         color: Colors.black, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 7.5),
                              shrinkWrap: true,
                              itemCount: profileItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Icon(
                                    profileItems[index]['icon'],
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    profileItems[index]['text'],
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(MyAccount());
                                    } else if (index == 1) {
                                      // Get.to(TermsConditionScreen());
                                      launchUrl(Uri.parse(
                                          "https://www.termsfeed.com/live/3f527e16-40a2-4cab-b9ee-63558ec0a3af"));
                                    } else if (index == 2) {
                                      launchUrl(Uri.parse(
                                          "https://www.termsfeed.com/live/3f527e16-40a2-4cab-b9ee-63558ec0a3af"));
                                    } else if (index == 3) {
                                      Get.to(ContactUs());
                                    } else if (index == 4) {
                                      Get.to(AboutUsScreen());
                                    } else if (index == 5) {
                                      // Get.to()
                                      _onBackButtonPressed(context);
                                    }
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

/*
*  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('Hello, Username.',textScaleFactor: 1.75,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Divider(
                  thickness: 3,color: Colors.grey,
                ),
                Expanded(child: ListView.builder(
                  itemCount: profileItems1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(profileItems1[index]['icon']),
                      title: Text(profileItems1[index]['text']),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      onTap: () {
                        // if(index == 0) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                        // }
                        // else if(index == 1) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
                        // }
                        // else if(index == 2) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                        // }
                        // else if(index == 3) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                        // }
                        // else if(index == 4) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                        // }
                      },
                    );
                })),
                Divider(
                  thickness: 3,color: Colors.grey,indent: 30,endIndent: 30,
                ),
                Expanded(flex: 3,child: ListView.builder(
                    itemCount: profileItems2.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(profileItems2[index]['icon']),
                        title: Text(profileItems2[index]['text']),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                        onTap: () {
                          // if(index == 0) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                          // }
                          // else if(index == 1) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
                          // }
                          // else if(index == 2) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                          // }
                          // else if(index == 3) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                          // }
                          // else if(index == 4) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                          // }
                        },
                      );
                    })),
                Divider(
                  thickness: 3,color: Colors.grey,indent: 30,endIndent: 30,
                ),
                Expanded(flex: 3,child: ListView.builder(
                    itemCount: profileItems3.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(profileItems3[index]['icon']),
                        title: Text(profileItems3[index]['text']),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                        onTap: () {
                          // if(index == 0) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                          // }
                          // else if(index == 1) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
                          // }
                          // else if(index == 2) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                          // }
                          // else if(index == 3) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                          // }
                          // else if(index == 4) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                          // }
                        },
                      );
                    })),
              ],
            ),
            * */

// class CustomListView extends StatelessWidget {
//   const CustomListView({super.key, required this.Icondata, required this.text});
//
//   final  String text;
//   final IconData Icondata;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(Icondata),
//       title: Text(text),
//       trailing: Icon(Icons.keyboard_arrow_right_rounded),
//       onTap: () {
//
//       },
//     );
//   }
// }

//============================Rough==========================
