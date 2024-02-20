import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/player/addplayerdetails.dart';
import '../const/themes.dart';
import '../constcolor.dart';
import 'admin/adminrootscreen.dart';
import 'admin/tournament/tornamenttab.dart';
import 'admin/tournament/tournamentpage.dart';
import 'audiance/tournamentlist.dart';
import 'player/playerrootscreen.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text('Selection Screen'),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(TournamentTabs());
                    // Get.to(TournamentPage());
                  },
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.red.withOpacity(0.5),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundImage: AssetImage("images/avatar.png"),
                          radius: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("I am Organizer"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(AddPlayerDetails());
                  },
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.red.withOpacity(0.5),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundImage: AssetImage("images/avatar.png"),
                          radius: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("I am Player"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(TournamentAudiance());
                  },
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.red.withOpacity(0.5),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundImage: AssetImage("images/avatar.png"),
                          radius: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("I am Audience"),
                      ],
                    ),
                  ),
                ),
                // ListTile(
                //   onTap: () {
                //     Get.to(TournamentTabs());
                //   },
                //   title: Text("As a Organizer"),
                // ),  ListTile(
                //   onTap: () {
                //     Get.to(TournamentPage());
                //   },
                //   title: Text("Create tournament"),
                // ),
                // ListTile(
                //   onTap: () {
                //     Get.to(AddPlayerDetails());
                //   },
                //   title: Text("As a Player"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
