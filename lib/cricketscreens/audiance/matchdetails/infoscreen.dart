import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:yarn_modified/cricketscreens/admin/match/startmatch/tossscreen.dart';
import 'package:yarn_modified/cricketscreens/audiance/matchdetails/cricketdetailscreen.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../helper.dart';
import '../../../services/all_api_services.dart';
import '../../../services/app_url.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../admin/match/startmatch/openingplayers.dart';
import '../../admin/match/startmatch/runinputscreen.dart';
import '../../getx/screenshotcontroller.dart';
import '../../getx/startmatchcontroller.dart';
import '../../model/matchlivedetailsresponse.dart';
import '../../photoscreen.dart';
import '../../superoverinfoscreen.dart';

class InfoScreen extends StatefulWidget {
  final int isadmin;
  final Matchinfo? match;
  const InfoScreen({super.key, this.isadmin = 0, this.match});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  StartMatchController startmatch = Get.put(StartMatchController());
  screenshotcontrol screenshot = Get.put(screenshotcontrol());
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
    startmatch.matchInfoDetailFromAPI(
        tournamentid: widget.match?.tournamentId.toString() ?? "",
        matchid: widget.match?.id.toString() ?? "");
  }

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        Screenshot(
                          controller: screenshot.screenshotController,
                          child: Column(
                            children: [
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
                                                  widget.match?.team1
                                                          ?.shortName ??
                                                      "",
                                                  style: TextStyle(
                                                      color: startmatch
                                                                  .matchlive
                                                                  .value
                                                                  .winningTeamId ==
                                                              startmatch
                                                                  .matchlive
                                                                  .value
                                                                  .team1
                                                                  ?.id
                                                          ? Colors.black
                                                          : startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .bettingTeamId ==
                                                                  startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .team1
                                                                      ?.id
                                                              ? Colors.black
                                                              : Colors.grey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            startmatch.matchlive.value
                                                        .team1TotalOver ==
                                                    null
                                                ? Text(
                                                    textAlign: TextAlign.center,
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                : Row(
                                                    children: [
                                                      Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "${startmatch.matchlive.value.team1Runs}-${startmatch.matchlive.value.team1TotalWickets}",
                                                        style: TextStyle(
                                                            color: startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .winningTeamId ==
                                                                    startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .team1
                                                                        ?.id
                                                                ? Colors.black
                                                                : startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .bettingTeamId ==
                                                                        startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .team1
                                                                            ?.id
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        " (${startmatch.matchlive.value.team1TotalOver})",
                                                        style: TextStyle(
                                                            color: startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .winningTeamId ==
                                                                    startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .team1
                                                                        ?.id
                                                                ? Colors.black
                                                                : startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .bettingTeamId ==
                                                                        startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .team1
                                                                            ?.id
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        child: startmatch
                                                                    .matchlive
                                                                    .value
                                                                    .team1
                                                                    ?.id ==
                                                                startmatch
                                                                    .matchlive
                                                                    .value
                                                                    .bettingTeamId
                                                            ? startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .isPowerPlay ==
                                                                    1
                                                                ? Text(" P")
                                                                : SizedBox()
                                                            : SizedBox(),
                                                      )
                                                    ],
                                                  ),
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
                                                  widget.match?.team2
                                                          ?.shortName ??
                                                      "",
                                                  style: TextStyle(
                                                      color: startmatch
                                                                  .matchlive
                                                                  .value
                                                                  .winningTeamId ==
                                                              startmatch
                                                                  .matchlive
                                                                  .value
                                                                  .team2
                                                                  ?.id
                                                          ? Colors.black
                                                          : startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .bettingTeamId ==
                                                                  startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .team2
                                                                      ?.id
                                                              ? Colors.black
                                                              : Colors.grey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            startmatch.matchlive.value
                                                        .team2TotalOver ==
                                                    null
                                                ? Text(
                                                    textAlign: TextAlign.center,
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                : Row(
                                                    children: [
                                                      Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "${startmatch.matchlive.value.team2Runs}-${startmatch.matchlive.value.team2TotalWickets}",
                                                        style: TextStyle(
                                                            color: startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .winningTeamId ==
                                                                    startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .team2
                                                                        ?.id
                                                                ? Colors.black
                                                                : startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .bettingTeamId ==
                                                                        startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .team2
                                                                            ?.id
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        " (${startmatch.matchlive.value.team2TotalOver})",
                                                        style: TextStyle(
                                                            color: startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .winningTeamId ==
                                                                    startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .team2
                                                                        ?.id
                                                                ? Colors.black
                                                                : startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .bettingTeamId ==
                                                                        startmatch
                                                                            .matchlive
                                                                            .value
                                                                            .team2
                                                                            ?.id
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        child: startmatch
                                                                    .matchlive
                                                                    .value
                                                                    .team2
                                                                    ?.id ==
                                                                startmatch
                                                                    .matchlive
                                                                    .value
                                                                    .bettingTeamId
                                                            ? startmatch
                                                                        .matchlive
                                                                        .value
                                                                        .isPowerPlay ==
                                                                    1
                                                                ? Text(" P")
                                                                : SizedBox()
                                                            : SizedBox(),
                                                      )
                                                    ],
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        startmatch.matchlive.value.summary ==
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
                                                            TextAlign.center,
                                                        "CRR   ${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1Crr ?? "0.00" : startmatch.matchlive.value.team2Crr ?? "0.00"}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade700,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      startmatch.matchlive.value
                                                                  .inningId ==
                                                              2
                                                          ? Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              "REQ  ${startmatch.requirerunrate}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            )
                                                          : SizedBox(),
                                                      startmatch.matchlive.value
                                                                  .inningId ==
                                                              2
                                                          ? Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              "Target :  ${startmatch.target}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade900,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          : SizedBox(),
                                                    ],
                                                  ),
                                                  startmatch.matchlive.value
                                                              .inningId ==
                                                          2
                                                      ? Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              "${startmatch.requirestatus}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: screenwidth(
                                                            context,
                                                            dividedby: 1.3),
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.start,
                                                          startmatch.matchlive
                                                              .value.summary
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Cricket_textColorSecondary,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
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
                                        startmatch.matchlive.value.playerstrick
                                                    ?.id ==
                                                null
                                            ? SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Card(
                                                      elevation: 4,
                                                      // margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),

                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10))),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    flex: 7,
                                                                    child: Text(
                                                                        "Batter(${startmatch.matchlive.value.bettingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})",
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "R",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "B",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "4s",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "6s",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    flex: 2,
                                                                    child: Text(
                                                                        "SR",
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
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            right:
                                                                                8,
                                                                            left:
                                                                                8,
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Expanded(
                                                                                flex: 7,
                                                                                child: Text("${startmatch.matchlive.value.playerstrick?.playerName}  🏏", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.run.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.balls.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.fours.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.sixers.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                            Expanded(
                                                                                flex: 2,
                                                                                child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.stickerScore?.strikeRate.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const Divider(
                                                                        thickness:
                                                                            0.8,
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                                                              },
                                                              child: Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            right:
                                                                                8,
                                                                            left:
                                                                                8,
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Expanded(
                                                                                flex: 7,
                                                                                child: Text(startmatch.matchlive.value.playerNonStricker?.playerName.toString() ?? "", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.run.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.balls.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.fours.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12)).paddingOnly(left: 4)),
                                                                            Expanded(child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.sixers.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12)).paddingOnly(left: 4)),
                                                                            Expanded(
                                                                                flex: 2,
                                                                                child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.strikeRate.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const Divider(
                                                                        thickness:
                                                                            0.8,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 10.0),
                                                                        child: Text(
                                                                            "Partnership   ${startmatch.partnershiprun} (${startmatch.partnershipball})",
                                                                            style: TextStyle(
                                                                                color: Colors.grey.shade700,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400)),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
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
                                        startmatch.matchlive.value.playerBowler
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
                                                    width: double.infinity,
                                                    child: Card(
                                                      elevation: 4,
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          right: 15,
                                                          bottom: 0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10))),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    flex: 7,
                                                                    child: Text(
                                                                        "Bowler(${startmatch.matchlive.value.bowlingTeamId == startmatch.matchlive.value.team1?.id ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName})",
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "O",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "M",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "R",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    child: Text(
                                                                        "W",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            textbar)),
                                                                Expanded(
                                                                    flex: 2,
                                                                    child: Text(
                                                                        "ER",
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
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              8,
                                                                          left:
                                                                              8,
                                                                          top:
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                              flex: 7,
                                                                              child: Text(startmatch.matchlive.value.playerBowler?.playerName ?? "", style: TextStyle(color: Colors.grey.shade700, fontSize: 12))),
                                                                          Expanded(
                                                                              child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.overs.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                          Expanded(
                                                                              child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.maidenOver.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                          Expanded(
                                                                              child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.runs.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                          Expanded(
                                                                              child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.wickets.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                          Expanded(
                                                                              flex: 2,
                                                                              child: Text(textAlign: TextAlign.center, startmatch.matchlive.value.bowlerScore?.economyRate.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 12))),
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
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12,
                                                                    vertical:
                                                                        0),
                                                            width: screenwidth(
                                                                context,
                                                                dividedby: 1),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 8,
                                                                  child: Wrap(
                                                                    runSpacing:
                                                                        10,
                                                                    spacing: 10,
                                                                    children: List.generate(
                                                                        startmatch
                                                                            .balls
                                                                            .length,
                                                                        (index) {
                                                                      Ball
                                                                          ball =
                                                                          startmatch
                                                                              .balls[index];
                                                                      return Container(
                                                                        width: screenwidth(
                                                                            context,
                                                                            dividedby:
                                                                                13),
                                                                        height: screenwidth(
                                                                            context,
                                                                            dividedby:
                                                                                13),
                                                                        // padding: EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
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
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            ball.balltag ??
                                                                                "",
                                                                            style: TextStyle(
                                                                                fontSize: ball.balltag?.length == 1 ? screenwidth(context, dividedby: 30) : screenwidth(context, dividedby: 35),
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w500),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "= ${startmatch.overrun}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54),
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
                                                ],
                                              ),
                                      ],
                                    ),
                              startmatch.matchlive.value.playerofthematch?.id ==
                                      null
                                  ? startmatch.matchlive.value.inningId == 4
                                      ? widget.isadmin == 1
                                          ? Card(
                                              margin: EdgeInsets.only(
                                                  left: 15, right: 15, top: 15),
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 8),
                                                  width: screenwidth(context,
                                                      dividedby: 1),
                                                  // height: 30,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Player of the match",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14),
                                                      ),
                                                      Visibility(
                                                        visible:
                                                            widget.isadmin == 1
                                                                ? true
                                                                : false,
                                                        child: InkWell(
                                                            onTap: () {
                                                              playerofthematchSheet();
                                                            },
                                                            child: Icon(
                                                              Icons.edit,
                                                              size: 20,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: kwhite,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
                                                          child: Row(
                                                            children: [
                                                              PhotoScreencric(
                                                                  dobbn: 30,
                                                                  image: URLs
                                                                          .image_url_player +
                                                                      "${startmatch.matchlive.value.playerofthematch?.logo}"),
                                                              SizedBox(
                                                                  width: 20),
                                                              Container(
                                                                width: screenwidth(
                                                                    context,
                                                                    dividedby:
                                                                        2.45),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "${startmatch.matchlive.value.playerofthematch?.playerName}",
                                                                      style: TextStyle(
                                                                          color:
                                                                              kblack,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            8),
                                                                    Text(
                                                                      "${startmatch.matchlive.value.playerOfTheMatchTeam ?? "CSK"}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade500,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              14),
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
                                                              dividedby: 4),
                                                          width: screenwidth(
                                                              context,
                                                              dividedby: 4),
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
                          ),
                        ),
                        startmatch.matchSuperOverList.length > 0
                            ? Column(
                                children: List.generate(
                                    startmatch.matchSuperOverList.length,
                                    (index) {
                                Matchinfo match =
                                    startmatch.matchSuperOverList[index];

                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    print(startmatch
                                        .matchSuperOverList[index].id);

                                    Get.to(SuperOverInfoScreen(
                                        match: startmatch
                                            .matchSuperOverList[index],
                                        isadmin: widget.isadmin,
                                        superover: index + 1));
                                  },
                                  child: Container(
                                    // height: 200,
                                    margin: EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    child: Card(
                                      elevation: 4,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 8),
                                            width: screenwidth(context,
                                                dividedby: 1),
                                            // height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    topLeft:
                                                        Radius.circular(10))),
                                            child: Text(
                                              "Super Over ${index + 1}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
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
                                                                          dobbn:
                                                                              18,
                                                                          image:
                                                                              URLs.image_url_team + "${widget.match?.team1?.logo}"),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        widget.match?.team1?.shortName ??
                                                                            "",
                                                                        style: TextStyle(
                                                                            color:
                                                                                // startmatch
                                                                                //             .matchlive
                                                                                //             .value
                                                                                //             .summary !=
                                                                                //         null
                                                                                //     ? startmatch
                                                                                //                 .matchlive
                                                                                //                 .value
                                                                                //                 .wonteamid ==
                                                                                //             startmatch
                                                                                //                 .matchlive
                                                                                //                 .value
                                                                                //                 .team1
                                                                                //                 ?.id
                                                                                //         ? Colors
                                                                                //             .black
                                                                                //         : Colors
                                                                                //             .grey
                                                                                //     : startmatch
                                                                                //                 .matchlive
                                                                                //                 .value
                                                                                //                 .bettingTeamId ==
                                                                                //             startmatch
                                                                                //                 .matchlive
                                                                                //                 .value
                                                                                //                 .team1
                                                                                //                 ?.id
                                                                                //         ? Colors
                                                                                //             .black
                                                                                //         :
                                                                                Colors.grey,
                                                                            fontSize: 18,
                                                                            fontWeight: FontWeight.w400),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  startmatch.matchlive.value
                                                                              .team1TotalOver ==
                                                                          null
                                                                      ? Text(
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          "",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      : Row(
                                                                          children: [
                                                                            Text(
                                                                              textAlign: TextAlign.center,
                                                                              "${match.team1Runs}-${match.team1TotalWickets}",
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
                                                                              textAlign: TextAlign.center,
                                                                              " (${match.team1TotalOver})",
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
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      PhotoScreencric(
                                                                          dobbn:
                                                                              18,
                                                                          image:
                                                                              URLs.image_url_team + "${widget.match?.team2?.logo}"),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        widget.match?.team2?.shortName ??
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
                                                                  match.team2TotalOver ==
                                                                          null
                                                                      ? Text(
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          "",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      : Row(
                                                                          children: [
                                                                            Text(
                                                                              textAlign: TextAlign.center,
                                                                              "${match.team2Runs}-${match.team2TotalWickets}",
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
                                                                              textAlign: TextAlign.center,
                                                                              " (${match.team2TotalOver})",
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
                                                                            ).paddingOnly(right: 20),
                                                                          ],
                                                                        )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: Colors.grey,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    match.summary == null
                                                        ? SizedBox()
                                                        : Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            width: screenwidth(
                                                                context,
                                                                dividedby: 1.5),
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              match.summary
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color:
                                                                      Cricket_textColorSecondary,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))
                            : SizedBox.shrink(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
        ),
        Obx(() => Visibility(
              visible: widget.isadmin == 1
                  ? startmatch.matchlive.value.isSuperOver == true
                      ? false
                      : (startmatch.matchlive.value.inningId ?? 0) > 3
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
