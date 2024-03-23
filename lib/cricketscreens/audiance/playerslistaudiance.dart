import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/getx/audiance/tournamentshow.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../helper.dart';
import '../../services/app_url.dart';
import '../admin/player/playerprofileadmin.dart';
import '../getx/usercontroller.dart';
import '../photoscreen.dart';

class PlayersListAudiance extends StatefulWidget {
  final TeamAudiance teamid;
  const PlayersListAudiance({super.key, required this.teamid});

  @override
  State<PlayersListAudiance> createState() => _PlayersListAudianceState();
}

class _PlayersListAudianceState extends State<PlayersListAudiance> {
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    tournamentAudiance.GetPlayerListFromAPI(
        teamid: widget.teamid.id.toString());
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
                      Obx(() => tournamentAudiance.playerbool.isFalse
                          ? Container(
                              height: screenheight(context, dividedby: 1),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))
                          : tournamentAudiance.getplayerlist.isEmpty
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
                                        tournamentAudiance.getplayerlist.length,
                                    itemBuilder: (context, index) => ListTile(
                                      onTap: () {
                                        userController.getplayerinfo(
                                            tournamentAudiance
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
                                                right: 10.0,
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
                                                            "${tournamentAudiance.getplayerlist[index].player?.logo}"),
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
                                                            "${tournamentAudiance.getplayerlist[index].player?.playerName}",
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
                                                    tournamentAudiance
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
                                                        : tournamentAudiance
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
                                                            : tournamentAudiance
                                                                            .getplayerlist[
                                                                                index]
                                                                            .roll ==
                                                                        "Wicketkeeper" &&
                                                                    tournamentAudiance
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
                                                    tournamentAudiance
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                )),
                      Obx(
                        () => tournamentAudiance.getextralist.isEmpty
                            ? SizedBox()
                            : Column(
                                children: [
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
                                  ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount:
                                        tournamentAudiance.getextralist.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        userController.getplayerinfo(
                                            tournamentAudiance
                                                .getextralist[index].player?.id
                                                .toString());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ListTile(
                                          onTap: () {
                                            userController.getplayerinfo(
                                                tournamentAudiance
                                                    .getextralist[index]
                                                    .player
                                                    ?.id
                                                    .toString());
                                          },
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
                                                                "${tournamentAudiance.getextralist[index].player?.logo}"),
                                                        // CircleAvatar(
                                                        //     radius: 25,
                                                        //     backgroundImage:
                                                        //         NetworkImage(URLs
                                                        //                 .image_url_player +
                                                        //             "${tournamentAudiance.getextralist[index].player?.logo}")),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          1.8),
                                                              child: Text(
                                                                "${tournamentAudiance.getextralist[index].player?.playerName}",
                                                                textScaleFactor:
                                                                    1.25,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        tournamentAudiance
                                                                    .getextralist[
                                                                        index]
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
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              )
                                                            : tournamentAudiance
                                                                        .getextralist[
                                                                            index]
                                                                        .roll ==
                                                                    "Vice Captain "
                                                                ? Container(
                                                                    // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                                    height: 28,
                                                                    width: 28,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "VC",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.grey,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : tournamentAudiance
                                                                            .getextralist[
                                                                                index]
                                                                            .roll ==
                                                                        "Wicketkeeper"
                                                                    ? Container(
                                                                        // decoration: BoxDecoration(border: Border.all(width: 1,),shape: BoxShape.circle),
                                                                        height:
                                                                            28,
                                                                        width:
                                                                            28,
                                                                        child:
                                                                            Center(
                                                                                child:
                                                                                    Text(
                                                                          "WK",
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.grey,
                                                                              fontWeight: FontWeight.w500),
                                                                        )))
                                                                    : SizedBox
                                                                        .shrink(),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.0),
                                                          child: Icon(
                                                              size: 22,
                                                              Icons
                                                                  .watch_later_outlined),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
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
          ],
        ),
      ),
    );
  }
}
