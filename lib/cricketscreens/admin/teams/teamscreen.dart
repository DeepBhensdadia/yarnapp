import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constcolor.dart';

import '../../../const/themes.dart';
import '../player/playerslistscreen.dart';
import 'addteamscreen.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,

      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10, ),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(bottom: 0,top: 10),
                        child: Card(
                          margin: EdgeInsets.zero,

                          child: ListTile(
                            visualDensity: VisualDensity.compact,
                            onTap: () {
                              Get.to(PlayersListScreen());
                            },
                            // minVerticalPadding: 20,
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: CupertinoColors.black)),
                            ),
                            title: Text(
                              "India",
                              style: TextStyle(
                                  color: CupertinoColors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              "IND",
                              style: TextStyle(
                                  color: CupertinoColors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: CupertinoColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(AddTeamScreen());
              },
              child: Container(
                height: 50,
                color: kthemecolor,
                child: Center(
                  child: Text(
                    "Add Team",
                    style: TextStyle(
                        color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
