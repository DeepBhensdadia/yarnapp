import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/cricketscreens/model/matchlivedetailssuperoverresponse.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';

import '../../../../const/themes.dart';
import '../../../../constcolor.dart';
import '../../../../services/app_url.dart';
import '../../../getx/startmatchcontroller.dart';
import '../../../photoscreen.dart';
import 'openingplayers.dart';
import 'runinputscreen.dart';

class TossScreen extends StatefulWidget {
  final Matchinfo match;
  const TossScreen({super.key, required this.match});

  @override
  State<TossScreen> createState() => _TossScreenState();
}

class _TossScreenState extends State<TossScreen> {
  StartMatchController startmatch = Get.put(StartMatchController());
  int teamtoss = 3;
  int batselect = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.match.team1?.shortName} vs ${widget.match.team2?.shortName}',
              textScaleFactor: 1,
              style:
                  TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
          Expanded(
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
                          "Who won the toss?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      2,
                      (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              teamtoss = index;
                            });
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 3,
                                      color: teamtoss == index
                                          ? MyTheme.appBarColor
                                          : Colors.transparent)),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    index == 0
                                        ? "${widget.match.team1?.shortName}"
                                        : "${widget.match.team2?.shortName}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Winner of the toss elected to?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      2,
                      (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              batselect = index;
                            });
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 3,
                                      color: batselect == index
                                          ? MyTheme.appBarColor
                                          : Colors.transparent)),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    radius: 35,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    index == 0 ? "Bat" : "Bowl",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (teamtoss != 3 && batselect != 3) {
                startmatch
                    .tossdetailFromAPI(
                        wonteamid: teamtoss == 0
                            ? widget.match.team1?.id.toString() ?? ""
                            : widget.match.team2?.id.toString() ?? "",
                        matchid: widget.match.id.toString(),
                        tosselect: batselect == 0 ? "Bat" : "Bowl")
                    .then((value) => Get.off(
                        OpeningPlayers(match: startmatch.matchlive.value)));
              } else {
                FlutterToast.showCustomToast(
                    "Please Selcet Team And Bat or Bowl");
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
