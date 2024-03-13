import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/cricketscreens/model/usercheckmodel.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/services/all_api_services.dart';

import '../../../const/themes.dart';
import '../../../services/app_url.dart';
import '../../getx/usercontroller.dart';
import '../../model/searchplayerresponse.dart';
import '../../photoscreen.dart';
import '../../player/addplayerdetails.dart';

class PlayerProfileAdmin extends StatefulWidget {
  final PlayerDetails? data;
  const PlayerProfileAdmin({super.key, this.data});

  @override
  State<PlayerProfileAdmin> createState() => _PlayerProfileAdminState();
}

class _PlayerProfileAdminState extends State<PlayerProfileAdmin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool dataall = false;
  @override
  void initState() {
    playerdata = widget.data ?? PlayerDetails();
    if (userController.playerdata != null) dataall = true;
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  UserController userController = Get.put(UserController());

  late PlayerDetails playerdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          dataall ? playerdata.playerName ?? '' : 'Deep Bhensdadia',
          textScaleFactor: 1,
          style: TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            color: Cricket_SkyBlue_Color,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(7.5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                dividerColor: kthemecolor,
                indicatorColor: kthemecolor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: kthemecolor),
                labelColor: kwhite,
                unselectedLabelColor: kthemecolor,
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    text: 'PROFILE',
                  ),
                  Tab(
                    text: "MATCHES",
                  ),
                  Tab(
                    text: 'TEAMS',
                  ),
                  Tab(
                    text: 'STATS',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: decration,
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: PhotoScreencric(
                                        dobbn: 35,
                                        image: URLs.image_url_player +
                                            "${playerdata.logo}",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dataall
                                                ? playerdata.playerName ?? ''
                                                : "Deep Bhensdadia",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          // SizedBox(height: 5),
                                          // Text(
                                          //   "Age :-  ${dataall ? playerdata.age ?? '   ---' : "23"}",
                                          //   style: TextStyle(fontSize: 14,color:Cricket_textColorSecondary ),
                                          // ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          InkWell(
                                            onTap: () {},
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: darkBlue),
                                                height: 25,
                                                width: 100,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Follow",
                                                      style: TextStyle(
                                                          color: kwhite),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                          Container(
                            width: screenwidth(context, dividedby: 1),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Age",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          dataall
                                              ? playerdata.calAge.toString() ??
                                                  ''
                                              : "23",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          dataall
                                              ? playerdata.city.toString() ?? ''
                                              : "surat",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Playing Role",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          dataall
                                              ? playerdata.skills ?? ''
                                              : "----",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Batting Style",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          dataall
                                              ? playerdata.battingStyle ?? ''
                                              : "RHB (Right Handed Batsman)",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bowling Style",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          dataall
                                              ? playerdata.bowlingStyle ?? ''
                                              : "----",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Wicket Keeping",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          dataall
                                              ? playerdata.wicketKeeper ?? ''
                                              : "Yes",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
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
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(
                        //   CupertinoIcons.creditcard,
                        //   color: Colors.black,
                        //   size: 100,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "This player has not participated in any matches yet.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   CupertinoIcons.er,
                      //   color: Colors.black,
                      //   size: 100,
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("This player has not joined any team yet.",
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.wine_bar_rounded,
                      //   color: Colors.black,
                      //   size: 100,
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("No Data.",
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Addphoto extends StatefulWidget {
  const Addphoto({super.key});

  @override
  State<Addphoto> createState() => _AddphotoState();
}

class _AddphotoState extends State<Addphoto> {
  File? _image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 190, maxHeight: 190),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Material(
                  elevation: 0,
                  shape: CircleBorder(
                      side: BorderSide(width: 1.5, color: Colors.grey)),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: _image == null
                      ? Ink.image(
                          image: AssetImage("images/avatar.png"),
                          fit: BoxFit.contain,
                          width: 220,
                          height: 220,
                          child: InkWell(
                            radius: 0,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (_) => Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                                AssetImage("images/avatar.png"),
                                            fit: BoxFit.contain),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Ink.image(
                          image: FileImage(File(_image!.path).absolute),
                          fit: BoxFit.fill,
                          width: 220,
                          height: 220,
                          child: InkWell(
                            radius: 0,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (_) => Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(_image!.path).absolute),
                                            fit: BoxFit.fill),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: -40,
              left: 70,
              child: Tooltip(
                message: 'Pick Image',
                child: RawMaterialButton(
                  onPressed: () {
                    getImage();
                  },
                  elevation: 2,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                  padding: EdgeInsets.all(7.5),
                  shape: CircleBorder(side: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
