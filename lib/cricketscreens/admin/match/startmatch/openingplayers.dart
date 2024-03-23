import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';
import 'package:yarn_modified/widgets/tournamenttextfield.dart';
import '../../../getx/startmatchcontroller.dart';
import '../../../model/matchlivedetailsresponse.dart';
import 'runinputscreen.dart';

class OpeningPlayers extends StatefulWidget {
  final MatchLive match;
  const OpeningPlayers({super.key, required this.match});

  @override
  State<OpeningPlayers> createState() => _OpeningPlayersState();
}

class _OpeningPlayersState extends State<OpeningPlayers> {
  StartMatchController startmatch = Get.put(StartMatchController());

  @override
  void initState() {
    startmatch.strike.clear();
    startmatch.nonstrike.clear();
    startmatch.bowler.clear();
    // startmatch.matchlive.value = widget.match;
    startmatch.matchInfoDetailFromAPI(
        tournamentid: widget.match.tournament?.id.toString() ?? "",
        matchid: widget.match.id.toString() ?? "");

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
          '${widget.match.team1?.shortName} vs ${widget.match.team2?.shortName}',
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
          Obx(
            () => Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "${startmatch.batteam} - Batting ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Card(
                        // margin: EdgeInsets.all(15),
                        elevation: 2.5,
                        color: Colors.white,
                        // shape: RoundedRectangleBorder(borderRadius: defaultCardRadius),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              TournamentDropdown(
                                // initialValue:
                                //    "",
                                count: startmatch.battingteam
                                    .where((p0) =>
                                        p0.playerId.toString() !=
                                        startmatch.nonstrike.text)
                                    .map((e) => DropdownMenuItem<String>(
                                        value: "${e.playerId}",
                                        child: Text("${e.player?.playerName}")))
                                    .toList(),
                                onchange: (p0) {
                                  startmatch.strike.text = p0.toString();
                                  setState(() {});
                                },
                                validator: (p0) {
                                  if (p0?.isEmpty ?? true) {
                                    return "Select striker";
                                  }
                                  return null;
                                },
                                lable: "Select striker",
                              ),
                              TournamentDropdown(
                                count: startmatch.battingteam
                                    .where((p0) =>
                                        p0.playerId.toString() !=
                                        startmatch.strike.text)
                                    .map((e) => DropdownMenuItem<String>(
                                        value: "${e.playerId}",
                                        child: Text("${e.player?.playerName}")))
                                    .toList(),
                                onchange: (p0) {
                                  startmatch.nonstrike.text = p0.toString();
                                  setState(() {});
                                },
                                validator: (p0) {
                                  if (p0?.isEmpty ?? true) {
                                    return "Select non-striker";
                                  }
                                  return null;
                                },
                                lable: "Select non-striker",
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "${startmatch.ballteam} - Bowling",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Card(
                        // margin: EdgeInsets.all(15),
                        elevation: 2.5,
                        color: Colors.white,
                        // shape: RoundedRectangleBorder(borderRadius: defaultCardRadius),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: TournamentDropdown(
                            // initialValue:
                            //     widget.matchdetail?.team2?.id.toString(),
                            count: startmatch.bowlingteam
                                //     .where((p0) =>
                                // p0.id.toString() !=
                                //     startmatch.strike.text)
                                .map((e) => DropdownMenuItem<String>(
                                    value: "${e.playerId}",
                                    child: Text("${e.player?.playerName}")))
                                .toList(),
                            onchange: (p0) {
                              startmatch.bowler.text = p0.toString();
                              setState(() {});
                            },
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return "Select bowler";
                              }
                              return null;
                            },
                            lable: "Select bowler",
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (startmatch.strike.text.isNotEmpty &&
                  startmatch.nonstrike.text.isNotEmpty &&
                  startmatch.bowler.text.isNotEmpty) {
                startmatch.Playeraddinpeach(
                  matchid: widget.match.id.toString(),
                  tournamentid: widget.match.tournament?.id.toString() ?? "",
                  battingteamid:
                      startmatch.matchlive.value.bettingTeamId.toString() ?? "",
                  bowlingteamid:
                      startmatch.matchlive.value.bowlingTeamId.toString(),
                );
                Get.off(RunInputScreen(match: startmatch.matchlive.value));
              } else {
                FlutterToast.showCustomToast("Please Select Player");
              }
            },
            child: Container(
              height: 50,
              color: darkBlue,
              child: Center(
                child: Text(
                  "Start Match",
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
    );
  }
}
