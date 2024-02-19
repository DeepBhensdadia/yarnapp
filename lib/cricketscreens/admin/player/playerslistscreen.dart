import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';

import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../player/playerprofilescreen.dart';
import 'addplayerscreen.dart';

class PlayersListScreen extends StatefulWidget {
  const PlayersListScreen({super.key});

  @override
  State<PlayersListScreen> createState() => _PlayersListScreenState();
}

class _PlayersListScreenState extends State<PlayersListScreen> {
  MatchController matchController = Get.put(MatchController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,

        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: kthemecolor,
          title: Text("Team Name"),
          actions: [IconButton(onPressed: () {

          }, icon: Icon(Icons.edit))],
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: decration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${index == 1 ? "Not Confirm" : "Confirm"}",
                                style: TextStyle(
                                    color:
                                        index == 1 ? Colors.red : Colors.green),
                              ),
                              IconButton(
                                onPressed: () {
                                  _showBottomSheet(context);
                                },
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  color: CupertinoColors.black,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(AddPlayerScreen());
                },
                child: Container(
                  height: 50,
                  color: kthemecolor,
                  child: Center(
                    child: Text(
                      "Add Player",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Deep Bhensdadia',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Column(
                children: List.generate(
                  role.length,
                  (index) => ListTile(
                    visualDensity: VisualDensity.compact,
                    // dense: true,
                    leading: Icon(Icons.music_note),
                    title: Text(role[index]),
                    onTap: () {
                      // Handle the selection
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List role = [
    "Captain",
    "Wicket Keeper",
    "Bowler",
    "Batsman",
    "All rounder",
    "Remove"
  ];
}
