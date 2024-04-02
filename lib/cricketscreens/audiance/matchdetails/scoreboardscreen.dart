import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';

import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../getx/startmatchcontroller.dart';
import '../../model/getscroreboarddetails.dart';

class ScoreBoardScreen extends StatefulWidget {
  final Matchinfo match;
  const ScoreBoardScreen({super.key, required this.match});

  @override
  State<ScoreBoardScreen> createState() => _ScoreBoardScreenState();
}

class _ScoreBoardScreenState extends State<ScoreBoardScreen>
    with SingleTickerProviderStateMixin {
  StartMatchController startmatch = Get.put(StartMatchController());

  late TabController _tabController;
  @override
  void initState() {
    int index = startmatch.matchlive.value.bettingTeamId.toString() ==
            startmatch.matchlive.value.team1?.id.toString()
        ? 0
        : 1;
    startmatch.indextab.value = index;
    _tabController = TabController(length: 2, vsync: this, initialIndex: index);
    index == 0
        ? startmatch.scorecardFromAPI(
            teamid: widget.match.team1?.id.toString() ?? "",
            matchid: widget.match.id.toString(),
            touramentid: widget.match.tournament?.id.toString() ?? "")
        : startmatch.scorecard2FromAPI(
            teamid: widget.match.team2?.id.toString() ?? "",
            matchid: widget.match.id.toString(),
            touramentid: widget.match.tournament?.id.toString() ?? "");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     // color: Colors.white,
    //     child: Center(
    //   child: Text("No Data Found"),
    // ));
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            labelPadding: EdgeInsets.symmetric(vertical: 5),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: MyTheme.appBarColor),
            labelColor: kwhite,
            unselectedLabelColor: MyTheme.appBarColor,
            onTap: (value) {
              startmatch.indextab.value = value;
              value == 0
                  ? startmatch.scorecardFromAPI(
                      teamid: widget.match.team1?.id.toString() ?? "",
                      matchid: widget.match.id.toString(),
                      touramentid: widget.match.tournament?.id.toString() ?? "")
                  : startmatch.scorecard2FromAPI(
                      teamid: widget.match.team2?.id.toString() ?? "",
                      matchid: widget.match.id.toString(),
                      touramentid:
                          widget.match.tournament?.id.toString() ?? "");
            },
            tabs: [
              Text(
                widget.match.team1?.shortName ?? "",
              ),
              Text(
                widget.match.team2?.shortName ?? "",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Obx(
                  () => startmatch.scorebordbool.isFalse
                      ? Center(
                          child: SizedBox(),
                        )
                      : Container(
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      top: 7, bottom: 7, left: 10, right: 10),
                                  color: Colors.grey.shade300,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 7,
                                          child:
                                              Text("Batter", style: textbar)),
                                      Expanded(
                                          child: Text("R",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("B",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("4s",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("6s",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          flex: 2,
                                          child: Text("SR",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      // Expanded(
                                      //     child: Text("",
                                      //             style: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontSize: 12))
                                      //        ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: List.generate(
                                      startmatch.scroreboard.value.betsmens
                                              ?.length ??
                                          0, (index) {
                                    Betsmen? batsman = startmatch
                                        .scroreboard.value.betsmens?[index];
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                      },
                                      child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10,
                                                    left: 10,
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 7,
                                                        child: Text(
                                                            "${batsman?.betsmens?.playerName} ${batsman?.outStatusLabel == "not out" ? "*" : ""}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.run
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.balls
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.fours
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.sixers
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.strikeRate
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10,
                                                      left: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                          "${batsman?.outStatusLabel}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12))
                                                      .paddingOnly(
                                                          top: 4, bottom: 4)),
                                              const Divider(
                                                thickness: 0.8,
                                                height: 0,
                                              ),
                                            ],
                                          )),
                                    );
                                  }),
                                ),
                                const Divider(
                                  thickness: 0.25,
                                  height: 0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Extras",
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text(
                                                "${startmatch.scroreboard.value.extra?.total}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                " b ${startmatch.scroreboard.value.extra?.ball}, by ${startmatch.scroreboard.value.extra?.by}, lb ${startmatch.scroreboard.value.extra?.lb}, wd ${startmatch.scroreboard.value.extra?.wb}, nd ${startmatch.scroreboard.value.extra?.nb}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    ).paddingOnly(right: 4),
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.25,
                                  height: 0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 3,
                                          child: Text("Total",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.bold))),

                                      // padding: const EdgeInsets.only(right: 50),
                                      Text(
                                        startmatch.indextab.value == 0
                                            ? "${startmatch.matchlive.value.team1TotalRun}-${startmatch.matchlive.value.team1TotalWickets} (${startmatch.matchlive.value.team1TotalOver})"
                                            : "${startmatch.matchlive.value.team2TotalRun}-${startmatch.matchlive.value.team2TotalWickets} (${startmatch.matchlive.value.team2TotalOver})",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "CRR  ${startmatch.indextab.value == 0 ? startmatch.scroreboard.value.data?.team1Crr : startmatch.scroreboard.value.data?.team2Crr}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.25,
                                  height: 0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),
                                  color: Colors.grey.shade300,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 7,
                                          child:
                                              Text("Bowler", style: textbar)),
                                      Expanded(
                                          child: Text("O",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("M",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("R",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("W",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          flex: 2,
                                          child: Text("ER",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: List.generate(
                                      startmatch.scroreboard.value.bawlers
                                              ?.length ??
                                          0, (index) {
                                    Bawler? bowler = startmatch
                                        .scroreboard.value.bawlers?[index];
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                      },
                                      child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10,
                                                    left: 10,
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 7,
                                                        child: Text(
                                                            bowler?.bowler
                                                                    ?.playerName ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.overs
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.maidenOver
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.runs
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.wickets
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.economyRate
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
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
                                              const Divider(
                                                thickness: 0.8,
                                              ),
                                            ],
                                          )),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
                Obx(
                  () => startmatch.scorebordbool2.isFalse
                      ? Center(
                          child: SizedBox(),
                        )
                      : Container(
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      top: 7, bottom: 7, left: 10, right: 10),
                                  color: Colors.grey.shade300,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 7,
                                          child:
                                              Text("Batter", style: textbar)),
                                      Expanded(
                                          child: Text("R",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("B",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("4s",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("6s",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          flex: 2,
                                          child: Text("SR",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      // Icon(
                                      //   Icons.keyboard_arrow_right_rounded,
                                      //   color: Colors.transparent,
                                      // ),
                                      // Expanded(
                                      //     child: Text("",
                                      //             style: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontSize: 12))
                                      //        ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: List.generate(
                                      startmatch.scroreboard2.value.betsmens
                                              ?.length ??
                                          0, (index) {
                                    Betsmen? batsman = startmatch
                                        .scroreboard2.value.betsmens?[index];
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                      },
                                      child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10,
                                                    left: 10,
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 7,
                                                        child: Text(
                                                            "${batsman?.betsmens?.playerName} ${batsman?.outStatusLabel == "not out" ? "*" : ""}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.run
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.balls
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.fours
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.sixers
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            batsman?.strikeRate
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10,
                                                      left: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                          "${batsman?.outStatusLabel}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12))
                                                      .paddingOnly(
                                                          top: 4, bottom: 4)),
                                              const Divider(
                                                thickness: 0.8,
                                                height: 0,
                                              ),
                                            ],
                                          )),
                                    );
                                  }),
                                ),
                                const Divider(
                                  thickness: 0.25,
                                  height: 0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Extras",
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text(
                                                startmatch.indextab.value == 0
                                                    ? "${startmatch.matchlive.value.team1ExtraRun}"
                                                    : "${startmatch.matchlive.value.team2ExtraRun}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                " b ${startmatch.scroreboard.value.extra?.ball}, by ${startmatch.scroreboard.value.extra?.by}, lb ${startmatch.scroreboard.value.extra?.lb}, wd ${startmatch.scroreboard.value.extra?.wb}, nd ${startmatch.scroreboard.value.extra?.nb}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        )
                                      ],
                                    ).paddingOnly(right: 4),
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.25,
                                  height: 0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5, bottom: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 3,
                                          child: Text("Total",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Text(
                                        startmatch.indextab.value == 0
                                            ? "${startmatch.matchlive.value.team1TotalRun}-${startmatch.matchlive.value.team1TotalWickets} (${startmatch.matchlive.value.team1TotalOver})"
                                            : "${startmatch.matchlive.value.team2TotalRun}-${startmatch.matchlive.value.team2TotalWickets} (${startmatch.matchlive.value.team2TotalOver})",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "CRR  ${startmatch.indextab.value == 0 ? startmatch.scroreboard.value.data?.team1Crr : startmatch.scroreboard.value.data?.team2Crr}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.25,
                                  height: 0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),
                                  color: Colors.grey.shade300,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 7,
                                          child:
                                              Text("Bowler", style: textbar)),
                                      Expanded(
                                          child: Text("O",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("M",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("R",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          child: Text("W",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                      Expanded(
                                          flex: 2,
                                          child: Text("ER",
                                              textAlign: TextAlign.center,
                                              style: textbar)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: List.generate(
                                      startmatch.scroreboard2.value.bawlers
                                              ?.length ??
                                          0, (index) {
                                    Bawler? bowler = startmatch
                                        .scroreboard2.value.bawlers?[index];
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                      },
                                      child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10,
                                                    left: 10,
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 7,
                                                        child: Text(
                                                            bowler?.bowler
                                                                    ?.playerName ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.overs
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.maidenOver
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.runs
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
                                                    Expanded(
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.wickets
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            bowler?.economyRate
                                                                    .toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12))),
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
                                              const Divider(
                                                thickness: 0.8,
                                              ),
                                            ],
                                          )),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
