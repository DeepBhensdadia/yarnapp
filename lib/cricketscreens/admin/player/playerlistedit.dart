import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';
import 'package:yarn_modified/cricketscreens/model/getplayerrolelist.dart';
import 'package:yarn_modified/cricketscreens/model/getteamplayerlist.dart';

import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../helper.dart';
import '../../../services/app_url.dart';
import '../../getx/playercontroller.dart';
import '../../getx/usercontroller.dart';
import '../../model/getteamslistresponse.dart';
import '../../photoscreen.dart';

import '../teams/addteamscreen.dart';
import 'addplayerscreen.dart';

class PlayersEditPosition extends StatefulWidget {
  final Teams teamid;
  final RxList<playersresponse> playerlist;
  const PlayersEditPosition(
      {super.key, required this.teamid, required this.playerlist});

  @override
  State<PlayersEditPosition> createState() => _PlayersEditPositionState();
}

class _PlayersEditPositionState extends State<PlayersEditPosition> {
  PlayerController playerController = Get.put(PlayerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool editedt = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return editedt == true
            ? showdialogboxalert(
                context, "Do you want to exit without Updating?")
            : Future.value(true);
      },
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "${widget.teamid.teamName}",
            textScaleFactor: 1,
            style:
                TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: decration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5),
                    child: Column(
                      children: [
                        Obx(
                          () => widget.playerlist.isEmpty
                              ? Container(
                                  height: screenheight(context, dividedby: 1.5),
                                  child: Center(
                                    child: Text("No data Found"),
                                  ))
                              : ReorderableListView(
                                  shrinkWrap: true,
                                  onReorderStart: (index) {
                                    print("true");
                                  },
                                  onReorder: (int oldIndex, int newIndex) {
                                    setState(() {
                                      editedt = true;
                                      if (oldIndex < newIndex) {
                                        newIndex -= 1;
                                      }
                                      final playersresponse? item = widget
                                          .playerlist.value
                                          .removeAt(oldIndex);
                                      widget.playerlist.value
                                          .insert(newIndex, item!);

                                      // Update the player ID in the playerids set based on the new order
                                      String playerId =
                                          item.player?.id.toString() ?? "";
                                      if (playerController.playerids
                                          .contains(playerId)) {
                                        playerController.playerids
                                            .remove(playerId);
                                        playerController.playerids
                                            .insert(newIndex, playerId);
                                      }
                                      print(playerController.playerids
                                          .toString());
                                    });
                                    // setState(() {
                                    //   if (oldIndex < newIndex) {
                                    //     newIndex -= 1;
                                    //   }
                                    //   final playersresponse? item =
                                    //       playerController.getplayerlist.value
                                    //           .removeAt(
                                    //               oldIndex); // Assuming 'player' is the field in 'playersresponse' containing the 'Player' object
                                    //   playerController.getplayerlist.value
                                    //       .insert(newIndex, item!);
                                    // });
                                  },
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  children: [
                                    for (int index = 0;
                                        index < widget.playerlist.length;
                                        index += 1)
                                      ListTile(
                                        onTap: () {},
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        minVerticalPadding: 0,
                                        key: ValueKey(index),
                                        title: Card(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  right: 0.0,
                                                  left: 10,
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      PhotoScreencric(
                                                          dobbn: 25,
                                                          image: URLs
                                                                  .image_url_player +
                                                              "${widget.playerlist[index].player?.logo}"),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: screenwidth(
                                                                context,
                                                                dividedby:
                                                                    2.35),
                                                            child: Text(
                                                              "${widget.playerlist[index].player?.playerName}",
                                                              textScaleFactor:
                                                                  1.25,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15.0),
                                                    child: Icon(
                                                      Icons.menu,
                                                      size: 30,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                  ],
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  playerController.ChangePlayerPosition(
                      teamid: widget.teamid.id.toString(),
                      ordersequence: playerController.playerids);
                },
                child: Container(
                  height: 50,
                  color: darkBlue,
                  child: Center(
                    child: Text(
                      "Confirm Position",
                      style: TextStyle(
                          letterSpacing: 0.6,
                          color: kwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
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
}
