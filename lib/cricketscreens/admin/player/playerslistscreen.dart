import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/admin/player/playerlistedit.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';
import 'package:yarn_modified/cricketscreens/model/getplayerrolelist.dart';
import 'package:yarn_modified/cricketscreens/model/getteamplayerlist.dart';

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

class PlayersListScreen extends StatefulWidget {
  final Teams teamid;
  const PlayersListScreen({super.key, required this.teamid});

  @override
  State<PlayersListScreen> createState() => _PlayersListScreenState();
}

class _PlayersListScreenState extends State<PlayersListScreen> {
  PlayerController playerController = Get.put(PlayerController());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    playerController.getplayerroleFromAPI();
    playerController.GetPlayerListFromAPI(teamid: widget.teamid.id.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "${widget.teamid.teamName}",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  child: Column(
                    children: [
                      Obx(() => playerController.playerbool.isFalse
                          ? SizedBox()
                          : playerController.getplayerlist.isEmpty
                              ? Container(
                                  height: screenheight(context, dividedby: 1.5),
                                  child: Center(
                                    child: Text("No data Found"),
                                  ))
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        playerController.getplayerlist.length,
                                    itemBuilder: (context, index) => ListTile(
                                      onLongPress: () {
                                        Get.to(PlayersEditPosition(
                                            teamid: widget.teamid,
                                            playerlist: playerController
                                                .getplayerlist));
                                      },
                                      onTap: () {
                                        userController.getplayerinfo(
                                            playerController
                                                .getplayerlist[index].player?.id
                                                .toString());
                                      },
                                      horizontalTitleGap: 0,
                                      contentPadding: EdgeInsets.zero,
                                      minVerticalPadding: 0,
                                      key: ValueKey(index),
                                      title: Card(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
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
                                                            "${playerController.getplayerlist[index].player?.logo}"),
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
                                                              dividedby: 2.35),
                                                          child: Text(
                                                            "${playerController.getplayerlist[index].player?.playerName}",
                                                            textScaleFactor:
                                                                1.25,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    playerController
                                                                .getplayerlist[
                                                                    index]
                                                                .roll ==
                                                            "Captain"
                                                        ? Container(
                                                            // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                            height: 25,
                                                            width: 25,
                                                            child: Center(
                                                              child: Text(
                                                                "C",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          )
                                                        : playerController
                                                                    .getplayerlist[
                                                                        index]
                                                                    .roll ==
                                                                "Vice Captain "
                                                            ? Container(
                                                                // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                                height: 25,
                                                                width: 25,
                                                                child: Center(
                                                                  child: Text(
                                                                    "VC",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              )
                                                            : playerController
                                                                            .getplayerlist[
                                                                                index]
                                                                            .roll ==
                                                                        "Wicketkeeper" &&
                                                                    playerController
                                                                            .getplayerlist[
                                                                                index]
                                                                            .isWicketkeeper ==
                                                                        1
                                                                ? Container(
                                                                    // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                                    height: 25,
                                                                    width: 25,
                                                                    child:
                                                                        Center(
                                                                            child:
                                                                                Text(
                                                                      "WK",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color: Colors
                                                                              .grey,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    )))
                                                                : SizedBox
                                                                    .shrink(),
                                                    playerController
                                                                .getplayerlist[
                                                                    index]
                                                                .isWicketkeeper ==
                                                            1
                                                        ? Text(
                                                            "WK",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        : SizedBox.shrink(),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Icon(
                                                          size: 22,
                                                          Icons
                                                              .watch_later_outlined),
                                                    ),
                                                    IconButton(
                                                      padding: EdgeInsets.zero,
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      onPressed: () {
                                                        print(playerController
                                                            .playerids
                                                            .toString());
                                                        if (playerController
                                                            .positionbool
                                                            .isTrue)
                                                          _showBottomSheet(
                                                              context,
                                                              playerController
                                                                  .getplayerrolelist,
                                                              playerController
                                                                      .getplayerlist[
                                                                  index]);
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .more_vert_outlined,
                                                        color:
                                                            Cricket_textColorSecondary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              "Extra Player",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: playerController.getextralist.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              userController.getplayerinfo(playerController
                                  .getextralist[index].player?.id
                                  .toString());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ListTile(
                                onTap: () {
                                  userController.getplayerinfo(playerController
                                      .getextralist[index].player?.id
                                      .toString());
                                },
                                horizontalTitleGap: 0,
                                contentPadding: EdgeInsets.zero,
                                minVerticalPadding: 0,
                                key: ValueKey(index),
                                title: Card(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 0.0,
                                          left: 10,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                  radius: 25,
                                                  backgroundImage: NetworkImage(
                                                      URLs.image_url_player +
                                                          "${playerController.getextralist[index].player?.logo}")),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: screenwidth(context,
                                                        dividedby: 1.8),
                                                    child: Text(
                                                      "${playerController.getextralist[index].player?.playerName}",
                                                      textScaleFactor: 1.25,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              playerController
                                                          .getextralist[index]
                                                          .roll ==
                                                      "Captain"
                                                  ? Container(
                                                      // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                      height: 28,
                                                      width: 28,
                                                      child: Center(
                                                        child: Text(
                                                          "C",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  : playerController
                                                              .getextralist[
                                                                  index]
                                                              .roll ==
                                                          "Vice Captain "
                                                      ? Container(
                                                          // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                          height: 28,
                                                          width: 28,
                                                          child: Center(
                                                            child: Text(
                                                              "VC",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        )
                                                      : playerController
                                                                  .getextralist[
                                                                      index]
                                                                  .roll ==
                                                              "Wicketkeeper"
                                                          ? Container(
                                                              // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                              height: 28,
                                                              width: 28,
                                                              child: Center(
                                                                  child: Text(
                                                                "WK",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )))
                                                          : SizedBox.shrink(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Icon(
                                                    size: 22,
                                                    Icons.watch_later_outlined),
                                              ),
                                              IconButton(
                                                padding: EdgeInsets.zero,
                                                visualDensity:
                                                    VisualDensity.compact,
                                                onPressed: () {
                                                  if (playerController.positionbool
                                                      .isTrue)
                                                    _showBottomSheet(
                                                        context,
                                                        playerController
                                                            .getplayerrolelist,
                                                        playerController
                                                                .getextralist[
                                                            index]);
                                                },
                                                icon: Icon(
                                                  Icons.more_vert_outlined,
                                                  color:
                                                      Cricket_textColorSecondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
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
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(AddPlayerScreen(teamid: widget.teamid));
                    },
                    child: Container(
                      height: 50,
                      color: darkBlue,
                      child: Center(
                        child: Text(
                          "Add Player",
                          style: TextStyle(
                              letterSpacing: 0.6,
                              color: kwhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                      visible: playerController.getplayerlist.length > 1
                          ? true
                          : false,
                      child: SizedBox(
                        width: 3,
                      )),
                ),
                Obx(
                  () => Visibility(
                    visible: playerController.getplayerlist.length > 1
                        ? true
                        : false,
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(PlayersEditPosition(
                              teamid: widget.teamid,
                              playerlist: playerController.getplayerlist));
                        },
                        child: Container(
                          height: 50,
                          color: darkBlue,
                          child: Center(
                            child: Text(
                              "Reorder",
                              style: TextStyle(
                                  letterSpacing: 0.6,
                                  color: kwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    RxList<Positions> getplayerrolelist,
    playersresponse? playerName,
  ) {
    showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${playerName?.player?.playerName}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                // Use Expanded widget to allow the inner ListView to take all available space
                child: ListView.builder(
                  itemCount: getplayerrolelist.length,
                  itemBuilder: (context, index) => ListTile(
                    visualDensity: VisualDensity.compact,
                    title:
                        Text(getplayerrolelist[index].positionName.toString()),
                    onTap: () {
                      if (getplayerrolelist[index].id == 6) {
                        playerController.DeletePlayerFromList(
                            playerid: "${playerName?.id}",
                            teamid: widget.teamid.id.toString());
                      } else {
                        playerController.playerroleAdd(
                            plyerid: "${playerName?.id}",
                            Position: "${getplayerrolelist[index].id}",
                            teamid: "${playerName?.team?.id}");
                      }
                    },
                  ),
                ),
              ),
              // Column(
              //   children: List.generate(
              //     getplayerrolelist.length,
              //     (index) => ListTile(
              //       visualDensity: VisualDensity.compact,
              //       // dense: true,
              //       // leading: Icon(Icons.music_note),
              //       title: Text(getplayerrolelist[index].positionName.toString()),
              //       onTap: () {
              //         // Handle the selection
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ),
              // )
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
