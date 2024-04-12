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
import '../../../model/getplayerinfo.dart';
import '../../../services/app_url.dart';
import '../../audiance/matchdetails/cricketdetailscreen.dart';
import '../../audiance/playerslistaudiance.dart';
import '../../getx/usercontroller.dart';
import '../../model/searchplayerresponse.dart';
import '../../model/tournamentdetailresponse.dart';
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
                  Playermatches(),
                  Playerteams(),
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

class Playermatches extends StatefulWidget {
  const Playermatches({super.key});

  @override
  State<Playermatches> createState() => _PlayermatchesState();
}

class _PlayermatchesState extends State<Playermatches> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          //     userController..isFalse
          //     ? Center(
          //   child: CircularProgressIndicator(),
          // )
          //     :
          userController.matches.isEmpty
              ? Center(
                  child: Text('No Data Found...'),
                )
              : Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: decration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                // Text(
                                //   "Recent Match",
                                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                // ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                Container(
                                  // height: 170,
                                  width: double.infinity,
                                  child:
                                      // Obx(
                                      //   () => matchController.matchllist.isEmpty
                                      //       ? SizedBox()
                                      //       :
                                      ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    // scrollDirection: Axis.horizontal,
                                    itemCount: userController.matches.length,
                                    itemBuilder: (context, index) {
                                      Matchinfo match =
                                          userController.matches[index];
                                      return InkWell(
                                        onTap: () =>
                                            Get.to(DetailsScreen(match: match)),
                                        child: Card(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: screenwidth(context,
                                                dividedby: 1.2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.blueGrey
                                                      .withOpacity(0.15)),
                                              color: Colors.transparent,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.15),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Flexible(
                                                        child: Text(
                                                            maxLines: 2,
                                                            match.team1
                                                                    ?.teamName ??
                                                                "",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .blueGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                            textAlign:
                                                                TextAlign.end,
                                                            maxLines: 2,
                                                            match.team2
                                                                    ?.teamName ??
                                                                "",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .blueGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 2,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.4),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            NetworkImage(
                                                                          URLs.image_url_team +
                                                                              "${match.team1?.logo}",
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )),
                                                            ),
                                                            SizedBox(width: 8),
                                                            Text(
                                                              match.team1
                                                                      ?.shortName ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          28),
                                                                  color: Colors
                                                                      .blueGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Text(
                                                                  match
                                                                      .matchdateformat()
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize: screenwidth(
                                                                        context,
                                                                        dividedby:
                                                                            38),
                                                                    color: Colors
                                                                        .red
                                                                        .shade700,
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              height: 2.5,
                                                            ),
                                                            Text(
                                                              match
                                                                  .matchtimeformat(),
                                                              style: TextStyle(
                                                                fontSize:
                                                                    screenwidth(
                                                                        context,
                                                                        dividedby:
                                                                            30),
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 2.5,
                                                            ),
                                                            Text(
                                                                match.matchType ??
                                                                    "",
                                                                style:
                                                                    TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontSize: screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          33),
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Text(
                                                              match.team2
                                                                      ?.shortName ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          28),
                                                                  color: Colors
                                                                      .blueGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(width: 8),
                                                            Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.4),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            NetworkImage(
                                                                          URLs.image_url_team +
                                                                              "${match.team2?.logo}",
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                match.summary == null
                                                    ? SizedBox()
                                                    : Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "${match.team1Runs}/${match.team1TotalWickets} ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blueGrey,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    Text(
                                                                      "( ${match.team1TotalOver} )",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blueGrey,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "${match.team2Runs}/${match.team2TotalWickets} ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blueGrey,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    Text(
                                                                      "( ${match.team2TotalOver} )",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blueGrey,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                Divider(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  thickness: 0.7,
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        flex: 3,
                                                        child: Text(
                                                            match.summary !=
                                                                    null
                                                                ? "${match.summary}"
                                                                : match.toss !=
                                                                        null
                                                                    ? "${match.toss}"
                                                                    : "",
                                                            // "Match Yet to be started on ${match.matchdateformat()}",
                                                            // "ENG needs 1002 runs to win",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenwidth(
                                                                        context,
                                                                        dividedby:
                                                                            35),
                                                                color: Colors
                                                                    .blueGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      Visibility(
                                                        visible: true,
                                                        child: Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: match.matchStatus
                                                                            ?.id ==
                                                                        1
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .yellow),
                                                            child: Text(
                                                                match.matchStatus?.id ==
                                                                        1
                                                                    ? "Live"
                                                                    : "Future",
                                                                // "ENG needs 1002 runs to win",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: match.matchStatus?.id ==
                                                                            1
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // ),
                                ),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     SizedBox(
                            //       height: 5,
                            //     ),
                            //     Text(
                            //       "All Match",
                            //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            //     ),
                            //     Container(
                            //       width: double.infinity,
                            //       child: Obx(
                            //         () => matchController.matchllist.isEmpty
                            //             ? SizedBox()
                            //             : ListView.builder(
                            //                 primary: false,
                            //                 shrinkWrap: true,
                            //                 itemCount: matchController.matchllist.length,
                            //                 itemBuilder: (context, index) {
                            //                   MatchList match = matchController.matchllist[index];
                            //                   return InkWell(
                            //                     onTap: () => Get.to(DetailsScreen()),
                            //                     child: Card(
                            //                       margin: EdgeInsets.symmetric(
                            //                           horizontal: 8, vertical: 8),
                            //                       shape: RoundedRectangleBorder(
                            //                         borderRadius: BorderRadius.circular(10),
                            //                       ),
                            //                       child: Container(
                            //                         width: screenwidth(context, dividedby: 1.2),
                            //                         decoration: BoxDecoration(
                            //                           borderRadius: BorderRadius.circular(10),
                            //                           border: Border.all(
                            //                               color: Colors.blueGrey.withOpacity(0.15)),
                            //                           color: Colors.transparent,
                            //                         ),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: <Widget>[
                            //                             Container(
                            //                               padding: EdgeInsets.symmetric(
                            //                                   horizontal: 10, vertical: 8),
                            //                               decoration: BoxDecoration(
                            //                                   color: Colors.grey.withOpacity(0.15),
                            //                                   borderRadius: BorderRadius.only(
                            //                                       topRight: Radius.circular(10),
                            //                                       topLeft: Radius.circular(10))),
                            //                               child: Row(
                            //                                 mainAxisAlignment:
                            //                                     MainAxisAlignment.spaceBetween,
                            //                                 crossAxisAlignment:
                            //                                     CrossAxisAlignment.center,
                            //                                 children: [
                            //                                   Text("Tournament Name",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                   Text(
                            //                                       match.tournament
                            //                                               ?.tournamentName ??
                            //                                           "",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                             SizedBox(height: 8),
                            //                             Row(
                            //                               mainAxisAlignment:
                            //                                   MainAxisAlignment.spaceBetween,
                            //                               children: <Widget>[
                            //                                 Row(
                            //                                   children: <Widget>[
                            //                                     Stack(
                            //                                       children: [
                            //                                         Stack(
                            //                                           children: [
                            //                                             Container(
                            //                                               width: 50,
                            //                                               height: 50,
                            //                                               decoration: BoxDecoration(
                            //                                                 shape: BoxShape.circle,
                            //                                               ),
                            //                                               child: ClipOval(
                            //                                                 clipBehavior:
                            //                                                     Clip.antiAlias,
                            //                                                 child: Align(
                            //                                                   alignment: Alignment
                            //                                                       .centerLeft,
                            //                                                   child:
                            //                                                       FractionalTranslation(
                            //                                                     translation:
                            //                                                         Offset(-0.2, 0),
                            //                                                     child: Image.asset(
                            //                                                       "images/textilediary-applogo.png",
                            //                                                       fit: BoxFit.cover,
                            //                                                     ),
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                             Positioned.fill(
                            //                                               child: Container(
                            //                                                 decoration:
                            //                                                     BoxDecoration(
                            //                                                   shape:
                            //                                                       BoxShape.circle,
                            //                                                   gradient:
                            //                                                       RadialGradient(
                            //                                                     colors: [
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.9),
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.5),
                            //                                                     ],
                            //                                                     radius: 1.0,
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                           ],
                            //                                         ),
                            //                                         Positioned(
                            //                                           right: -18,
                            //                                           top: 8.5,
                            //                                           bottom: 8.5,
                            //                                           child: Container(
                            //                                             width: 70,
                            //                                             height: 70,
                            //                                             decoration: BoxDecoration(
                            //                                                 color: Colors.grey
                            //                                                     .withOpacity(0.4),
                            //                                                 shape: BoxShape.circle,
                            //                                                 image: DecorationImage(
                            //                                                   image: AssetImage(
                            //                                                       "images/textilediary-applogo.png"),
                            //                                                   fit: BoxFit.contain,
                            //                                                 )),
                            //                                           ),
                            //                                         ),
                            //                                       ],
                            //                                     ),
                            //                                     SizedBox(width: 8),
                            //                                     Text(
                            //                                       "SUR",
                            //                                       style: TextStyle(
                            //                                           fontSize: 16,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold),
                            //                                     ),
                            //                                   ],
                            //                                 ),
                            //                                 Column(
                            //                                   mainAxisAlignment:
                            //                                       MainAxisAlignment.center,
                            //                                   crossAxisAlignment:
                            //                                       CrossAxisAlignment.center,
                            //                                   children: [
                            //                                     Container(
                            //                                       padding: EdgeInsets.all(2),
                            //                                       decoration: BoxDecoration(
                            //                                         color:
                            //                                             Colors.red.withOpacity(0.1),
                            //                                         borderRadius:
                            //                                             BorderRadius.circular(5),
                            //                                       ),
                            //                                       child: Text("24-04-24",
                            //                                           style: TextStyle(
                            //                                             fontSize: 11,
                            //                                             color: Colors.red.shade700,
                            //                                           )),
                            //                                     ),
                            //                                     SizedBox(
                            //                                       height: 2.5,
                            //                                     ),
                            //                                     Text("10:00 AM",
                            //                                         style: TextStyle(
                            //                                           fontSize: 9,
                            //                                           color: Colors.grey.shade700,
                            //                                         )),
                            //                                     SizedBox(
                            //                                       height: 2.5,
                            //                                     ),
                            //                                     Text("Surat, Gujarat",
                            //                                         style: TextStyle(
                            //                                           fontSize: 9,
                            //                                           color: Colors.grey.shade700,
                            //                                         )),
                            //                                   ],
                            //                                 ),
                            //                                 Row(
                            //                                   children: <Widget>[
                            //                                     Text(
                            //                                       "AHM",
                            //                                       style: TextStyle(
                            //                                           fontSize: 16,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold),
                            //                                     ),
                            //                                     SizedBox(width: 8),
                            //                                     Stack(
                            //                                       children: [
                            //                                         Stack(
                            //                                           children: [
                            //                                             Container(
                            //                                               width: 50,
                            //                                               height: 50,
                            //                                               decoration: BoxDecoration(
                            //                                                 shape: BoxShape.circle,
                            //                                               ),
                            //                                               child: ClipOval(
                            //                                                 clipBehavior:
                            //                                                     Clip.antiAlias,
                            //                                                 child: Align(
                            //                                                   alignment: Alignment
                            //                                                       .centerRight,
                            //                                                   child:
                            //                                                       FractionalTranslation(
                            //                                                     translation:
                            //                                                         Offset(0.2, 0),
                            //                                                     child: Image.asset(
                            //                                                       "images/textilediary-applogo.png",
                            //                                                       fit: BoxFit.cover,
                            //                                                     ),
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                             Positioned.fill(
                            //                                               child: Container(
                            //                                                 decoration:
                            //                                                     BoxDecoration(
                            //                                                   shape:
                            //                                                       BoxShape.circle,
                            //                                                   gradient:
                            //                                                       RadialGradient(
                            //                                                     colors: [
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.9),
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.5),
                            //                                                     ],
                            //                                                     radius: 1.0,
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                           ],
                            //                                         ),
                            //                                         Positioned(
                            //                                           left: -18,
                            //                                           top: 8.5,
                            //                                           bottom: 8.5,
                            //                                           child: Container(
                            //                                             width: 70,
                            //                                             height: 70,
                            //                                             decoration: BoxDecoration(
                            //                                                 color: Colors.grey
                            //                                                     .withOpacity(0.4),
                            //                                                 shape: BoxShape.circle,
                            //                                                 image: DecorationImage(
                            //                                                   image: AssetImage(
                            //                                                       "images/textilediary-applogo.png"),
                            //                                                   fit: BoxFit.contain,
                            //                                                 )),
                            //                                           ),
                            //                                         ),
                            //                                       ],
                            //                                     ),
                            //                                   ],
                            //                                 ),
                            //                               ],
                            //                             ),
                            //                             SizedBox(height: 8),
                            //                             Padding(
                            //                               padding: const EdgeInsets.symmetric(
                            //                                   horizontal: 10),
                            //                               child: Row(
                            //                                 mainAxisAlignment:
                            //                                     MainAxisAlignment.spaceBetween,
                            //                                 children: <Widget>[
                            //                                   Text(match.team1?.teamName ?? "",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                   Text(match.team2?.teamName ?? "",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                             SizedBox(height: 16),
                            //                             Divider(
                            //                               color: Colors.grey.withOpacity(0.5),
                            //                               thickness: 0.7,
                            //                               height: 0,
                            //                             ),
                            //                             Padding(
                            //                               padding: const EdgeInsets.symmetric(
                            //                                   horizontal: 10, vertical: 3),
                            //                               child: Row(
                            //                                 mainAxisAlignment:
                            //                                     MainAxisAlignment.spaceBetween,
                            //                                 crossAxisAlignment:
                            //                                     CrossAxisAlignment.center,
                            //                                 children: [
                            //                                   Text("ENG needs 1002 runs to win",
                            //                                       style: TextStyle(
                            //                                           fontSize: 10,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   );
                            //                 },
                            //               ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ]),
                    ),
                  ),
                ),
    );
  }
}

class Playerteams extends StatefulWidget {
  const Playerteams({super.key});

  @override
  State<Playerteams> createState() => _PlayerteamsState();
}

class _PlayerteamsState extends State<Playerteams> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          //     userController..isFalse
          //     ? Center(
          //   child: CircularProgressIndicator(),
          // )
          //     :
          userController.teams.isEmpty
              ? Center(
                  child: Text('No Data Found...'),
                )
              : Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: decration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                // Text(
                                //   "Recent Match",
                                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                // ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                Container(
                                  // height: 170,
                                  width: double.infinity,
                                  child:
                                      // Obx(
                                      //   () => matchController.matchllist.isEmpty
                                      //       ? SizedBox()
                                      //       :
                                      ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    // scrollDirection: Axis.horizontal,
                                    itemCount: userController.teams.length,
                                    itemBuilder: (context, index) {
                                      Teamdetails team =
                                          userController.teams[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0, top: 15),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 0, top: 00),
                                          child: Card(
                                            margin: EdgeInsets.zero,
                                            child: ListTile(
                                              contentPadding: EdgeInsets.all(8),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              onTap: () {
                                                // Get.to(PlayersListAudiance(
                                                //     teamid: team));
                                              },
                                              // minVerticalPadding: 20,
                                              leading: PhotoScreencric(
                                                image: URLs.image_url_team +
                                                    "${team.logo}",
                                              ),
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      team.teamName ??
                                                          "Channai Super King",
                                                      textScaleFactor: 1.15,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      )),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(team.shortName ?? "CSK",
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          color: Colors.grey))
                                                ],
                                              ),
                                              // trailing: Icon(
                                              //     Icons.arrow_forward_ios_rounded,size: 15,)
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // ),
                                ),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     SizedBox(
                            //       height: 5,
                            //     ),
                            //     Text(
                            //       "All Match",
                            //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            //     ),
                            //     Container(
                            //       width: double.infinity,
                            //       child: Obx(
                            //         () => matchController.matchllist.isEmpty
                            //             ? SizedBox()
                            //             : ListView.builder(
                            //                 primary: false,
                            //                 shrinkWrap: true,
                            //                 itemCount: matchController.matchllist.length,
                            //                 itemBuilder: (context, index) {
                            //                   MatchList match = matchController.matchllist[index];
                            //                   return InkWell(
                            //                     onTap: () => Get.to(DetailsScreen()),
                            //                     child: Card(
                            //                       margin: EdgeInsets.symmetric(
                            //                           horizontal: 8, vertical: 8),
                            //                       shape: RoundedRectangleBorder(
                            //                         borderRadius: BorderRadius.circular(10),
                            //                       ),
                            //                       child: Container(
                            //                         width: screenwidth(context, dividedby: 1.2),
                            //                         decoration: BoxDecoration(
                            //                           borderRadius: BorderRadius.circular(10),
                            //                           border: Border.all(
                            //                               color: Colors.blueGrey.withOpacity(0.15)),
                            //                           color: Colors.transparent,
                            //                         ),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: <Widget>[
                            //                             Container(
                            //                               padding: EdgeInsets.symmetric(
                            //                                   horizontal: 10, vertical: 8),
                            //                               decoration: BoxDecoration(
                            //                                   color: Colors.grey.withOpacity(0.15),
                            //                                   borderRadius: BorderRadius.only(
                            //                                       topRight: Radius.circular(10),
                            //                                       topLeft: Radius.circular(10))),
                            //                               child: Row(
                            //                                 mainAxisAlignment:
                            //                                     MainAxisAlignment.spaceBetween,
                            //                                 crossAxisAlignment:
                            //                                     CrossAxisAlignment.center,
                            //                                 children: [
                            //                                   Text("Tournament Name",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                   Text(
                            //                                       match.tournament
                            //                                               ?.tournamentName ??
                            //                                           "",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                             SizedBox(height: 8),
                            //                             Row(
                            //                               mainAxisAlignment:
                            //                                   MainAxisAlignment.spaceBetween,
                            //                               children: <Widget>[
                            //                                 Row(
                            //                                   children: <Widget>[
                            //                                     Stack(
                            //                                       children: [
                            //                                         Stack(
                            //                                           children: [
                            //                                             Container(
                            //                                               width: 50,
                            //                                               height: 50,
                            //                                               decoration: BoxDecoration(
                            //                                                 shape: BoxShape.circle,
                            //                                               ),
                            //                                               child: ClipOval(
                            //                                                 clipBehavior:
                            //                                                     Clip.antiAlias,
                            //                                                 child: Align(
                            //                                                   alignment: Alignment
                            //                                                       .centerLeft,
                            //                                                   child:
                            //                                                       FractionalTranslation(
                            //                                                     translation:
                            //                                                         Offset(-0.2, 0),
                            //                                                     child: Image.asset(
                            //                                                       "images/textilediary-applogo.png",
                            //                                                       fit: BoxFit.cover,
                            //                                                     ),
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                             Positioned.fill(
                            //                                               child: Container(
                            //                                                 decoration:
                            //                                                     BoxDecoration(
                            //                                                   shape:
                            //                                                       BoxShape.circle,
                            //                                                   gradient:
                            //                                                       RadialGradient(
                            //                                                     colors: [
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.9),
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.5),
                            //                                                     ],
                            //                                                     radius: 1.0,
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                           ],
                            //                                         ),
                            //                                         Positioned(
                            //                                           right: -18,
                            //                                           top: 8.5,
                            //                                           bottom: 8.5,
                            //                                           child: Container(
                            //                                             width: 70,
                            //                                             height: 70,
                            //                                             decoration: BoxDecoration(
                            //                                                 color: Colors.grey
                            //                                                     .withOpacity(0.4),
                            //                                                 shape: BoxShape.circle,
                            //                                                 image: DecorationImage(
                            //                                                   image: AssetImage(
                            //                                                       "images/textilediary-applogo.png"),
                            //                                                   fit: BoxFit.contain,
                            //                                                 )),
                            //                                           ),
                            //                                         ),
                            //                                       ],
                            //                                     ),
                            //                                     SizedBox(width: 8),
                            //                                     Text(
                            //                                       "SUR",
                            //                                       style: TextStyle(
                            //                                           fontSize: 16,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold),
                            //                                     ),
                            //                                   ],
                            //                                 ),
                            //                                 Column(
                            //                                   mainAxisAlignment:
                            //                                       MainAxisAlignment.center,
                            //                                   crossAxisAlignment:
                            //                                       CrossAxisAlignment.center,
                            //                                   children: [
                            //                                     Container(
                            //                                       padding: EdgeInsets.all(2),
                            //                                       decoration: BoxDecoration(
                            //                                         color:
                            //                                             Colors.red.withOpacity(0.1),
                            //                                         borderRadius:
                            //                                             BorderRadius.circular(5),
                            //                                       ),
                            //                                       child: Text("24-04-24",
                            //                                           style: TextStyle(
                            //                                             fontSize: 11,
                            //                                             color: Colors.red.shade700,
                            //                                           )),
                            //                                     ),
                            //                                     SizedBox(
                            //                                       height: 2.5,
                            //                                     ),
                            //                                     Text("10:00 AM",
                            //                                         style: TextStyle(
                            //                                           fontSize: 9,
                            //                                           color: Colors.grey.shade700,
                            //                                         )),
                            //                                     SizedBox(
                            //                                       height: 2.5,
                            //                                     ),
                            //                                     Text("Surat, Gujarat",
                            //                                         style: TextStyle(
                            //                                           fontSize: 9,
                            //                                           color: Colors.grey.shade700,
                            //                                         )),
                            //                                   ],
                            //                                 ),
                            //                                 Row(
                            //                                   children: <Widget>[
                            //                                     Text(
                            //                                       "AHM",
                            //                                       style: TextStyle(
                            //                                           fontSize: 16,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold),
                            //                                     ),
                            //                                     SizedBox(width: 8),
                            //                                     Stack(
                            //                                       children: [
                            //                                         Stack(
                            //                                           children: [
                            //                                             Container(
                            //                                               width: 50,
                            //                                               height: 50,
                            //                                               decoration: BoxDecoration(
                            //                                                 shape: BoxShape.circle,
                            //                                               ),
                            //                                               child: ClipOval(
                            //                                                 clipBehavior:
                            //                                                     Clip.antiAlias,
                            //                                                 child: Align(
                            //                                                   alignment: Alignment
                            //                                                       .centerRight,
                            //                                                   child:
                            //                                                       FractionalTranslation(
                            //                                                     translation:
                            //                                                         Offset(0.2, 0),
                            //                                                     child: Image.asset(
                            //                                                       "images/textilediary-applogo.png",
                            //                                                       fit: BoxFit.cover,
                            //                                                     ),
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                             Positioned.fill(
                            //                                               child: Container(
                            //                                                 decoration:
                            //                                                     BoxDecoration(
                            //                                                   shape:
                            //                                                       BoxShape.circle,
                            //                                                   gradient:
                            //                                                       RadialGradient(
                            //                                                     colors: [
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.9),
                            //                                                       Colors.white
                            //                                                           .withOpacity(
                            //                                                               0.5),
                            //                                                     ],
                            //                                                     radius: 1.0,
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                           ],
                            //                                         ),
                            //                                         Positioned(
                            //                                           left: -18,
                            //                                           top: 8.5,
                            //                                           bottom: 8.5,
                            //                                           child: Container(
                            //                                             width: 70,
                            //                                             height: 70,
                            //                                             decoration: BoxDecoration(
                            //                                                 color: Colors.grey
                            //                                                     .withOpacity(0.4),
                            //                                                 shape: BoxShape.circle,
                            //                                                 image: DecorationImage(
                            //                                                   image: AssetImage(
                            //                                                       "images/textilediary-applogo.png"),
                            //                                                   fit: BoxFit.contain,
                            //                                                 )),
                            //                                           ),
                            //                                         ),
                            //                                       ],
                            //                                     ),
                            //                                   ],
                            //                                 ),
                            //                               ],
                            //                             ),
                            //                             SizedBox(height: 8),
                            //                             Padding(
                            //                               padding: const EdgeInsets.symmetric(
                            //                                   horizontal: 10),
                            //                               child: Row(
                            //                                 mainAxisAlignment:
                            //                                     MainAxisAlignment.spaceBetween,
                            //                                 children: <Widget>[
                            //                                   Text(match.team1?.teamName ?? "",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                   Text(match.team2?.teamName ?? "",
                            //                                       style: TextStyle(
                            //                                           fontSize: 12,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                             SizedBox(height: 16),
                            //                             Divider(
                            //                               color: Colors.grey.withOpacity(0.5),
                            //                               thickness: 0.7,
                            //                               height: 0,
                            //                             ),
                            //                             Padding(
                            //                               padding: const EdgeInsets.symmetric(
                            //                                   horizontal: 10, vertical: 3),
                            //                               child: Row(
                            //                                 mainAxisAlignment:
                            //                                     MainAxisAlignment.spaceBetween,
                            //                                 crossAxisAlignment:
                            //                                     CrossAxisAlignment.center,
                            //                                 children: [
                            //                                   Text("ENG needs 1002 runs to win",
                            //                                       style: TextStyle(
                            //                                           fontSize: 10,
                            //                                           color: Colors.blueGrey,
                            //                                           fontWeight: FontWeight.bold)),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   );
                            //                 },
                            //               ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ]),
                    ),
                  ),
                ),
    );
  }
}
