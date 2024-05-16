import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:screenshot/screenshot.dart';
import 'package:yarn_modified/cricketscreens/admin/match/startmatch/tossscreen.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';
import 'package:yarn_modified/cricketscreens/getx/screenshotcontroller.dart';
import 'package:yarn_modified/cricketscreens/getx/startmatchcontroller.dart';
import 'package:yarn_modified/cricketscreens/model/matchlivedetailsresponse.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';
import 'package:yarn_modified/cricketscreens/photoscreen.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../helper.dart';
import '../../../services/all_api_services.dart';
import '../../../services/app_url.dart';
import '../../../widgets/tournamenttextfield.dart';
import 'admin/match/startmatch/openingplayers.dart';
import 'admin/match/startmatch/runinputscreen.dart';
import 'audiance/matchdetails/scoreboardscreen.dart';

class SuperOverInfoScreen extends StatefulWidget {
  final int isadmin;
  final Matchinfo? match;
  final int superover;
  const SuperOverInfoScreen(
      {super.key, this.isadmin = 0, this.match, required this.superover});

  @override
  State<SuperOverInfoScreen> createState() => _SuperOverInfoScreenState();
}

class _SuperOverInfoScreenState extends State<SuperOverInfoScreen>
    with SingleTickerProviderStateMixin {
  StartMatchController startmatch = Get.put(StartMatchController());
  MatchController matchController = Get.put(MatchController());

  String playerofthematchid = "";
  playerofthematchSheet() async {
    startmatch.AllPlayersListFromAPI(
        teamid1: startmatch.matchlive.value.team1?.id.toString() ?? "",
        teamid2: startmatch.matchlive.value.team2?.id.toString() ?? "");
    playerofthematchid = "";
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: screenwidth(context, dividedby: 1.2),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: startmatch.Allplayerlist.map((e) =>
                                  DropdownMenuItem<String>(
                                      value: "${e.playerId}",
                                      child: Text("${e.player?.playerName}")))
                              .toList(),
                          onchange: (p0) {
                            playerofthematchid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select player of the match";
                            }
                            return null;
                          },
                          lable: "Select player of the match",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                              height: 40,
                              child: MaterialButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Center(
                                    child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                              height: 40,
                              child: MaterialButton(
                                onPressed: () {
                                  bool valid =
                                      playerofthematchid == "" ? false : true;
                                  if (!valid) {
                                    FlutterToast.showCustomToast(
                                        "Please Select player of the match");
                                  } else {
                                    startmatch.playerofthematchapi(
                                        touramentid: startmatch
                                            .matchlive.value.tournamentId
                                            .toString(),
                                        matchid: startmatch.matchlive.value.id
                                            .toString(),
                                        playerofthematch: playerofthematchid);
                                    Get.back();
                                  }
                                },
                                child: const Center(
                                    child: Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _refresh() async {
    startmatch.superoversis.value = "${widget.superover}";
    startmatch.matchInfoDetailFromAPI(
        tournamentid: widget.match?.tournamentId.toString() ?? "",
        matchid: widget.match?.id.toString() ?? "");
    startmatch.Overswiserun(
        matchid: widget.match?.id.toString() ?? "",
        touramentid: widget.match?.tournament?.id.toString() ?? "");
  }

  late TabController _tabController;

  TextStyle defaultstyle = TextStyle(
      color: darkBlue,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis);
  TextStyle defaultstyle2 = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis);

  @override
  void initState() {
    _tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: (widget.match?.inningId ?? 0) > 3 ? 1 : 0);
    _refresh();
    // matchController.FetchSuperOverMatchFromAPI(tournamentId: widget.match?.tournamentId.toString() ?? "", matchid: widget.match?.id.toString() ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        startmatch.superoversis.value = "";
        context.loaderOverlay.show();
        await startmatch.matchInfoDetailFromAPI(
            tournamentid: widget.match?.tournamentId.toString() ?? "",
            matchid: startmatch.matchlive.value.parentid.toString() ?? "");

        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.match?.team1?.shortName} vs ${widget.match?.team2?.shortName}',
                textScaleFactor: 1,
                style: TextStyle(
                    letterSpacing: 0.5, color: MyTheme.appBarTextColor),
              ),
              startmatch.superoversis == ""
                  ? SizedBox()
                  : Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Super over ${startmatch.superoversis}",
                          style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.5,
                              color: MyTheme.appBarTextColor),
                        ),
                      ],
                    ),
            ],
          ),

          actions: [],
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
            Visibility(
              visible: (widget.match?.inningId ?? 0) > 3 ? false : true,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                color: Cricket_SkyBlue_Color,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TabBar(
                    controller: _tabController,
                    dividerColor: kthemecolor,
                    indicatorColor: kthemecolor,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: kthemecolor),
                    labelColor: kwhite,
                    unselectedLabelColor: kthemecolor,
                    onTap: (value) {
                      // setState(() {
                      //   tabindex = value;
                      // });
                      // print(tabindex);
                    },
                    labelStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    tabs: [
                      Tab(text: 'Info'),
                      Tab(text: "Scorecard"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                color: MyTheme.scaffoldColor,
                height: double.maxFinite,
                width: double.maxFinite,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: _refresh,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Obx(
                                    () => Column(
                                      children: [
                                        SizedBox(height: 5),
                                        Column(
                                          children: [
                                            Container(
                                              // height: 200,
                                              width: double.infinity,
                                              child: Card(
                                                elevation: 4,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 15),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        // mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              PhotoScreencric(
                                                                  dobbn: 18,
                                                                  image: URLs
                                                                          .image_url_team +
                                                                      "${widget.match?.team1?.logo}"),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                widget
                                                                        .match
                                                                        ?.team1
                                                                        ?.shortName ??
                                                                    "",
                                                                style: TextStyle(
                                                                    color: startmatch.matchlive.value.summary != null
                                                                        ? startmatch.matchlive.value.wonteamid == startmatch.matchlive.value.team1?.id
                                                                            ? Colors.black
                                                                            : Colors.grey
                                                                        : startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id
                                                                            ? Colors.black
                                                                            : Colors.grey,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w400),
                                                              ),
                                                            ],
                                                          ),
                                                          startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .team1TotalOver ==
                                                                  null
                                                              ? Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              : Row(
                                                                  children: [
                                                                    Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      "${startmatch.matchlive.value.team1Runs}-${startmatch.matchlive.value.team1TotalWickets}",
                                                                      style: TextStyle(
                                                                          color: startmatch.matchlive.value.summary != null
                                                                              ? startmatch.matchlive.value.wonteamid == startmatch.matchlive.value.team1?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey
                                                                              : startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey,
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      " (${startmatch.matchlive.value.team1TotalOver})",
                                                                      style: TextStyle(
                                                                          color: startmatch.matchlive.value.summary != null
                                                                              ? startmatch.matchlive.value.wonteamid == startmatch.matchlive.value.team1?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey
                                                                              : startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey,
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.w500),
                                                                    ).paddingOnly(
                                                                        right:
                                                                            20),
                                                                  ],
                                                                )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        // mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              PhotoScreencric(
                                                                  dobbn: 18,
                                                                  image: URLs
                                                                          .image_url_team +
                                                                      "${widget.match?.team2?.logo}"),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                widget
                                                                        .match
                                                                        ?.team2
                                                                        ?.shortName ??
                                                                    "",
                                                                style: TextStyle(
                                                                    color: startmatch.matchlive.value.summary != null
                                                                        ? startmatch.matchlive.value.wonteamid == startmatch.matchlive.value.team2?.id
                                                                            ? Colors.black
                                                                            : Colors.grey
                                                                        : startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team2?.id
                                                                            ? Colors.black
                                                                            : Colors.grey,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w400),
                                                              ),
                                                            ],
                                                          ),
                                                          startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .team2TotalOver ==
                                                                  null
                                                              ? Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              : Row(
                                                                  children: [
                                                                    Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      "${startmatch.matchlive.value.team2Runs}-${startmatch.matchlive.value.team2TotalWickets}",
                                                                      style: TextStyle(
                                                                          color: startmatch.matchlive.value.summary != null
                                                                              ? startmatch.matchlive.value.wonteamid == startmatch.matchlive.value.team2?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey
                                                                              : startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team2?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey,
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      " (${startmatch.matchlive.value.team2TotalOver})",
                                                                      style: TextStyle(
                                                                          color: startmatch.matchlive.value.summary != null
                                                                              ? startmatch.matchlive.value.wonteamid == startmatch.matchlive.value.team2?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey
                                                                              : startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team2?.id
                                                                                  ? Colors.black
                                                                                  : Colors.grey,
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.w500),
                                                                    ).paddingOnly(
                                                                        right:
                                                                            20),
                                                                  ],
                                                                )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      startmatch.matchlive.value
                                                                  .summary ==
                                                              null
                                                          ? Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      "CRR   ${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1Crr ?? "0.00" : startmatch.matchlive.value.team2Crr ?? "0.00"}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    startmatch.matchlive.value.inningId ==
                                                                            2
                                                                        ? Text(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            "REQ  ${startmatch.requirerunrate}",
                                                                            style: TextStyle(
                                                                                color: Colors.grey.shade700,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w400),
                                                                          )
                                                                        : SizedBox(),
                                                                    startmatch.matchlive.value.inningId ==
                                                                            2
                                                                        ? Text(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            "Target :  ${startmatch.target}",
                                                                            style: TextStyle(
                                                                                color: Colors.grey.shade900,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500),
                                                                          )
                                                                        : SizedBox(),
                                                                  ],
                                                                ),
                                                                startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .inningId ==
                                                                        2
                                                                    ? Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            "${startmatch.requirestatus}",
                                                                            style: TextStyle(
                                                                                color: Colors.grey.shade700,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            )
                                                          : Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      startmatch
                                                                          .matchlive
                                                                          .value
                                                                          .summary
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color:
                                                                              Cricket_textColorSecondary,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            (startmatch.matchlive.value
                                                            .inningId ??
                                                        0) >
                                                    3
                                                ? SizedBox()
                                                : Column(
                                                    children: [
                                                      startmatch
                                                                  .matchlive
                                                                  .value
                                                                  .playerstrick
                                                                  ?.id ==
                                                              null
                                                          ? SizedBox.shrink()
                                                          : Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0,
                                                                  vertical: 10),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Card(
                                                                    elevation:
                                                                        4,
                                                                    // margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),

                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.grey.shade200,
                                                                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                                                                          padding:
                                                                              const EdgeInsets.all(8),
                                                                          child:
                                                                              Row(
                                                                            children: <Widget>[
                                                                              Expanded(flex: 7, child: Text("Batter(${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})", style: textbar)),
                                                                              Expanded(child: Text("R", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(child: Text("B", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(child: Text("4s", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(child: Text("6s", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(flex: 2, child: Text("SR", textAlign: TextAlign.center, style: textbar)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                                                                },
                                                                                child: Container(
                                                                                    padding: const EdgeInsets.only(left: 0),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: <Widget>[
                                                                                        SizedBox(
                                                                                          height: 8,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(right: 8, left: 8, top: 5),
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              Expanded(flex: 7, child: Text("${startmatch.matchlive.value.playerstrick?.playerName}  🏏", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.run.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.balls.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.fours.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.sixers.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                              Expanded(flex: 2, child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.strikeRate.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        const Divider(
                                                                                          thickness: 0.8,
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                                                                },
                                                                                child: Container(
                                                                                    padding: const EdgeInsets.only(left: 0),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: <Widget>[
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(right: 8, left: 8, top: 5),
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              Expanded(flex: 7, child: Text(startmatch.matchlive.value.playerNonStricker?.playerName.toString() ?? "", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.run.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.balls.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.fours.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12)).paddingOnly(left: 4)),
                                                                                              Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.sixers.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12)).paddingOnly(left: 4)),
                                                                                              Expanded(flex: 2, child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.strikeRate.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        const Divider(
                                                                                          thickness: 0.8,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                                                          child: Text("Partnership   ${startmatch.partnershiprun} (${startmatch.partnershipball})", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400)),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 5,
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                              ),
                                                                            ]),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                      startmatch
                                                                  .matchlive
                                                                  .value
                                                                  .playerBowler
                                                                  ?.id ==
                                                              null
                                                          ? SizedBox.shrink()
                                                          : Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 0,
                                                                ),
                                                                Container(
                                                                  // height: 200,
                                                                  width: double
                                                                      .infinity,
                                                                  child: Card(
                                                                    elevation:
                                                                        4,
                                                                    margin: EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            15,
                                                                        bottom:
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.grey.shade200,
                                                                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                                                                          padding:
                                                                              const EdgeInsets.all(8),
                                                                          child:
                                                                              Row(
                                                                            children: <Widget>[
                                                                              Expanded(flex: 7, child: Text("Bowler(${startmatch.matchlive.value.bowlingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})", style: textbar)),
                                                                              Expanded(child: Text("O", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(child: Text("M", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(child: Text("R", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(child: Text("W", textAlign: TextAlign.center, style: textbar)),
                                                                              Expanded(flex: 2, child: Text("ER", textAlign: TextAlign.center, style: textbar)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                                                          },
                                                                          child: Container(
                                                                              padding: const EdgeInsets.only(left: 0),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: <Widget>[
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(right: 8, left: 8, top: 5),
                                                                                    child: Row(
                                                                                      children: <Widget>[
                                                                                        Expanded(flex: 7, child: Text(startmatch.matchlive.value.playerBowler?.playerName ?? "", style: TextStyle(color: Colors.grey.shade700, fontSize: 12))),
                                                                                        Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.overs.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                        Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.maidenOver.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                        Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.runs.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                        Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.wickets.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                                        Expanded(flex: 2, child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.economyRate.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  // Padding(
                                                                                  //     padding: EdgeInsets.only(
                                                                                  //         right: 10,
                                                                                  //         left: 10,
                                                                                  //         top: 5,
                                                                                  //         bottom: 5),
                                                                                  //     child: Text("not out (Head)",
                                                                                  //             style: TextStyle(
                                                                                  //                 color: Colors.black,
                                                                                  //                 fontSize: 12))
                                                                                  //         .paddingOnly(
                                                                                  //             top: 4, bottom: 4)),
                                                                                ],
                                                                              )),
                                                                        ),
                                                                        Divider(),
                                                                        Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 12,
                                                                              vertical: 0),
                                                                          width: screenwidth(
                                                                              context,
                                                                              dividedby: 1),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Wrap(
                                                                                  runSpacing: 10,
                                                                                  spacing: 10,
                                                                                  children: List.generate(startmatch.balls.length, (index) {
                                                                                    Ball ball = startmatch.balls[index];
                                                                                    return Container(
                                                                                      width: screenwidth(context, dividedby: 13),
                                                                                      height: screenwidth(context, dividedby: 13),
                                                                                      // padding: EdgeInsets.all(10),
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                        color: ball.outType == null
                                                                                            ? ball.ballType == "normal"
                                                                                                ? ball.run == 6
                                                                                                    ? Colors.green
                                                                                                    : ball.run == 4
                                                                                                        ? Colors.blue
                                                                                                        : Colors.black45
                                                                                                : Colors.orange
                                                                                            : Colors.red,
                                                                                      ),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          ball.balltag ?? "",
                                                                                          style: TextStyle(fontSize: ball.balltag?.length == 1 ? screenwidth(context, dividedby: 30) : screenwidth(context, dividedby: 35), color: Colors.white, fontWeight: FontWeight.w500),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  "= ${startmatch.overrun}",
                                                                                  style: TextStyle(color: Colors.black54),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                    ],
                                                  ),
                                            startmatch.matchlive.value
                                                        .playerofthematch?.id ==
                                                    null
                                                ? startmatch.matchlive.value
                                                            .inningId ==
                                                        4
                                                    ? widget.isadmin == 1
                                                        ? Card(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    right: 15,
                                                                    top: 15),
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  playerofthematchSheet();
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                        "Declare Player of the match",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 14)),
                                                                  ],
                                                                )))
                                                        : SizedBox()
                                                    : SizedBox()
                                                : Container(
                                                    // height: 200,
                                                    width: double.infinity,

                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 15),
                                                        Card(
                                                          elevation: 4,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      15),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15,
                                                                        vertical:
                                                                            8),
                                                                width:
                                                                    screenwidth(
                                                                        context,
                                                                        dividedby:
                                                                            1),
                                                                // height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade200,
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        topLeft:
                                                                            Radius.circular(10))),
                                                                child: Text(
                                                                  "Player of the match",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        kwhite,
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        bottomLeft:
                                                                            Radius.circular(10))),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 10.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            PhotoScreencric(
                                                                                dobbn: 30,
                                                                                image: URLs.image_url_player + "${startmatch.matchlive.value.playerofthematch?.logo}"),
                                                                            SizedBox(width: 20),
                                                                            Container(
                                                                              width: screenwidth(context, dividedby: 2.45),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    "${startmatch.matchlive.value.playerofthematch?.playerName}",
                                                                                    style: TextStyle(color: kblack, fontWeight: FontWeight.w500, fontSize: 15),
                                                                                  ),
                                                                                  SizedBox(height: 8),
                                                                                  Text(
                                                                                    "${startmatch.matchlive.value.playerOfTheMatchTeam ?? "CSK"}",
                                                                                    style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500, fontSize: 14),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Image.asset(
                                                                        height: screenwidth(
                                                                            context,
                                                                            dividedby:
                                                                                4),
                                                                        width: screenwidth(
                                                                            context,
                                                                            dividedby:
                                                                                4),
                                                                        "images/Rank Section - One time.gif")
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: widget.isadmin == 1
                                  ? (startmatch.matchlive.value.inningId ?? 0) >
                                          3
                                      ? false
                                      : true
                                  : false,
                              // widget.isadmin == 1
                              //     ? startmatch.matchlive.value.summary == null
                              //         ? true
                              //         : false
                              //     : false,
                              child: InkWell(
                                onTap: () {
                                  if (startmatch.matchlive.value.stickerScore
                                          ?.playerId ==
                                      null) {
                                    if (startmatch.matchlive.value.toss ==
                                        null) {
                                      Get.to(TossScreen(match: widget.match!));
                                    } else if ((startmatch
                                                .matchlive.value.inningId ??
                                            0) >
                                        2) {
                                      startmatch.matchlive.value.inningId == 3
                                          ? startmatch.Endmatch.value = true
                                          : startmatch.Endmatch.value = false;
                                      Get.to(RunInputScreen(
                                        match: startmatch.matchlive.value,
                                      ));
                                    } else {
                                      Get.to(OpeningPlayers(
                                        match: startmatch.matchlive.value,
                                      ));
                                    }
                                  } else {
                                    startmatch.matchlive.value.inningId == 3
                                        ? startmatch.Endmatch.value = true
                                        : startmatch.Endmatch.value = false;

                                    Get.to(RunInputScreen(
                                      match: startmatch.matchlive.value,
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  color: darkBlue,
                                  child: Center(
                                    child: Text(
                                      startmatch.matchlive.value.buttonLabel ??
                                          "Start Match",
                                      style: TextStyle(
                                          letterSpacing: 0.6,
                                          color: kwhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    ScoreBoardScreen(match: widget.match),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  textlines({
    required String text1,
    required String text2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text2,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

/**/

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:yarn_modified/cricketscreens/admin/match/startmatch/tossscreen.dart';
// import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';
// import 'package:yarn_modified/cricketscreens/getx/screenshotcontroller.dart';
// import 'package:yarn_modified/cricketscreens/getx/startmatchcontroller.dart';
// import 'package:yarn_modified/cricketscreens/model/matchlivedetailsresponse.dart';
// import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';
// import 'package:yarn_modified/cricketscreens/photoscreen.dart';
// import '../../../const/const.dart';
// import '../../../const/themes.dart';
// import '../../../constcolor.dart';
// import '../../../helper.dart';
// import '../../../services/all_api_services.dart';
// import '../../../services/app_url.dart';
// import '../../../widgets/tournamenttextfield.dart';
// import 'admin/match/startmatch/openingplayers.dart';
// import 'admin/match/startmatch/runinputscreen.dart';
// import 'model/matchlivedetailssuperoverresponse.dart';
//
// class SuperOverInfoScreen extends StatefulWidget {
//   final int isadmin;
//   // final Matchinfo? match;
//   final Superover? superOver;
//
//   const SuperOverInfoScreen({super.key, this.isadmin = 0, this.superOver});
//
//   @override
//   State<SuperOverInfoScreen> createState() => _SuperOverInfoScreenState();
// }
//
// class _SuperOverInfoScreenState extends State<SuperOverInfoScreen> {
//   StartMatchController startmatch = Get.put(StartMatchController());
//   screenshotcontrol screenshot = Get.put(screenshotcontrol());
//   MatchController matchController = Get.put(MatchController());
//
//   String playerofthematchid = "";
//   playerofthematchSheet() async {
//     startmatch.AllPlayersListFromAPI(
//         teamid1: startmatch.matchlive.value.team1?.id.toString() ?? "",
//         teamid2: startmatch.matchlive.value.team2?.id.toString() ?? "");
//     playerofthematchid = "";
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           actionsPadding: EdgeInsets.zero,
//           insetPadding: EdgeInsets.zero,
//           contentPadding: EdgeInsets.zero,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return Container(
//                 width: screenwidth(context, dividedby: 1.2),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 decoration: BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(15)),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Obx(
//                           () => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: TournamentDropdown(
//                           // initialValue:
//                           //     widget.matchdetail?.team2?.id.toString(),
//                           count: startmatch.Allplayerlist.map((e) => DropdownMenuItem<String>(
//                               value: "${e.playerId}", child: Text("${e.player?.playerName}"))).toList(),
//                           onchange: (p0) {
//                             playerofthematchid = p0.toString();
//                             setState(() {});
//                           },
//                           validator: (p0) {
//                             if (p0?.isEmpty ?? true) {
//                               return "Select player of the match";
//                             }
//                             return null;
//                           },
//                           lable: "Select player of the match",
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               color: Colors.grey,
//                               height: 40,
//                               child: MaterialButton(
//                                 onPressed: () {
//                                   Get.back();
//                                 },
//                                 child: const Center(
//                                     child: Text(
//                                       "Cancel",
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Expanded(
//                             child: Container(
//                               color: Colors.grey,
//                               height: 40,
//                               child: MaterialButton(
//                                 onPressed: () {
//                                   bool valid = playerofthematchid == "" ? false : true;
//                                   if (!valid) {
//                                     FlutterToast.showCustomToast("Please Select player of the match");
//                                   } else {
//                                     startmatch.playerofthematchapi(
//                                         touramentid: startmatch.matchlive.value.tournamentId.toString(),
//                                         matchid: startmatch.matchlive.value.id.toString(),
//                                         playerofthematch: playerofthematchid);
//                                     Get.back();
//                                   }
//                                 },
//                                 child: const Center(
//                                     child: Text(
//                                       "Confirm",
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> _refresh() async {
//     startmatch.matchInfoDetailFromAPI(
//         tournamentid: widget.superOver?.tournamentId.toString() ?? "", matchid: widget.superOver?.id.toString() ?? "");
//   }
//
//   TextStyle defaultstyle =
//   TextStyle(color: darkBlue, fontSize: 12, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis);
//   TextStyle defaultstyle2 =
//   TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis);
//
//   @override
//   void initState() {
//     matchController.FetchSuperOverMatchFromAPI(tournamentId: widget.superOver?.tournamentId.toString() ?? "", matchid: widget.superOver?.id.toString() ?? "");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: RefreshIndicator(
//             onRefresh: _refresh,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Obx(
//                         () => Column(
//                       children: [
//                         SizedBox(height: 5),
//                         Screenshot(
//                           controller: screenshot.screenshotController,
//                           child: Column(
//                             children: [
//                               Container(
//                                 // height: 200,
//                                 width: double.infinity,
//                                 child: Card(
//                                   elevation: 4,
//                                   margin: EdgeInsets.symmetric(horizontal: 15),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           // mainAxisSize: MainAxisSize.max,
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 PhotoScreencric(
//                                                     dobbn: 18,
//                                                     image: URLs.image_url_team + "${widget.superOver?.team1?.logo}"),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Text(
//                                                   widget.superOver?.team1?.shortName ?? "",
//                                                   style: TextStyle(
//                                                       color: startmatch.matchlive.value.summary != null
//                                                           ? startmatch.matchlive.value.wonteamid ==
//                                                           startmatch.matchlive.value.team1?.id
//                                                           ? Colors.black
//                                                           : Colors.grey
//                                                           : startmatch.matchlive.value.bettingTeamId ==
//                                                           startmatch.matchlive.value.team1?.id
//                                                           ? Colors.black
//                                                           : Colors.grey,
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.w400),
//                                                 ),
//                                               ],
//                                             ),
//                                             startmatch.matchlive.value.team1TotalOver == null
//                                                 ? Text(
//                                               textAlign: TextAlign.center,
//                                               "",
//                                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                                             )
//                                                 : Row(
//                                               children: [
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   "${startmatch.matchlive.value.team1Runs}-${startmatch.matchlive.value.team1TotalWickets}",
//                                                   style: TextStyle(
//                                                       color: startmatch.matchlive.value.summary != null
//                                                           ? startmatch.matchlive.value.wonteamid ==
//                                                           startmatch.matchlive.value.team1?.id
//                                                           ? Colors.black
//                                                           : Colors.grey
//                                                           : startmatch.matchlive.value.bettingTeamId ==
//                                                           startmatch.matchlive.value.team1?.id
//                                                           ? Colors.black
//                                                           : Colors.grey,
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.w500),
//                                                 ),
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   " (${startmatch.matchlive.value.team1TotalOver})",
//                                                   style: TextStyle(
//                                                       color: startmatch.matchlive.value.summary != null
//                                                           ? startmatch.matchlive.value.wonteamid ==
//                                                           startmatch.matchlive.value.team1?.id
//                                                           ? Colors.black
//                                                           : Colors.grey
//                                                           : startmatch.matchlive.value.bettingTeamId ==
//                                                           startmatch.matchlive.value.team1?.id
//                                                           ? Colors.black
//                                                           : Colors.grey,
//                                                       fontSize: 16,
//                                                       fontWeight: FontWeight.w500),
//                                                 ).paddingOnly(right: 20),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                         Row(
//                                           // mainAxisSize: MainAxisSize.max,
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 PhotoScreencric(
//                                                     dobbn: 18,
//                                                     image: URLs.image_url_team + "${widget.superOver?.team2?.logo}"),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Text(
//                                                   widget.superOver?.team2?.shortName ?? "",
//                                                   style: TextStyle(
//                                                       color: startmatch.matchlive.value.summary != null
//                                                           ? startmatch.matchlive.value.wonteamid ==
//                                                           startmatch.matchlive.value.team2?.id
//                                                           ? Colors.black
//                                                           : Colors.grey
//                                                           : startmatch.matchlive.value.bettingTeamId ==
//                                                           startmatch.matchlive.value.team2?.id
//                                                           ? Colors.black
//                                                           : Colors.grey,
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.w400),
//                                                 ),
//                                               ],
//                                             ),
//                                             startmatch.matchlive.value.team2TotalOver == null
//                                                 ? Text(
//                                               textAlign: TextAlign.center,
//                                               "",
//                                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                                             )
//                                                 : Row(
//                                               children: [
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   "${startmatch.matchlive.value.team2Runs}-${startmatch.matchlive.value.team2TotalWickets}",
//                                                   style: TextStyle(
//                                                       color: startmatch.matchlive.value.summary != null
//                                                           ? startmatch.matchlive.value.wonteamid ==
//                                                           startmatch.matchlive.value.team2?.id
//                                                           ? Colors.black
//                                                           : Colors.grey
//                                                           : startmatch.matchlive.value.bettingTeamId ==
//                                                           startmatch.matchlive.value.team2?.id
//                                                           ? Colors.black
//                                                           : Colors.grey,
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.w500),
//                                                 ),
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   " (${startmatch.matchlive.value.team2TotalOver})",
//                                                   style: TextStyle(
//                                                       color: startmatch.matchlive.value.summary != null
//                                                           ? startmatch.matchlive.value.wonteamid ==
//                                                           startmatch.matchlive.value.team2?.id
//                                                           ? Colors.black
//                                                           : Colors.grey
//                                                           : startmatch.matchlive.value.bettingTeamId ==
//                                                           startmatch.matchlive.value.team2?.id
//                                                           ? Colors.black
//                                                           : Colors.grey,
//                                                       fontSize: 16,
//                                                       fontWeight: FontWeight.w500),
//                                                 ).paddingOnly(right: 20),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         startmatch.matchlive.value.summary == null
//                                             ? Column(
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   "CRR   ${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1Crr ?? "0.00" : startmatch.matchlive.value.team2Crr ?? "0.00"}",
//                                                   style: TextStyle(
//                                                       color: Colors.grey.shade700,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w400),
//                                                 ),
//                                                 startmatch.matchlive.value.inningId == 2
//                                                     ? Text(
//                                                   textAlign: TextAlign.center,
//                                                   "REQ  ${startmatch.requirerunrate}",
//                                                   style: TextStyle(
//                                                       color: Colors.grey.shade700,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w400),
//                                                 )
//                                                     : SizedBox(),
//                                                 startmatch.matchlive.value.inningId == 2
//                                                     ? Text(
//                                                   textAlign: TextAlign.center,
//                                                   "Target :  ${startmatch.target}",
//                                                   style: TextStyle(
//                                                       color: Colors.grey.shade900,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w500),
//                                                 )
//                                                     : SizedBox(),
//                                               ],
//                                             ),
//                                             startmatch.matchlive.value.inningId == 2
//                                                 ? Column(
//                                               children: [
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   "${startmatch.requirestatus}",
//                                                   style: TextStyle(
//                                                       color: Colors.grey.shade700,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w400),
//                                                 ),
//                                               ],
//                                             )
//                                                 : SizedBox(),
//                                           ],
//                                         )
//                                             : Column(
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   textAlign: TextAlign.center,
//                                                   startmatch.matchlive.value.summary.toString(),
//                                                   style: TextStyle(
//                                                       color: Cricket_textColorSecondary,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               (startmatch.matchlive.value.inningId ?? 0) > 3
//                                   ? SizedBox()
//                                   : Column(
//                                 children: [
//                                   startmatch.matchlive.value.playerstrick?.id == null
//                                       ? SizedBox.shrink()
//                                       : Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Card(
//                                           elevation: 4,
//                                           // margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
//
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 width: MediaQuery.of(context).size.width,
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.grey.shade200,
//                                                     borderRadius: BorderRadius.only(
//                                                         topRight: Radius.circular(10),
//                                                         topLeft: Radius.circular(10))),
//                                                 padding: const EdgeInsets.all(8),
//                                                 child: Row(
//                                                   children: <Widget>[
//                                                     Expanded(
//                                                         flex: 7,
//                                                         child: Text(
//                                                             "Batter(${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})",
//                                                             style: textbar)),
//                                                     Expanded(
//                                                         child: Text("R",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         child: Text("B",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         child: Text("4s",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         child: Text("6s",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         flex: 2,
//                                                         child: Text("SR",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Column(children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
//                                                   },
//                                                   child: Container(
//                                                       padding: const EdgeInsets.only(left: 0),
//                                                       child: Column(
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: <Widget>[
//                                                           SizedBox(
//                                                             height: 8,
//                                                           ),
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(
//                                                                 right: 8, left: 8, top: 5),
//                                                             child: Row(
//                                                               children: <Widget>[
//                                                                 Expanded(
//                                                                     flex: 7,
//                                                                     child: Text(
//                                                                         "${startmatch.matchlive.value.playerstrick?.playerName}  🏏",
//                                                                         style: TextStyle(
//                                                                             color: Colors.grey.shade700,
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w400))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .stickerScore?.run
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.bold))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .stickerScore?.balls
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .stickerScore?.fours
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .stickerScore?.sixers
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))),
//                                                                 Expanded(
//                                                                     flex: 2,
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .stickerScore?.strikeRate
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           const Divider(
//                                                             thickness: 0.8,
//                                                           ),
//                                                         ],
//                                                       )),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
//                                                   },
//                                                   child: Container(
//                                                       padding: const EdgeInsets.only(left: 0),
//                                                       child: Column(
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: <Widget>[
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(
//                                                                 right: 8, left: 8, top: 5),
//                                                             child: Row(
//                                                               children: <Widget>[
//                                                                 Expanded(
//                                                                     flex: 7,
//                                                                     child: Text(
//                                                                         startmatch
//                                                                             .matchlive
//                                                                             .value
//                                                                             .playerNonStricker
//                                                                             ?.playerName
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.grey.shade700,
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w400))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .nonstickerScore?.run
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.bold))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .nonstickerScore?.balls
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .nonstickerScore?.fours
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))
//                                                                         .paddingOnly(left: 4)),
//                                                                 Expanded(
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .nonstickerScore?.sixers
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))
//                                                                         .paddingOnly(left: 4)),
//                                                                 Expanded(
//                                                                     flex: 2,
//                                                                     child: Text(
//                                                                         textAlign: TextAlign.center,
//                                                                         startmatch.matchlive.value
//                                                                             .nonstickerScore?.strikeRate
//                                                                             .toString() ??
//                                                                             "",
//                                                                         style: TextStyle(
//                                                                             color: Colors.black,
//                                                                             fontSize: 12))),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           const Divider(
//                                                             thickness: 0.8,
//                                                           ),
//                                                           Padding(
//                                                             padding: const EdgeInsets.symmetric(
//                                                                 horizontal: 10.0),
//                                                             child: Text(
//                                                                 "Partnership   ${startmatch.partnershiprun} (${startmatch.partnershipball})",
//                                                                 style: TextStyle(
//                                                                     color: Colors.grey.shade700,
//                                                                     fontSize: 12,
//                                                                     fontWeight: FontWeight.w400)),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 5,
//                                                           ),
//                                                         ],
//                                                       )),
//                                                 ),
//                                               ]),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startmatch.matchlive.value.playerBowler?.id == null
//                                       ? SizedBox.shrink()
//                                       : Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 0,
//                                       ),
//                                       Container(
//                                         // height: 200,
//                                         width: double.infinity,
//                                         child: Card(
//                                           elevation: 4,
//                                           margin: EdgeInsets.only(left: 15, right: 15, bottom: 0),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 width: MediaQuery.of(context).size.width,
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.grey.shade200,
//                                                     borderRadius: BorderRadius.only(
//                                                         topRight: Radius.circular(10),
//                                                         topLeft: Radius.circular(10))),
//                                                 padding: const EdgeInsets.all(8),
//                                                 child: Row(
//                                                   children: <Widget>[
//                                                     Expanded(
//                                                         flex: 7,
//                                                         child: Text(
//                                                             "Bowler(${startmatch.matchlive.value.bowlingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})",
//                                                             style: textbar)),
//                                                     Expanded(
//                                                         child: Text("O",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         child: Text("M",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         child: Text("R",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         child: Text("W",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                     Expanded(
//                                                         flex: 2,
//                                                         child: Text("ER",
//                                                             textAlign: TextAlign.center, style: textbar)),
//                                                   ],
//                                                 ),
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
//                                                 },
//                                                 child: Container(
//                                                     padding: const EdgeInsets.only(left: 0),
//                                                     child: Column(
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: <Widget>[
//                                                         Padding(
//                                                           padding: const EdgeInsets.only(
//                                                               right: 8, left: 8, top: 5),
//                                                           child: Row(
//                                                             children: <Widget>[
//                                                               Expanded(
//                                                                   flex: 7,
//                                                                   child: Text(
//                                                                       startmatch.matchlive.value
//                                                                           .playerBowler?.playerName ??
//                                                                           "",
//                                                                       style: TextStyle(
//                                                                           color: Colors.grey.shade700,
//                                                                           fontSize: 12))),
//                                                               Expanded(
//                                                                   child: Text(
//                                                                       textAlign: TextAlign.center,
//                                                                       startmatch.matchlive.value.bowlerScore
//                                                                           ?.overs
//                                                                           .toString() ??
//                                                                           '',
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 12))),
//                                                               Expanded(
//                                                                   child: Text(
//                                                                       textAlign: TextAlign.center,
//                                                                       startmatch.matchlive.value.bowlerScore
//                                                                           ?.maidenOver
//                                                                           .toString() ??
//                                                                           '',
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 12))),
//                                                               Expanded(
//                                                                   child: Text(
//                                                                       textAlign: TextAlign.center,
//                                                                       startmatch.matchlive.value.bowlerScore
//                                                                           ?.runs
//                                                                           .toString() ??
//                                                                           '',
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 12))),
//                                                               Expanded(
//                                                                   child: Text(
//                                                                       textAlign: TextAlign.center,
//                                                                       startmatch.matchlive.value.bowlerScore
//                                                                           ?.wickets
//                                                                           .toString() ??
//                                                                           '',
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 12,
//                                                                           fontWeight: FontWeight.bold))),
//                                                               Expanded(
//                                                                   flex: 2,
//                                                                   child: Text(
//                                                                       textAlign: TextAlign.center,
//                                                                       startmatch.matchlive.value.bowlerScore
//                                                                           ?.economyRate
//                                                                           .toString() ??
//                                                                           '',
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 12))),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         // Padding(
//                                                         //     padding: EdgeInsets.only(
//                                                         //         right: 10,
//                                                         //         left: 10,
//                                                         //         top: 5,
//                                                         //         bottom: 5),
//                                                         //     child: Text("not out (Head)",
//                                                         //             style: TextStyle(
//                                                         //                 color: Colors.black,
//                                                         //                 fontSize: 12))
//                                                         //         .paddingOnly(
//                                                         //             top: 4, bottom: 4)),
//                                                       ],
//                                                     )),
//                                               ),
//                                               Divider(),
//                                               Container(
//                                                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
//                                                 width: screenwidth(context, dividedby: 1),
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       flex: 8,
//                                                       child: Wrap(
//                                                         runSpacing: 10,
//                                                         spacing: 10,
//                                                         children:
//                                                         List.generate(startmatch.balls.length, (index) {
//                                                           Ball ball = startmatch.balls[index];
//                                                           return Container(
//                                                             width: screenwidth(context, dividedby: 13),
//                                                             height: screenwidth(context, dividedby: 13),
//                                                             // padding: EdgeInsets.all(10),
//                                                             decoration: BoxDecoration(
//                                                               shape: BoxShape.circle,
//                                                               color: ball.outType == null
//                                                                   ? ball.ballType == "normal"
//                                                                   ? ball.run == 6
//                                                                   ? Colors.green
//                                                                   : ball.run == 4
//                                                                   ? Colors.blue
//                                                                   : Colors.black45
//                                                                   : Colors.orange
//                                                                   : Colors.red,
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 ball.balltag ?? "",
//                                                                 style: TextStyle(
//                                                                     fontSize: ball.balltag?.length == 1
//                                                                         ? screenwidth(context,
//                                                                         dividedby: 30)
//                                                                         : screenwidth(context,
//                                                                         dividedby: 35),
//                                                                     color: Colors.white,
//                                                                     fontWeight: FontWeight.w500),
//                                                               ),
//                                                             ),
//                                                           );
//                                                         }),
//                                                       ),
//                                                     ),
//                                                     Expanded(
//                                                       child: Text(
//                                                         "= ${startmatch.overrun}",
//                                                         style: TextStyle(color: Colors.black54),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 10,
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               startmatch.matchlive.value.playerofthematch?.id == null
//                                   ? startmatch.matchlive.value.inningId == 4
//                                   ? widget.isadmin == 1
//                                   ? Card(
//                                   margin: EdgeInsets.only(left: 15, right: 15, top: 15),
//                                   child: TextButton(
//                                       onPressed: () {
//                                         playerofthematchSheet();
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text("Declare Player of the match",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 14)),
//                                         ],
//                                       )))
//                                   : SizedBox()
//                                   : SizedBox()
//                                   : Container(
//                                 // height: 200,
//                                 width: double.infinity,
//
//                                 child: Column(
//                                   children: [
//                                     SizedBox(height: 15),
//                                     Card(
//                                       elevation: 4,
//                                       margin: EdgeInsets.symmetric(horizontal: 15),
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                                             width: screenwidth(context, dividedby: 1),
//                                             // height: 30,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.grey.shade200,
//                                                 borderRadius: BorderRadius.only(
//                                                     topRight: Radius.circular(10), topLeft: Radius.circular(10))),
//                                             child: Text(
//                                               "Player of the match",
//                                               style: TextStyle(
//                                                   color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
//                                             ),
//                                           ),
//                                           Container(
//                                             decoration: BoxDecoration(
//                                                 color: kwhite,
//                                                 borderRadius: BorderRadius.only(
//                                                     bottomRight: Radius.circular(10),
//                                                     bottomLeft: Radius.circular(10))),
//                                             child: Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                                                     child: Row(
//                                                       children: [
//                                                         PhotoScreencric(
//                                                             dobbn: 30,
//                                                             image: URLs.image_url_player +
//                                                                 "${startmatch.matchlive.value.playerofthematch?.logo}"),
//                                                         SizedBox(width: 20),
//                                                         Container(
//                                                           width: screenwidth(context, dividedby: 2.45),
//                                                           child: Column(
//                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                             children: [
//                                                               Text(
//                                                                 "${startmatch.matchlive.value.playerofthematch?.playerName}",
//                                                                 style: TextStyle(
//                                                                     color: kblack,
//                                                                     fontWeight: FontWeight.w500,
//                                                                     fontSize: 15),
//                                                               ),
//                                                               SizedBox(height: 8),
//                                                               Text(
//                                                                 "${startmatch.matchlive.value.playerOfTheMatchTeam ?? "CSK"}",
//                                                                 style: TextStyle(
//                                                                     color: Colors.grey.shade500,
//                                                                     fontWeight: FontWeight.w500,
//                                                                     fontSize: 14),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Image.asset(
//                                                     height: screenwidth(context, dividedby: 4),
//                                                     width: screenwidth(context, dividedby: 4),
//                                                     "images/Rank Section - One time.gif")
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // startmatch.matchlive.value.summary.toString() == "Match Draw" ?
//                         // startmatch.matchSuperOverList.length > 0 ?
//                         // Container(
//                         //   padding: EdgeInsets.only(top: 20),
//                         //   child:
//                         //   ListView.builder(
//                         //     scrollDirection: Axis.vertical,
//                         //     itemCount: startmatch.matchSuperOverList.length,
//                         //     shrinkWrap: true,
//                         //     physics: NeverScrollableScrollPhysics(),
//                         //     itemBuilder: (BuildContext context, int index) {
//                         //       return InkWell(
//                         //         onTap: () {
//                         //           // print(startmatch.matchSuperOverList[index].id);
//                         //           // Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(match: startmatch.matchSuperOverList[index])));
//                         //           // Get.to(SuperOverInfoScreen(
//                         //           //     match: startmatch.matchSuperOverList[index], isadmin: 1));
//                         //         },
//                         //         child: Container(
//                         //           height: 40,
//                         //           padding: const EdgeInsets.symmetric(
//                         //               horizontal: 10, vertical: 10),
//                         //           color: index.isEven ? Cricket_white : Colors.grey.shade200,
//                         //           child: Row(
//                         //             crossAxisAlignment: CrossAxisAlignment.center,
//                         //             children: <Widget>[
//                         //               Expanded(
//                         //                   flex: 2,
//                         //                   child: Center(
//                         //                       child: Text(
//                         //                           textAlign: TextAlign.center,
//                         //                           '${index + 1}',
//                         //                           style: defaultstyle2))),
//                         //               Expanded(
//                         //                   flex: 5,
//                         //                   child: Center(
//                         //                       child: Text(
//                         //                           textAlign: TextAlign.center,
//                         //                           '${startmatch.matchSuperOverList[index].matchdatecon()}',
//                         //                           style: defaultstyle2))),
//                         //               Expanded(
//                         //                   flex: 4,
//                         //                   child: Center(
//                         //                       child: Text(
//                         //                           textAlign: TextAlign.center,
//                         //                           '${startmatch.matchSuperOverList[index].matchtimeformat()}',
//                         //                           style: defaultstyle2))),
//                         //               Expanded(
//                         //                   flex: 5,
//                         //                   child: Center(
//                         //                       child: Text(
//                         //                           textAlign: TextAlign.center,
//                         //                           '${startmatch.matchSuperOverList[index].team1?.shortName}',
//                         //                           style: defaultstyle2))),
//                         //               Expanded(
//                         //                   flex: 5,
//                         //                   child: Center(
//                         //                       child: Text(
//                         //                           textAlign: TextAlign.center,
//                         //                           '${startmatch.matchSuperOverList[index].team2?.shortName}',
//                         //                           style: defaultstyle2))),
//                         //               Expanded(
//                         //                   flex: 1,
//                         //                   child: Center(
//                         //                       child: startmatch.matchSuperOverList[index]
//                         //                           .matchStatus?.id ==
//                         //                           1
//                         //                           ? CircleAvatar(
//                         //                         radius: 5,
//                         //                         backgroundColor: Colors.green,
//                         //                       )
//                         //                           : SizedBox.shrink())),
//                         //               Expanded(
//                         //                 flex: 1,
//                         //                 child: PopupMenuButton(
//                         //                   icon: Icon(
//                         //                     Icons.more_vert_outlined,
//                         //                     color: Colors.grey,
//                         //                   ),
//                         //                   onSelected: (value) {
//                         //                     if (value == "1") {
//                         //                       // Get.to(AddMatchScreen(
//                         //                       //   matchdetail:
//                         //                       //   startmatch.matchSuperOverList[index],
//                         //                       //   // tournametid: widget.tournamentid,
//                         //                       //   tournametid: "117",
//                         //                       // ));
//                         //                     } else {
//                         //                       showDialog(
//                         //                           context: context,
//                         //                           builder: (BuildContext context) {
//                         //                             return AlertDialog(
//                         //                               backgroundColor: Colors.grey.shade200,
//                         //                               title: Text(
//                         //                                 "Alert",
//                         //                                 style: TextStyle(
//                         //                                     fontSize: 20, color: Colors.red),
//                         //                               ),
//                         //                               content: Text(
//                         //                                 "Do you want to Delete this Match?",
//                         //                                 style: TextStyle(
//                         //                                     fontSize: 15,
//                         //                                     // fontWeight: FontWeight.w600,
//                         //                                     color: Colors.black
//                         //                                         .withOpacity(0.6)),
//                         //                               ),
//                         //                               actions: <Widget>[
//                         //                                 ElevatedButton(
//                         //                                     style: TextButton.styleFrom(
//                         //                                         elevation: 5,
//                         //                                         surfaceTintColor: Colors.grey,
//                         //                                         backgroundColor:
//                         //                                         Colors.white70),
//                         //                                     onPressed: () {
//                         //                                       Navigator.of(context)
//                         //                                           .pop(false);
//                         //                                     },
//                         //                                     child: Text(
//                         //                                       "Cancel",
//                         //                                       style: TextStyle(
//                         //                                           fontSize: 15,
//                         //                                           color: Colors.black),
//                         //                                     )),
//                         //                                 ElevatedButton(
//                         //                                     style: TextButton.styleFrom(
//                         //                                         elevation: 5,
//                         //                                         surfaceTintColor: Colors.red
//                         //                                             .withOpacity(0.3),
//                         //                                         foregroundColor: Colors.red,
//                         //                                         backgroundColor: Colors.red),
//                         //                                     onPressed: () async {
//                         //                                       matchController
//                         //                                           .DeletematchFromAPI(
//                         //                                           id: matchController
//                         //                                               .matchllist[index]
//                         //                                               .id
//                         //                                               .toString(),
//                         //                                           tournamentid:
//                         //                                           matchController
//                         //                                               .matchllist[
//                         //                                           index]
//                         //                                               .tournamentId
//                         //                                               .toString());
//                         //                                     },
//                         //                                     child: Text(
//                         //                                       "Delete",
//                         //                                       style: TextStyle(
//                         //                                           fontSize: 15,
//                         //                                           color: Colors.white70),
//                         //                                     )),
//                         //                               ],
//                         //                             );
//                         //                           });
//                         //                     }
//                         //                   },
//                         //                   itemBuilder: (BuildContext context) => [
//                         //                     PopupMenuItem(value: '1', child: Text('Edit')),
//                         //                     PopupMenuItem(value: '2', child: Text('Delete')),
//                         //                   ],
//                         //                   iconSize: 20,
//                         //                   padding: EdgeInsets.zero,
//                         //                 ),
//                         //               ),
//                         //             ],
//                         //           ),
//                         //         ),
//                         //       );
//                         //     },
//                         //   ),
//                         //
//                         // ):
//                         // Padding(
//                         //   padding: EdgeInsets.only(top: 15),
//                         //   child: ElevatedButton(
//                         //       style: ButtonStyle(
//                         //           padding: MaterialStateProperty.all(EdgeInsets.all(5)),
//                         //           backgroundColor: MaterialStateProperty.all(MyTheme.appBarColor)
//                         //       ),
//                         //       onPressed: () {
//                         //         matchController.AddSuperOverMatchFromAPI(
//                         //             matchid:
//                         //             widget.match?.id.toString() ?? "");
//                         //       },
//                         //       child: Text("Super Over",style: TextStyle(fontSize: 15))
//                         //   ),
//                         // ) : SizedBox.shrink(),
//                         Container(
//                           // height: 200,
//                           width: double.infinity,
//                           child: Card(
//                             elevation: 4,
//                             margin: EdgeInsets.all(15),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                                   width: screenwidth(context, dividedby: 1),
//                                   // height: 30,
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey.shade200,
//                                       borderRadius: BorderRadius.only(
//                                           topRight: Radius.circular(10), topLeft: Radius.circular(10))),
//                                   child: Text(
//                                     "Match Details",
//                                     style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       // Padding(
//                                       //   padding: const EdgeInsets.all(8.0),
//                                       //   child: Text(
//                                       //     "Match Info",
//                                       //     style: TextStyle(
//                                       //       fontSize: 16,
//                                       //       fontWeight: FontWeight.w500,
//                                       //     ),
//                                       //   ),
//                                       // ),
//
//                                       textlines(
//                                           text1: "Tournament Name",
//                                           text2: "${widget.superOver?.tournament?.tournamentName}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Match Address", text2: "${widget.superOver?.venue}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Date", text2: "${widget.superOver?.matchdateformat()}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Time", text2: "${widget.superOver?.matchtimeformat()}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Match Type", text2: "${widget.superOver?.matchType}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Umpire", text2: "${widget.superOver?.umpires}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Overs", text2: "${widget.superOver?.overseas}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(
//                                           text1: "Toss",
//                                           text2:
//                                           "${startmatch.matchlive.value.inningId == 0 ? "------" : startmatch.matchlive.value.tossstatus}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(text1: "Ball Type", text2: "${widget.superOver?.tournament?.ballType}"),
//                                       Divider(
//                                         color: Colors.grey.shade400,
//                                         height: 25,
//                                       ),
//                                       textlines(
//                                           text1: "Match code",
//                                           text2:
//                                           "m=${widget.superOver?.id}, t=${widget.superOver?.tournament?.id}, uid=${saveUser()?.id}, t1=${widget.superOver?.team1?.id}, t2=${widget.superOver?.team2?.id}"),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Obx(() => Visibility(
//           visible: widget.isadmin == 1
//               ? (startmatch.matchlive.value.inningId ?? 0) > 3
//               ? false
//               : true
//               : false,
//           // widget.isadmin == 1
//           //     ? startmatch.matchlive.value.summary == null
//           //         ? true
//           //         : false
//           //     : false,
//           child: InkWell(
//             onTap: () {
//               if (startmatch.matchlive.value.stickerScore?.playerId == null) {
//                 if (startmatch.matchlive.value.toss == null) {
//                   // Get.to(TossScreen(match: widget.superOver));
//                 } else if ((startmatch.matchlive.value.inningId ?? 0) > 2) {
//                   startmatch.matchlive.value.inningId == 3
//                       ? startmatch.Endmatch.value = true
//                       : startmatch.Endmatch.value = false;
//                   Get.to(RunInputScreen(
//                     match: startmatch.matchlive.value,
//                   ));
//                 } else {
//                   Get.to(OpeningPlayers(
//                     match: startmatch.matchlive.value,
//                   ));
//                 }
//               } else {
//                 startmatch.matchlive.value.inningId == 3
//                     ? startmatch.Endmatch.value = true
//                     : startmatch.Endmatch.value = false;
//
//                 Get.to(RunInputScreen(
//                   match: startmatch.matchlive.value,
//                 ));
//               }
//             },
//             child: Container(
//               height: 50,
//               color: darkBlue,
//               child: Center(
//                 child: Text(
//                   startmatch.matchlive.value.buttonLabel ?? "Start Match",
//                   style: TextStyle(letterSpacing: 0.6, color: kwhite, fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ),
//         ))
//       ],
//     );
//   }
//
//   textlines({
//     required String text1,
//     required String text2,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text1,
//             style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             text2,
//             style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),
//           ),
//         ],
//       ),
//     );
//   }
// }
