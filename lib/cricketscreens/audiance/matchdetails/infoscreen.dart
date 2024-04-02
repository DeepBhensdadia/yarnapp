import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/admin/match/startmatch/tossscreen.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';

import '../../../const/const.dart';
import '../../../constcolor.dart';
import '../../../helper.dart';
import '../../../services/all_api_services.dart';
import '../../../services/app_url.dart';
import '../../admin/match/startmatch/openingplayers.dart';
import '../../admin/match/startmatch/runinputscreen.dart';
import '../../getx/startmatchcontroller.dart';
import '../../model/getscroreboarddetails.dart';
import '../../model/matchlivedetailsresponse.dart';
import '../../photoscreen.dart';

class InfoScreen extends StatefulWidget {
  final int isadmin;
  final Matchinfo? match;
  const InfoScreen({super.key, this.isadmin = 0, this.match});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  StartMatchController startmatch = Get.put(StartMatchController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Column(
                    children: [
                      SizedBox(height: 5),
                      Container(
                        // height: 200,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        PhotoScreencric(
                                            dobbn: 18,
                                            image: URLs.image_url_team +
                                                "${widget.match?.team1?.logo}"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          widget.match?.team1?.shortName ?? "",
                                          style: TextStyle(
                                              color: startmatch.matchlive.value
                                                          .bettingTeamId ==
                                                      startmatch.matchlive.value
                                                          .team1?.id
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    startmatch.matchlive.value.team1TotalOver ==
                                            null
                                        ? Text(
                                            textAlign: TextAlign.center,
                                            "",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : Row(
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                "${startmatch.matchlive.value.team1TotalRun}-${startmatch.matchlive.value.team1TotalWickets}",
                                                style: TextStyle(
                                                    color: startmatch
                                                                .matchlive
                                                                .value
                                                                .bettingTeamId ==
                                                            startmatch.matchlive
                                                                .value.team1?.id
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                textAlign: TextAlign.center,
                                                " (${startmatch.matchlive.value.team1TotalOver})",
                                                style: TextStyle(
                                                    color: startmatch
                                                                .matchlive
                                                                .value
                                                                .bettingTeamId ==
                                                            startmatch.matchlive
                                                                .value.team1?.id
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ).paddingOnly(right: 20),
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        PhotoScreencric(
                                            dobbn: 18,
                                            image: URLs.image_url_team +
                                                "${widget.match?.team2?.logo}"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          widget.match?.team2?.shortName ?? "",
                                          style: TextStyle(
                                              color: startmatch.matchlive.value
                                                          .bettingTeamId ==
                                                      startmatch.matchlive.value
                                                          .team2?.id
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    startmatch.matchlive.value.team2TotalOver ==
                                            null
                                        ? Text(
                                            textAlign: TextAlign.center,
                                            "",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : Row(
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                "${startmatch.matchlive.value.team2TotalRun}-${startmatch.matchlive.value.team2TotalWickets}",
                                                style: TextStyle(
                                                    color: startmatch
                                                                .matchlive
                                                                .value
                                                                .bettingTeamId ==
                                                            startmatch.matchlive
                                                                .value.team2?.id
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                textAlign: TextAlign.center,
                                                " (${startmatch.matchlive.value.team2TotalOver})",
                                                style: TextStyle(
                                                    color: startmatch
                                                                .matchlive
                                                                .value
                                                                .bettingTeamId ==
                                                            startmatch.matchlive
                                                                .value.team2?.id
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ).paddingOnly(right: 20),
                                            ],
                                          )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                startmatch.matchlive.value.summary == null
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                "CRR   ${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1Crr ?? "0.00" : startmatch.matchlive.value.team2Crr ?? "0.00"}",
                                                style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                startmatch
                                                    .matchlive.value.summary
                                                    .toString(),
                                                style: TextStyle(
                                                    color:
                                                        Cricket_textColorSecondary,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                      (startmatch.matchlive.value.inningId ?? 0) > 3
                          ? SizedBox()
                          : Column(
                              children: [
                                startmatch.matchlive.value.playerstrick?.id ==
                                        null
                                    ? SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Card(
                                              elevation: 4,
                                              // margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),

                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10))),
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                            flex: 7,
                                                            child: Text(
                                                                "Batter(${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})",
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("R",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("B",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("4s",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("6s",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text("SR",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(children: [
                                                    InkWell(
                                                      onTap: () {
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                                      },
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            8,
                                                                        left: 8,
                                                                        top: 5),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                        flex: 7,
                                                                        child: Text(
                                                                            "${startmatch.matchlive.value.playerstrick?.playerName} *",
                                                                            style: TextStyle(
                                                                                color: Colors.grey.shade700,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400))),
                                                                    Expanded(
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.stickerScore?.run.toString() ??
                                                                                "",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.bold))),
                                                                    Expanded(
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.stickerScore?.balls.toString() ??
                                                                                "",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 12))),
                                                                    Expanded(
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.stickerScore?.fours.toString() ??
                                                                                "",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 12))),
                                                                    Expanded(
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.stickerScore?.sixers.toString() ??
                                                                                "",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 12))),
                                                                    Expanded(
                                                                        flex: 2,
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.stickerScore?.strikeRate.toString() ??
                                                                                "",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 12))),
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            8,
                                                                        left: 8,
                                                                        top: 5),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                        flex: 7,
                                                                        child: Text(
                                                                            startmatch.matchlive.value.playerNonStricker?.playerName.toString() ??
                                                                                "",
                                                                            style: TextStyle(
                                                                                color: Colors.grey.shade700,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400))),
                                                                    Expanded(
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.nonstickerScore?.run.toString() ??
                                                                                "",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.bold))),
                                                                    Expanded(
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.nonstickerScore?.balls.toString() ??
                                                                                "",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 12))),
                                                                    Expanded(
                                                                        child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.nonstickerScore?.fours.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))
                                                                            .paddingOnly(left: 4)),
                                                                    Expanded(
                                                                        child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.nonstickerScore?.sixers.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))
                                                                            .paddingOnly(left: 4)),
                                                                    Expanded(
                                                                        flex: 2,
                                                                        child: Text(
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            startmatch.matchlive.value.nonstickerScore?.strikeRate.toString() ??
                                                                                "",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 12))),
                                                                  ],
                                                                ),
                                                              ),
                                                              const Divider(
                                                                thickness: 0.8,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                                child: Text(
                                                                    "Partnership   10 (10)",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade700,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400)),
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
                                startmatch.matchlive.value.playerBowler?.id ==
                                        null
                                    ? SizedBox.shrink()
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Container(
                                            // height: 200,
                                            width: double.infinity,
                                            child: Card(
                                              elevation: 4,
                                              margin: EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10))),
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                            flex: 7,
                                                            child: Text(
                                                                "Bowler(${startmatch.matchlive.value.bowlingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})",
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("O",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("M",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("R",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            child: Text("W",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text("ER",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    textbar)),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                                    },
                                                    child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 8,
                                                                      left: 8,
                                                                      top: 5),
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Expanded(
                                                                      flex: 7,
                                                                      child: Text(
                                                                          startmatch.matchlive.value.playerBowler?.playerName ??
                                                                              "",
                                                                          style: TextStyle(
                                                                              color: Colors.grey.shade700,
                                                                              fontSize: 12))),
                                                                  Expanded(
                                                                      child: Text(
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          startmatch.matchlive.value.bowlerScore?.overs.toString() ??
                                                                              '',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12))),
                                                                  Expanded(
                                                                      child: Text(
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          startmatch.matchlive.value.bowlerScore?.maidenOver.toString() ??
                                                                              '',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12))),
                                                                  Expanded(
                                                                      child: Text(
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          startmatch.matchlive.value.bowlerScore?.runs.toString() ??
                                                                              '',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12))),
                                                                  Expanded(
                                                                      child: Text(
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          startmatch.matchlive.value.bowlerScore?.wickets.toString() ??
                                                                              '',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.bold))),
                                                                  Expanded(
                                                                      flex: 2,
                                                                      child: Text(
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          startmatch.matchlive.value.bowlerScore?.economyRate.toString() ??
                                                                              '',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
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
                                                          ],
                                                        )),
                                                  ),
                                                  Divider(),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 0),
                                                    width: screenwidth(context,
                                                        dividedby: 1),
                                                    child: Wrap(
                                                      runSpacing: 10,
                                                      spacing: 10,
                                                      children: List.generate(
                                                          startmatch.balls
                                                              .length, (index) {
                                                        Ball ball = startmatch
                                                            .balls[index];
                                                        return Container(
                                                          width: 30,
                                                          height: 30,
                                                          // padding: EdgeInsets.all(10),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: ball.outType ==
                                                                    null
                                                                ? ball.ballType ==
                                                                        "normal"
                                                                    ? ball.run ==
                                                                            6
                                                                        ? Colors
                                                                            .green
                                                                        : ball.run ==
                                                                                4
                                                                            ? Colors
                                                                                .blue
                                                                            : Colors
                                                                                .black45
                                                                    : Colors
                                                                        .orange
                                                                : Colors.red,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              ball.outType ==
                                                                      null
                                                                  ? ball.ballType ==
                                                                          "normal"
                                                                      ? "${ball.run}"
                                                                      : ball.run ==
                                                                              0
                                                                          ? "${ball.ballType}"
                                                                          : "${ball.ballType}${ball.run}"
                                                                  : ball.run ==
                                                                          0
                                                                      ? "W"
                                                                      : "W${ball.run}",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                      Container(
                        // height: 200,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                width: screenwidth(context, dividedby: 1),
                                // height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: Text(
                                  "Match Details",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text(
                                    //     "Match Info",
                                    //     style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.w500,
                                    //     ),
                                    //   ),
                                    // ),

                                    textlines(
                                        text1: "Tournament Name",
                                        text2:
                                            "${widget.match?.tournament?.tournamentName}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Match Address",
                                        text2: "${widget?.match?.venue}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Date",
                                        text2:
                                            "${widget.match?.matchdateformat()}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Time",
                                        text2:
                                            "${widget.match?.matchtimeformat()}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Match Type",
                                        text2: "${widget.match?.matchType}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Umpire",
                                        text2: "${widget.match?.umpires}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Overs",
                                        text2: "${widget.match?.overseas}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Toss",
                                        text2:
                                            "${startmatch.matchlive.value.inningId == 0 ? "------" : startmatch.matchlive.value.tossstatus}"),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Ball Type",
                                        text2:
                                            "${widget.match?.tournament?.ballType}"),  
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 25,
                                    ),
                                    textlines(
                                        text1: "Match code",
                                        text2:
                                            "m=${widget.match?.id}, t=${widget.match?.tournament?.id}, uid=${saveUser()?.id}, t1=${widget.match?.team1?.id}, t2=${widget.match?.team2?.id}"),
                                  ],
                                ),
                              ),
                            ],
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
        Obx(() => Visibility(
              visible: widget.isadmin == 1
                  ? (startmatch.matchlive.value.inningId ?? 0) > 3
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
                  if (startmatch.matchlive.value.stickerScore?.playerId ==
                      null) {
                    if (startmatch.matchlive.value.toss == null) {
                      Get.to(TossScreen(match: widget.match!));
                    } else if ((startmatch.matchlive.value.inningId ?? 0) > 2) {
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
                      startmatch.matchlive.value.buttonLabel ?? "Start Match",
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
