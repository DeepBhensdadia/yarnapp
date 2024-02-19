import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import '../player/playerprofilescreen.dart';

class PlayersListAudiance extends StatefulWidget {
  const PlayersListAudiance({super.key});

  @override
  State<PlayersListAudiance> createState() => _PlayersListAudianceState();
}

class _PlayersListAudianceState extends State<PlayersListAudiance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text('Team Players'),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: ListView.builder(
          itemCount: 10,
          // shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              child: ListTile(
                onTap: () {
                  Get.to(PlayerProfileScreen());
                },
                minVerticalPadding: 20,
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: CupertinoColors.black)),
                ),
                title: Text(
                  "Player ${index + 1}",
                  style: TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  index == 0
                      ? "Captain"
                      : index == 1
                          ? "Vice Captain"
                          : index == 3
                              ? "Bowler"
                              : index == 5
                                  ? "Bowler"
                                  : "Batsman",
                  style: TextStyle(
                      color: (index == 0 || index == 1)
                          ? kthemecolor
                          : Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
