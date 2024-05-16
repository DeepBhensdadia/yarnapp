import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/cricketscreens/model/matchlivedetailsresponse.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/widgets/tournamenttextfield.dart';

import '../../../../const/const.dart';
import '../../../../const/themes.dart';
import '../../../../services/app_url.dart';
import '../../../getx/startmatchcontroller.dart';
import '../../../photoscreen.dart';

class RunInputScreen extends StatefulWidget {
  final MatchLive match;
  const RunInputScreen({super.key, required this.match});

  @override
  State<RunInputScreen> createState() => _RunInputScreenState();
}

class _RunInputScreenState extends State<RunInputScreen> {
  StartMatchController startmatch = Get.put(StartMatchController());

  @override
  void initState() {
    // startmatch.isnewtap.value = false;
    super.initState();
  }

  Widget buildMaterialButton(
    String input,
    void Function() onTap, {
    Color? color, // Making the color parameter optional
    // Making the onTap function optional
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color ??
              Colors
                  .white, // Using the passed color if available, otherwise defaulting to white
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Text(
              input, // Removed unnecessary quotes around input
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenwidth(context, dividedby: 22),
                  color: input == "undo"
                      ? Colors.black
                      : color != null
                          ? Colors.white
                          : Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }

  outwarningdetails(void Function()? ontap) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade300,
            title: Text(
              "Out",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            content: Text(
              "Are you sure the batsman is out?",
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            ),
            actions: <Widget>[
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white70),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              SizedBox(
                width: 0,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white70),
                  ),
                  onPressed: ontap,
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          );
        });
  }

  runapi(
      {required String run,
      String? balltype,
      String? outtype,
      String? outbyplayerid,
      String? noballtype,
      String? outplayerid,
      String? isballcount}) {
    startmatch.runaddFromAPI(
        isballcount: isballcount ?? "1",
        noballtype: noballtype.toString(),
        battingteamid: startmatch.matchlive.value.bettingTeamId.toString(),
        bowlingteamid: startmatch.matchlive.value.bowlingTeamId.toString(),
        outtype: outtype ?? "",
        outbyplayerid: outbyplayerid ?? "",
        strikerid:
            startmatch.matchlive.value.stickerScore?.playerId.toString() ?? "",
        nonstrikerid:
            startmatch.matchlive.value.nonstickerScore?.playerId.toString() ??
                "",
        tournamentid:
            startmatch.matchlive.value.tournament?.id.toString() ?? "",
        matchid: startmatch.matchlive.value.id?.toString() ?? "",
        run: run,
        balltype: balltype ?? "normal",
        bowlerid: startmatch.matchlive.value.bowlerId.toString() ?? "",
        over: "1",
        ballnumber: "2",
        outplayerid: outplayerid ?? "");
  }

  List<String> breakreason = [
    "Innings Break",
    "Drinks Break",
    "Tea Break",
    "Lunch Break",
    "Dinner Break",
    "Rain Break",
    "Injury Break",
    "Strategic Timeout",
    "Other"
  ];

  int nbtotalrun = 1;
  bool iswicket = false;
  bool isballcount = true;
  int selectindextype = 1;
  String outplayerid = "0";
  String no_ball_type = "bat";
  String outbyplayerid = "0";

  bool validationaf(int popupid) {
    if (iswicket) if ((popupid == 1 || popupid == 3 || popupid == 4) &&
        (outplayerid.isEmpty || outbyplayerid.isEmpty)) {
      FlutterToast.showCustomToast(
          "Both Run Out Batsman and Run Out by Whom are required.");
      return false;
    } else if (popupid == 2) {
      // For popupid 2, check selected index
      if (selectindextype == 0) {
        // If selected index is 0, outbyplayerid is required (for stumped)
        if (outbyplayerid.isEmpty) {
          FlutterToast.showCustomToast(
              "For Wide Ball, Stumped Player is required.");

          return false;
        }
      } else if (selectindextype == 1) {
        // If selected index is 1, both outplayerid and outbyplayerid are required
        if (outplayerid.isEmpty || outbyplayerid.isEmpty) {
          FlutterToast.showCustomToast(
              "For Wide Ball, both Run Out Batsman and Run Out by Whom are required.");
          return false;
        }
      }
    }
    // If validation passes, return trueu
    return true;
  }

  Noballsheet({required int popupid}) async {
    List type = ["bat", "byes", "legbyes"];
    nbtotalrun = popupid == 1 || popupid == 2 ? 1 : 0;
    selectindextype = 1;
    outplayerid = "";
    outbyplayerid = "";
    iswicket = false;
    runoutrun.text = "0";
    startmatch.bowlingteamPlayerListFromAPI(
        teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "");
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  popupid == 1
                                      ? "No Ball"
                                      : popupid == 2
                                          ? "Wide Ball"
                                          : popupid == 3
                                              ? "Bye"
                                              : "Leg Bye",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  popupid == 1
                                      ? "NB"
                                      : popupid == 2
                                          ? "WD"
                                          : popupid == 3
                                              ? "BYE"
                                              : "LB",
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                popupid == 1 || popupid == 2
                                    ? Row(
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 45,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Center(
                                                child: Text("1",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                                const SizedBox(
                                  width: 10,
                                ),
                                popupid == 2
                                    ? Container(
                                        height: 45,
                                        width: 45,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: selectindextype == 1
                                              ? Pinput(
                                                  controller: runoutrun,
                                                  length: 1,
                                                  defaultPinTheme: PinTheme(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 6),
                                                    width: 56,
                                                    height: 56,
                                                    textStyle: const TextStyle(
                                                      fontSize: 22,
                                                      color: Color.fromRGBO(
                                                          30, 60, 87, 1),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    nbtotalrun = popupid == 1 ||
                                                            popupid == 2
                                                        ? 1
                                                        : 0;
                                                    nbtotalrun = nbtotalrun +
                                                        int.parse(value);
                                                    setState(() {});
                                                  },
                                                )
                                              : SizedBox(),
                                        ),
                                      )
                                    : Container(
                                        height: 45,
                                        width: 45,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Pinput(
                                            controller: runoutrun,
                                            length: 1,
                                            defaultPinTheme: PinTheme(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                              width: 56,
                                              height: 56,
                                              textStyle: const TextStyle(
                                                fontSize: 22,
                                                color: Color.fromRGBO(
                                                    30, 60, 87, 1),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              nbtotalrun =
                                                  popupid == 1 || popupid == 2
                                                      ? 1
                                                      : 0;
                                              nbtotalrun =
                                                  nbtotalrun + int.parse(value);
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "=",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${nbtotalrun}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (popupid == 1)
                          if (nbtotalrun > 1)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TournamentDropdown(
                                initialValue: no_ball_type,
                                count: type
                                    .map((e) => DropdownMenuItem<String>(
                                        value: "${e}", child: Text("${e}")))
                                    .toList(),
                                onchange: (p0) {
                                  no_ball_type = p0.toString();
                                  setState(() {});
                                },
                                validator: (p0) {
                                  if (p0?.isEmpty ?? true) {
                                    return "Runs from No Ball";
                                  }
                                  return null;
                                },
                                lable: "Runs from No Ball",
                              ),
                            ),
                        Row(
                          children: [
                            Checkbox(
                              value: iswicket,
                              onChanged: (value) {
                                setState(() {
                                  selectindextype = 1;
                                  iswicket = !iswicket;
                                });
                              },
                            ),
                            Text(
                              "Is Wicket on ${popupid == 1 ? "No Ball" : popupid == 2 ? "Wide" : popupid == 3 ? "Bye" : "Leg Bye"}?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        !iswicket
                            ? SizedBox()
                            : popupid == 2
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                          3,
                                          (index) => Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                nbtotalrun =
                                                    popupid == 1 || popupid == 2
                                                        ? 1
                                                        : 0;
                                                runoutrun.clear();
                                                setState(() {
                                                  selectindextype = index;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: selectindextype ==
                                                            index
                                                        ? Colors.greenAccent
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.grey)),
                                                child: Center(
                                                  child: Text(
                                                    index == 0
                                                        ? "Stumping"
                                                        : index == 1
                                                            ? "Runout"
                                                            : "hitwicket",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      selectindextype == 0
                                          ? Obx(
                                              () => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: TournamentDropdown(
                                                  // initialValue:
                                                  //     widget.matchdetail?.team2?.id.toString(),
                                                  count: startmatch.bowlingteam
                                                      .where((p0) =>
                                                          p0.id.toString() !=
                                                          startmatch
                                                              .matchlive
                                                              .value
                                                              .bowlerScore
                                                              ?.playerId
                                                              .toString())
                                                      .map((e) => DropdownMenuItem<
                                                              String>(
                                                          value:
                                                              "${e.playerId}",
                                                          child: Text(
                                                              "${e.player?.playerName}")))
                                                      .toList(),
                                                  onchange: (p0) {
                                                    outbyplayerid =
                                                        p0.toString();
                                                    setState(() {});
                                                  },
                                                  validator: (p0) {
                                                    if (p0?.isEmpty ?? true) {
                                                      return "Select Stumped Player";
                                                    }
                                                    return null;
                                                  },
                                                  lable: "Who Stumped?",
                                                ),
                                              ),
                                            )
                                          : selectindextype == 1
                                              ? Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0),
                                                      child: TournamentDropdown(
                                                        // initialValue:
                                                        //     widget.matchdetail?.team2?.id.toString(),
                                                        count: [
                                                          DropdownMenuItem<
                                                                  String>(
                                                              value:
                                                                  "${startmatch.matchlive.value.stickerScore?.playerId.toString()}",
                                                              child: Text(
                                                                  "${startmatch.matchlive.value.playerstrick?.playerName}")),
                                                          DropdownMenuItem<
                                                                  String>(
                                                              value:
                                                                  "${startmatch.matchlive.value.nonstickerScore?.playerId.toString()}",
                                                              child: Text(
                                                                  "${startmatch.matchlive.value.playerNonStricker?.playerName}"))
                                                        ],
                                                        onchange: (p0) {
                                                          outplayerid =
                                                              p0.toString();
                                                          setState(() {});
                                                        },
                                                        validator: (p0) {
                                                          if (p0?.isEmpty ??
                                                              true) {
                                                            return "Run Out Batsman?";
                                                          }
                                                          return null;
                                                        },
                                                        lable:
                                                            "Run Out Batsman?",
                                                      ),
                                                    ),
                                                    Obx(
                                                      () => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child:
                                                            TournamentDropdown(
                                                          // initialValue:
                                                          //     widget.matchdetail?.team2?.id.toString(),
                                                          count: startmatch
                                                              .bowlingteam
                                                              .where((p0) =>
                                                                  p0.id
                                                                      .toString() !=
                                                                  startmatch
                                                                      .matchlive
                                                                      .value
                                                                      .bowlerScore
                                                                      ?.playerId
                                                                      .toString())
                                                              .map((e) => DropdownMenuItem<
                                                                      String>(
                                                                  value:
                                                                      "${e.playerId}",
                                                                  child: Text(
                                                                      "${e.player?.playerName}")))
                                                              .toList(),
                                                          onchange: (p0) {
                                                            outbyplayerid =
                                                                p0.toString();
                                                            setState(() {});
                                                          },
                                                          validator: (p0) {
                                                            if (p0?.isEmpty ??
                                                                true) {
                                                              return "Run Out by Whom?";
                                                            }
                                                            return null;
                                                          },
                                                          lable:
                                                              "Run Out by Whom?",
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: TournamentDropdown(
                                          // initialValue:
                                          //     widget.matchdetail?.team2?.id.toString(),
                                          count: [
                                            DropdownMenuItem<String>(
                                                value:
                                                    "${startmatch.matchlive.value.stickerScore?.playerId.toString()}",
                                                child: Text(
                                                    "${startmatch.matchlive.value.playerstrick?.playerName}")),
                                            DropdownMenuItem<String>(
                                                value:
                                                    "${startmatch.matchlive.value.nonstickerScore?.playerId.toString()}",
                                                child: Text(
                                                    "${startmatch.matchlive.value.playerNonStricker?.playerName}"))
                                          ],
                                          onchange: (p0) {
                                            outplayerid = p0.toString();
                                            setState(() {});
                                          },
                                          validator: (p0) {
                                            if (p0?.isEmpty ?? true) {
                                              return "Run Out Batsman?";
                                            }
                                            return null;
                                          },
                                          lable: "Run Out Batsman?",
                                        ),
                                      ),
                                      Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: TournamentDropdown(
                                            // initialValue:
                                            //     widget.matchdetail?.team2?.id.toString(),
                                            count: startmatch.bowlingteam
                                                .where((p0) =>
                                                    p0.id.toString() !=
                                                    startmatch.matchlive.value
                                                        .bowlerScore?.playerId
                                                        .toString())
                                                .map((e) => DropdownMenuItem<
                                                        String>(
                                                    value: "${e.playerId}",
                                                    child: Text(
                                                        "${e.player?.playerName}")))
                                                .toList(),
                                            onchange: (p0) {
                                              outbyplayerid = p0.toString();
                                              setState(() {});
                                            },
                                            validator: (p0) {
                                              if (p0?.isEmpty ?? true) {
                                                return "Run Out by Whom?";
                                              }
                                              return null;
                                            },
                                            lable: "Run Out by Whom?",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Center(
                                      child: Text(
                                    "CANCEL",
                                    style: TextStyle(color: Colors.black),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15))),
                                height: 40,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (validationaf(popupid) ==
                                        true) if (!iswicket) {
                                      runapi(
                                        noballtype: no_ball_type,
                                        run: popupid == 1 || popupid == 2
                                            ? "${nbtotalrun - 1}"
                                            : "${nbtotalrun}",
                                        balltype: popupid == 1
                                            ? "nb"
                                            : popupid == 2
                                                ? "wb"
                                                : popupid == 3
                                                    ? "by"
                                                    : "lb",
                                      );
                                      Get.back();
                                    } else {
                                      runapi(
                                          noballtype: no_ball_type,
                                          run: popupid == 1 || popupid == 2
                                              ? "${nbtotalrun - 1}"
                                              : "${nbtotalrun}",
                                          balltype: popupid == 1
                                              ? "nb"
                                              : popupid == 2
                                                  ? "wb"
                                                  : popupid == 3
                                                      ? "by"
                                                      : "lb",
                                          outplayerid: selectindextype == 1 ||
                                                  popupid == 1
                                              ? outplayerid
                                              : startmatch.matchlive.value
                                                  .stickerPlayerId
                                                  .toString(),
                                          outbyplayerid: outbyplayerid,
                                          outtype: popupid == 2
                                              ? selectindextype == 0
                                                  ? "stumped"
                                                  : selectindextype == 1
                                                      ? "runout"
                                                      : "hitwicket"
                                              : "runout");
                                      Get.back();
                                      setState(() {
                                        runoutto =
                                            popupid != 2 || selectindextype == 1
                                                ? true
                                                : false;
                                      });
                                    }
                                  },
                                  child: const Center(
                                      child: Text("OK",
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }

  String nextbowlerid = "0";
  Overcompletesheet() async {
    startmatch.bowlingordernextFromAPI(
      teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "",
      matchid: startmatch.matchlive.value.id.toString(),
    );
    nextbowlerid = "0";
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "End of over by ${startmatch.matchlive.value.playerBowler?.playerName}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: kthemecolor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.clear)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: List.generate(4, (index) {
                          //     return Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(right: 2.5),
                          //         child: Column(
                          //           children: [
                          //             Container(
                          //               color: Colors.grey,
                          //               height: 35,
                          //               child: Center(
                          //                   child: Text(
                          //                 index == 0
                          //                     ? "18"
                          //                     : index == 1
                          //                         ? "1"
                          //                         : index == 2
                          //                             ? "0"
                          //                             : "3",
                          //                 style: const TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold),
                          //               )),
                          //             ),
                          //             const SizedBox(
                          //               height: 5,
                          //             ),
                          //             Center(
                          //                 child: Text(
                          //               index == 0
                          //                   ? "Runs"
                          //                   : index == 1
                          //                       ? "Overs"
                          //                       : index == 2
                          //                           ? "Wickets"
                          //                           : "Extras",
                          //               style: const TextStyle(
                          //                   color: Colors.black54,
                          //                   fontSize: 10,
                          //                   fontWeight: FontWeight.bold),
                          //             ))
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   }),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const Align(
                          //     alignment: AlignmentDirectional.centerStart,
                          //     child: Text(
                          //       "End of over 1 by Cricketer",
                          //       textAlign: TextAlign.start,
                          //       style: TextStyle(
                          //           color: Colors.black54,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 12),
                          //     )),
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 0),
                                  // width: screenwidth(context,
                                  //     dividedby: 1),
                                  child: Wrap(
                                    runSpacing: 10,
                                    spacing: 10,
                                    children: List.generate(
                                        startmatch.balls.length, (index) {
                                      Ball ball = startmatch.balls[index];
                                      return Container(
                                        width: 30,
                                        height: 30,
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
                                            style: TextStyle(
                                                fontSize:
                                                    ball.balltag?.length == 1
                                                        ? screenwidth(context,
                                                            dividedby: 30)
                                                        : screenwidth(context,
                                                            dividedby: 35),
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "= ${startmatch.overrun}",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => TournamentDropdown(
                              // initialValue:
                              //     widget.matchdetail?.team2?.id.toString(),
                              count: startmatch.bowlingordernext
                                  .map((e) => DropdownMenuItem<String>(
                                      value: "${e.playerId}",
                                      child: Text("${e.player?.playerName}")))
                                  .toList(),
                              onchange: (p0) {
                                nextbowlerid = p0.toString();
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
                          ),

                          Row(
                            children: [
                            Obx(() =>   Checkbox(
                              value: startmatch.ispowerplay.value,
                              onChanged: (value) {
                                startmatch.ispowerplay.value = !startmatch.ispowerplay.value;
                              },
                            ),),
                              Text(
                                "This Over is Powerplay ?",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(
                            height:10,
                          ),
                          Row(
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
                                      startmatch.matchundoo(
                                        touramentid: startmatch
                                                .matchlive.value.tournament?.id
                                                .toString() ??
                                            "",
                                        matchid: startmatch.matchlive.value.id
                                                ?.toString() ??
                                            "",
                                      );
                                    },
                                    child: const Center(
                                        child: Text(
                                      "Undoo",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.grey,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: () {
                                      bool valid =
                                          nextbowlerid == "0" ? false : true;
                                      if (!valid) {
                                        FlutterToast.showCustomToast(
                                            "Please assign next bowler");
                                      } else {
                                        startmatch.nextoverbowleradd(
                                            teamid: startmatch.matchlive.value
                                                    .bowlerScore?.teamId
                                                    .toString() ??
                                                "",
                                            tournamentid: startmatch.matchlive
                                                    .value.tournament?.id
                                                    .toString() ??
                                                "",
                                            matchid: startmatch
                                                    .matchlive.value.id
                                                    .toString() ??
                                                "",
                                            playerid: nextbowlerid);
                                      }
                                    },
                                    child: const Center(
                                        child: Text(
                                      "NEXT OVER",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 5),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           color: Colors.grey.shade300,
                    //           height: 40,
                    //           child: MaterialButton(
                    //             onPressed: () {},
                    //             child: Center(
                    //                 child: Text(
                    //               "CONTINUE THIS OVER",
                    //               style: TextStyle(color: kthemecolor),
                    //             )),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  InningsCompleteSheet() async {
    String team = startmatch.matchlive.value.bettingTeamId.toString() ==
            startmatch.matchlive.value.team1?.id.toString()
        ? "1"
        : "2";
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${startmatch.matchlive.value.inningId == 1 ? "First" : "Second"} innings completed",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: kthemecolor,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.clear))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                "End of innings for ${team == "1" ? startmatch.matchlive.value.team1?.shortName : startmatch.matchlive.value.team2?.shortName}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(4, (index) {
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2.5),
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          height: 35,
                                          child: Center(
                                              child: Text(
                                            index == 0
                                                ? "${team == "1" ? startmatch.matchlive.value.team1Runs.toString() : startmatch.matchlive.value.team2Runs.toString()}"
                                                : index == 1
                                                    ? "${team == "1" ? startmatch.matchlive.value.team1TotalOver.toString() : startmatch.matchlive.value.team2TotalOver.toString()}"
                                                    : index == 2
                                                        ? "${team == "1" ? startmatch.matchlive.value.team1TotalWickets.toString() : startmatch.matchlive.value.team2TotalWickets.toString()}"
                                                        : "${team == "1" ? startmatch.matchlive.value.team1ExtraRun.toString() : startmatch.matchlive.value.team2ExtraRun.toString()}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                            child: Text(
                                          index == 0
                                              ? "Runs"
                                              : index == 1
                                                  ? "Overs"
                                                  : index == 2
                                                      ? "Wickets"
                                                      : "Extras",
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    height: 40,
                                    child: MaterialButton(
                                      onPressed: () {
                                        // startmatch.isnewtap.value = true;

                                        startmatch.matchlive.value.inningId == 1
                                            ? startmatch.Firstinningcomplete(
                                                tournamentid: widget
                                                        .match.tournament?.id
                                                        .toString() ??
                                                    "",
                                                matchid: widget.match.id
                                                        .toString() ??
                                                    "").then((value) =>  startmatch.outplayer.value = 0)
                                            : startmatch.matchcomplete(
                                                tournamentid: widget
                                                        .match.tournament?.id
                                                        .toString() ??
                                                    "",
                                                matchid: widget.match.id
                                                        .toString() ??
                                                    "").then((value) =>  startmatch.outplayer.value = 0);
                                      },
                                      child: Center(
                                          child: Text(
                                        startmatch.matchlive.value.inningId == 1
                                            ? "Start Next Innings"
                                            : "Declare Winning Team",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Expanded(
                      //         child: Container(
                      //           color: Colors.grey.shade200,
                      //           height: 40,
                      //           child: MaterialButton(
                      //             color: Colors.grey.shade200,
                      //             onPressed: () {},
                      //             child: Center(
                      //                 child: Text(
                      //               "CONTINUE THIS OVER",
                      //               style: TextStyle(color: kthemecolor),
                      //             )),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String playercughtid = "";
  CaughtoutSheet() async {
    startmatch.bowlingteamPlayerListFromAPI(
        teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "");
    playercughtid = "";
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 15),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "What's the Caught player?",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: startmatch.bowlingteam
                              .where((p0) =>
                                  p0.id.toString() !=
                                  startmatch
                                      .matchlive.value.bowlerScore?.playerId
                                      .toString())
                              .map((e) => DropdownMenuItem<String>(
                                  value: "${e.playerId}",
                                  child: Text("${e.player?.playerName}")))
                              .toList(),
                          onchange: (p0) {
                            playercughtid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select Caught Player";
                            }
                            return null;
                          },
                          lable: "Who Caught?",
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
                                      playercughtid == "" ? false : true;
                                  if (!valid) {
                                    FlutterToast.showCustomToast(
                                        "Please select caught player");
                                  } else {
                                    runapi(
                                        run: "0",
                                        outtype: "caught",
                                        outbyplayerid: playercughtid,
                                        outplayerid: startmatch
                                            .matchlive.value.stickerPlayerId
                                            .toString());

                                    Get.back();
                                  }
                                  // newbatsmanaddSheet();
                                },
                                child: const Center(
                                    child: Text(
                                  "Confirm Out",
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

  bool runoutto = false;
  String playerStumpid = "";
  stumpoutSheet() async {
    playerStumpid = "";
    startmatch.bowlingteamPlayerListFromAPI(
        teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "");
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 15),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "What's the Caught player?",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: startmatch.bowlingteam
                              .where((p0) =>
                                  p0.id.toString() !=
                                  startmatch
                                      .matchlive.value.bowlerScore?.playerId
                                      .toString())
                              .map((e) => DropdownMenuItem<String>(
                                  value: "${e.playerId}",
                                  child: Text("${e.player?.playerName}")))
                              .toList(),
                          onchange: (p0) {
                            playerStumpid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select Caught Player";
                            }
                            return null;
                          },
                          lable: "Who Stumped?",
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
                                      playerStumpid == "" ? false : true;
                                  if (!valid) {
                                    FlutterToast.showCustomToast(
                                        "Please Select Stump Player");
                                  } else {
                                    runapi(
                                        run: "0",
                                        outtype: "stumped",
                                        outbyplayerid: playerStumpid,
                                        outplayerid: startmatch
                                            .matchlive.value.stickerPlayerId
                                            .toString());

                                    Get.back();
                                  }
                                  // newbatsmanaddSheet();
                                },
                                child: const Center(
                                    child: Text(
                                  "Confirm Out",
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

  String runoutplayerid = "";
  String runouthelperid = "";
  TextEditingController runoutrun = TextEditingController(text: "0");
  runoutoutSheet() async {
    runoutplayerid = "";
    runouthelperid = "";
    runoutrun.text = "0";
    startmatch.bowlingteamPlayerListFromAPI(
        teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "");
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10.0, vertical: 15),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         "runout?",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: [
                            DropdownMenuItem<String>(
                                value:
                                    "${startmatch.matchlive.value.stickerScore?.playerId.toString()}",
                                child: Text(
                                    "${startmatch.matchlive.value.playerstrick?.playerName}")),
                            DropdownMenuItem<String>(
                                value:
                                    "${startmatch.matchlive.value.nonstickerScore?.playerId.toString()}",
                                child: Text(
                                    "${startmatch.matchlive.value.playerNonStricker?.playerName}"))
                          ],
                          onchange: (p0) {
                            runoutplayerid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Run Out Batsman?";
                            }
                            return null;
                          },
                          lable: "Run Out Batsman?",
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TournamentDropdown(
                            // initialValue:
                            //     widget.matchdetail?.team2?.id.toString(),
                            count: startmatch.bowlingteam
                                .where((p0) =>
                                    p0.id.toString() !=
                                    startmatch
                                        .matchlive.value.bowlerScore?.playerId
                                        .toString())
                                .map((e) => DropdownMenuItem<String>(
                                    value: "${e.playerId}",
                                    child: Text("${e.player?.playerName}")))
                                .toList(),
                            onchange: (p0) {
                              runouthelperid = p0.toString();
                              setState(() {});
                            },
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return "Run Out by Whom?";
                              }
                              return null;
                            },
                            lable: "Run Out by Whom?",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "total run",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Pinput(
                                  controller: runoutrun,
                                  length: 1,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.deny(
                                        RegExp('[\\.]')),
                                  ],
                                  defaultPinTheme: PinTheme(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    width: 56,
                                    height: 56,
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      color: Color.fromRGBO(30, 60, 87, 1),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    runoutrun.text = value ?? "0";
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
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
                                    bool valid = runouthelperid.isEmpty ||
                                            runoutplayerid.isEmpty
                                        ? false
                                        : true;
                                    if (!valid) {
                                      FlutterToast.showCustomToast(
                                          "Please select player");
                                    } else {
                                      runapi(
                                          run: runoutrun.text,
                                          outtype: "runout",
                                          outbyplayerid: runouthelperid,
                                          outplayerid: runoutplayerid);
                                      Get.back();
                                      setState(() {
                                        runoutto = true;
                                      });
                                    }
                                  },
                                  child: const Center(
                                      child: Text(
                                    "Confirm Out",
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
                ),
              );
            },
          ),
        );
      },
    );
  }

  Outbottomsheet() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('bowled'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        runapi(
                            run: "0",
                            outtype: "bowled",
                            outbyplayerid: startmatch.matchlive.value.bowlerId
                                    .toString() ??
                                "",
                            outplayerid: startmatch
                                .matchlive.value.stickerPlayerId
                                .toString());
                        Get.back();
                        // newbatsmanaddSheet();
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text('caught'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        Get.back();
                        CaughtoutSheet();
                      },
                    );
                    // runapi(
                    //     run: "0",
                    //     outtype: "caught",
                    //     outtypeid: startmatch
                    //             .matchlive.value.bowlerScore?.playerId
                    //             .toString() ??
                    //         "",);
                    // Get.back();
                    // newbatsmanaddSheet();
                  },
                ),
                ListTile(
                  title: Text('stumped'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        Get.back();
                        stumpoutSheet();
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text('runout'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        Get.back();
                        runoutoutSheet();
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text('lbw'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        runapi(
                            run: "0",
                            outtype: "lbw",
                            outbyplayerid: startmatch.matchlive.value.bowlerId
                                    .toString() ??
                                "",
                            outplayerid: startmatch
                                .matchlive.value.stickerPlayerId
                                .toString());
                        Get.back();
                        // newbatsmanaddSheet();
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text('hitwicket'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        runapi(
                            run: "0",
                            outtype: "hitwicket",
                            // outtypeid: startmatch
                            //     .matchlive.value.bowlerScore?.playerId
                            //     .toString() ??
                            //     "",
                            outplayerid: startmatch
                                .matchlive.value.stickerPlayerId
                                .toString());
                        Get.back();
                        // newbatsmanaddSheet();
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text('Other'),
                  onTap: () {
                    Get.back();
                    outwarningdetails(
                      () {
                        Get.back();
                        otheroutoutSheet();
                        //
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String nextbatsmanid = "";
  bool newbatsmanonstrike = true;

  newbatsmanaddSheet() async {
    startmatch.battingordernextFromAPI(
        teamid:
            startmatch.matchlive.value.stickerScore?.teamId.toString() ?? "",
        matchid: startmatch.matchlive.value.id.toString());
    nextbatsmanid = "";
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 15),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Select New Player",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: startmatch.battingordernext
                              // .where((p0) =>
                              //     p0.playerId !=
                              //     startmatch
                              //         .matchlive.value.stickerScore?.playerId
                              //         .toString())
                              .map((e) => DropdownMenuItem<String>(
                                  value: "${e.playerId}",
                                  child: Text("${e.player?.playerName}")))
                              .toList(),
                          onchange: (p0) {
                            nextbatsmanid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select New Batsman";
                            }
                            return null;
                          },
                          lable: "Select New Batsman",
                          icon: startmatch.superoversis != "" ? true : false,
                        ),
                      ),
                    ),
                    runoutto == false
                        ? SizedBox.shrink()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    "New Batsman is on Strike?",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: kthemecolor),
                                  ),
                                ),
                                Switch(
                                  activeColor: kthemecolor,
                                  value: newbatsmanonstrike,
                                  onChanged: (value) {
                                    setState(() {
                                      newbatsmanonstrike = value;
                                    });
                                  },
                                )
                              ],
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
                          // Expanded(
                          //   child: Container(
                          //     color: Colors.grey,
                          //     height: 40,
                          //     child: MaterialButton(
                          //       onPressed: () {},
                          //       child: const Center(
                          //           child: Text(
                          //         "Cancel",
                          //         style: TextStyle(color: Colors.white),
                          //       )),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 15,
                          // ),
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                              height: 40,
                              child: MaterialButton(
                                onPressed: () {
                                  bool valid =
                                      nextbatsmanid == "" ? false : true;
                                  if (!valid) {
                                    FlutterToast.showCustomToast(
                                        "Please assign next batsman");
                                  } else {
                                    setState(() {
                                      runoutto = false;
                                    });
                                    startmatch
                                        .newbatsmanadd(
                                            isstrike: newbatsmanonstrike,
                                            teamid: startmatch
                                                .matchlive.value.bettingTeamId
                                                .toString(),
                                            tournamentid: startmatch.matchlive
                                                    .value.tournament?.id
                                                    .toString() ??
                                                "",
                                            matchid: startmatch
                                                    .matchlive.value.id
                                                    .toString() ??
                                                "",
                                            playerid: nextbatsmanid)
                                        .then((value) =>
                                            startmatch.outplayer.value = 0);
                                  }
                                },
                                child: const Center(
                                    child: Text(
                                  "Confirm Add",
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

  String replacenextbatsmanid = "";
  replacebatsmanaddSheet(int isstrike) async {
    startmatch.battingordernextFromAPI(
        teamid:
            startmatch.matchlive.value.stickerScore?.teamId.toString() ?? "",
        matchid: startmatch.matchlive.value.id.toString());
    replacenextbatsmanid = "";
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 15),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Select New Player",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: startmatch.battingordernext
                              // .where((p0) =>
                              //     p0.playerId !=
                              //     startmatch
                              //         .matchlive.value.stickerScore?.playerId
                              //         .toString())
                              .map((e) => DropdownMenuItem<String>(
                                  value: "${e.playerId}",
                                  child: Text("${e.player?.playerName}")))
                              .toList(),
                          onchange: (p0) {
                            replacenextbatsmanid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select New Batsman";
                            }
                            return null;
                          },
                          lable: "Replace New Batsman",
                        ),
                      ),
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
                                      replacenextbatsmanid == "" ? false : true;
                                  if (!valid) {
                                    FlutterToast.showCustomToast(
                                        "Please assign next batsman");
                                  } else {
                                    startmatch
                                        .replacebatsmanadd(
                                            oldplayerid: isstrike == 0
                                                ? startmatch.matchlive.value
                                                        .playerstrick?.id
                                                        .toString() ??
                                                    ""
                                                : startmatch.matchlive.value
                                                        .playerNonStricker?.id
                                                        .toString() ??
                                                    "",
                                            tournamentid: startmatch.matchlive
                                                    .value.tournament?.id
                                                    .toString() ??
                                                "",
                                            matchid: startmatch
                                                    .matchlive.value.id
                                                    .toString() ??
                                                "",
                                            playerid: replacenextbatsmanid)
                                        .then((value) =>
                                            startmatch.outplayer.value = 0);
                                  }
                                },
                                child: const Center(
                                    child: Text(
                                  "Confirm Add",
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

  String replacenextbowlerid = "";
  replacebowleraddSheet() async {
    startmatch.bowlingordernextFromAPI(
      teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "",
      matchid: startmatch.matchlive.value.id.toString(),
    );
    replacenextbowlerid = "";
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 15),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Select New Player",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: startmatch.bowlingordernext
                              // .where((p0) =>
                              //     p0.playerId !=
                              //     startmatch
                              //         .matchlive.value.stickerScore?.playerId
                              //         .toString())
                              .map((e) => DropdownMenuItem<String>(
                                  value: "${e.playerId}",
                                  child: Text("${e.player?.playerName}")))
                              .toList(),
                          onchange: (p0) {
                            replacenextbowlerid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select New Bowler";
                            }
                            return null;
                          },
                          lable: "Replace New Bowler",
                        ),
                      ),
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
                                      replacenextbowlerid == "" ? false : true;
                                  if (!valid) {
                                    FlutterToast.showCustomToast(
                                        "Please assign next batsman");
                                  } else {
                                    startmatch
                                        .replacebowleradd(
                                            oldplayerid: startmatch
                                                .matchlive.value.bowlerId
                                                .toString(),
                                            tournamentid: startmatch.matchlive
                                                    .value.tournament?.id
                                                    .toString() ??
                                                "",
                                            matchid: startmatch
                                                    .matchlive.value.id
                                                    .toString() ??
                                                "",
                                            playerid: replacenextbowlerid)
                                        .then((value) =>
                                            startmatch.outplayer.value = 0);
                                  }
                                },
                                child: const Center(
                                    child: Text(
                                  "Confirm Add",
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

  bool validationdeclare() {
    if (declareindex == 0) {
      if (teamtoss == 3 || startmatch.remark.text.isEmpty) {
        FlutterToast.showCustomToast(
            "Both Winning team and Remark are required.");
        return false;
      }
      return true;
    } else if (declareindex == 1 || declareindex == 2) {
      if (startmatch.remark.text.isEmpty) {
        FlutterToast.showCustomToast("Remark are required.");
        return false;
      }
      return true;
    }
    // If validation passes, return trueu
    return true;
  }

  int teamtoss = 3;
  int declareindex = 0;
  String playerofthematch = "";
  declaresheet(int iscomplete) async {
    declareindex =
    startmatch.matchlive.value.isSuperOver == true
        ? 1
        : 0;
    teamtoss = 3;
    teamtoss = startmatch.matchlive.value.winningTeamId != 0 ? startmatch.matchlive.value.winningTeamId == startmatch.matchlive.value.team1?.id ? 0 : 1 : 3;

    startmatch.remark.text = startmatch.matchlive.value.summary ?? "";
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Declare Result",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.clear))
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              PhotoScreencric(
                                  dobbn: 18,
                                  image: URLs.image_url_team +
                                      "${widget.match.team1?.logo}"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.match.team1?.shortName ?? "",
                                style: TextStyle(
                                    color: startmatch.matchlive.value.summary !=
                                            null
                                        ? startmatch.matchlive.value
                                                    .winningTeamId ==
                                                startmatch
                                                    .matchlive.value.team1?.id
                                            ? Colors.black
                                            : Colors.grey
                                        : startmatch.matchlive.value
                                                    .bettingTeamId ==
                                                startmatch
                                                    .matchlive.value.team1?.id
                                            ? Colors.black
                                            : Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          startmatch.matchlive.value.team1TotalOver == null
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
                                      "${startmatch.matchlive.value.team1Runs}-${startmatch.matchlive.value.team1TotalWickets}",
                                      style: TextStyle(
                                          color: startmatch.matchlive.value
                                                      .summary !=
                                                  null
                                              ? startmatch.matchlive.value
                                                          .winningTeamId ==
                                                      startmatch.matchlive.value
                                                          .team1?.id
                                                  ? Colors.black
                                                  : Colors.grey
                                              : startmatch.matchlive.value
                                                          .bettingTeamId ==
                                                      startmatch.matchlive.value
                                                          .team1?.id
                                                  ? Colors.black
                                                  : Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      " (${startmatch.matchlive.value.team1TotalOver})",
                                      style: TextStyle(
                                          color: startmatch.matchlive.value
                                                      .summary !=
                                                  null
                                              ? startmatch.matchlive.value
                                                          .winningTeamId ==
                                                      startmatch.matchlive.value
                                                          .team1?.id
                                                  ? Colors.black
                                                  : Colors.grey
                                              : startmatch.matchlive.value
                                                          .bettingTeamId ==
                                                      startmatch.matchlive.value
                                                          .team1?.id
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              PhotoScreencric(
                                  dobbn: 18,
                                  image: URLs.image_url_team +
                                      "${widget.match.team2?.logo}"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.match.team2?.shortName ?? "",
                                style: TextStyle(
                                    color: startmatch.matchlive.value.summary !=
                                            null
                                        ? startmatch.matchlive.value
                                                    .winningTeamId ==
                                                startmatch
                                                    .matchlive.value.team2?.id
                                            ? Colors.black
                                            : Colors.grey
                                        : startmatch.matchlive.value
                                                    .bettingTeamId ==
                                                startmatch
                                                    .matchlive.value.team2?.id
                                            ? Colors.black
                                            : Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          startmatch.matchlive.value.team2TotalOver == null
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
                                      "${startmatch.matchlive.value.team2Runs}-${startmatch.matchlive.value.team2TotalWickets}",
                                      style: TextStyle(
                                          color: startmatch.matchlive.value
                                                      .summary !=
                                                  null
                                              ? startmatch.matchlive.value
                                                          .winningTeamId ==
                                                      startmatch.matchlive.value
                                                          .team2?.id
                                                  ? Colors.black
                                                  : Colors.grey
                                              : startmatch.matchlive.value
                                                          .bettingTeamId ==
                                                      startmatch.matchlive.value
                                                          .team2?.id
                                                  ? Colors.black
                                                  : Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      " (${startmatch.matchlive.value.team2TotalOver})",
                                      style: TextStyle(
                                          color: startmatch.matchlive.value
                                                      .summary !=
                                                  null
                                              ? startmatch.matchlive.value
                                                          .winningTeamId ==
                                                      startmatch.matchlive.value
                                                          .team2?.id
                                                  ? Colors.black
                                                  : Colors.grey
                                              : startmatch.matchlive.value
                                                          .bettingTeamId ==
                                                      startmatch.matchlive.value
                                                          .team2?.id
                                                  ? Colors.black
                                                  : Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ).paddingOnly(right: 20),
                                  ],
                                )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            iscomplete == 1 ? 2 : 3,
                            (index) => Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    teamtoss = 3;
                                    declareindex = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: declareindex == index
                                          ? Colors.greenAccent
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Center(
                                    child: Text(
                                      index == 0
                                          ? "Won"
                                          : index == 1
                                              ? "Draw"
                                              : "Cancel",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      declareindex == 0
                          ? Row(
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 3,
                                                color: teamtoss == index
                                                    ? MyTheme.appBarColor
                                                    : Colors.transparent)),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade200,
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
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              index == 0
                                                  ? "${teamtoss == 0 ? "2 Points" : "0 Points"}"
                                                  : "${teamtoss == 1 ? "2 Points" : "0 Points"}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : declareindex == 1
                              ? Row(
                                  children: List.generate(
                                    2,
                                    (index) => Expanded(
                                      child: InkWell(
                                        child: Card(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.transparent)),
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey.shade200,
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "1 Points",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                      SizedBox(
                        height: declareindex == 2 ? 0 : 5,
                      ),
                      TournamentTextFormField(
                        maxlength: 50,
                        labelText: "Remark",
                        controller: startmatch.remark,
                      ),
                      // Obx(
                      //   () => TournamentDropdown(
                      //     // initialValue:
                      //     //     widget.matchdetail?.team2?.id.toString(),
                      //     count: startmatch.Allplayerlist.map((e) =>
                      //             DropdownMenuItem<String>(
                      //                 value: "${e.playerId}",
                      //                 child: Text("${e.player?.playerName}")))
                      //         .toList(),
                      //     onchange: (p0) {
                      //       playerofthematch = p0.toString();
                      //       setState(() {});
                      //     },
                      //     validator: (p0) {
                      //       if (p0?.isEmpty ?? true) {
                      //         return "Select player of the match";
                      //       }
                      //       return null;
                      //     },
                      //     lable: "Select player of the match",
                      //   ),
                      // ),
                      Row (
                        children: [
                          Visibility(
                            visible: startmatch.matchlive.value.isSuperOver ?? false,
                            child: Expanded(
                              child: Container(
                                color: Colors.grey,
                                height: 40,
                                child: MaterialButton(
                                  onPressed: () {
                                    startmatch.AddSuperOverMatchFromAPI(
                                      touramentid: startmatch
                                          .matchlive.value.tournament?.id
                                          .toString() ??
                                          "",
                                      matchid: startmatch.matchlive.value.id
                                          .toString() ??
                                          "",
                                    );
                                  },
                                  child: const Center(
                                      child: Text(
                                    "Super Over",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          startmatch.matchlive.value.isSuperOver == true ? SizedBox(width: 10,) :SizedBox(width: 0,),
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                              height: 40,
                              child: MaterialButton(
                                onPressed: () {
                                  if (validationdeclare() == true) if (declareindex == 0) {
                                    if (teamtoss != 3) {
                                      startmatch.DeclareResult(
                                        result: "won",
                                        winningteamid: startmatch
                                            .matchlive.value.winningTeamId
                                            .toString(),
                                        touramentid: startmatch
                                                .matchlive.value.tournament?.id
                                                .toString() ??
                                            "",
                                        matchid: startmatch.matchlive.value.id
                                                .toString() ??
                                            "",
                                      );
                                    } else {
                                      FlutterToast.showCustomToast(
                                          "Please Select Won Team");
                                    }
                                  } else if (declareindex == 1) {
                                    startmatch.DeclareResult(
                                      result: "draw",
                                      winningteamid: "",
                                      touramentid: startmatch
                                              .matchlive.value.tournament?.id
                                              .toString() ??
                                          "",
                                      matchid: startmatch.matchlive.value.id
                                              .toString() ??
                                          "",
                                    );
                                  } else {
                                    startmatch.DeclareResult(
                                      result: "cancel",
                                      winningteamid: "",
                                      touramentid: startmatch
                                              .matchlive.value.tournament?.id
                                              .toString() ??
                                          "",
                                      matchid: startmatch.matchlive.value.id
                                              .toString() ??
                                          "",
                                    );
                                  }
                                },
                                child: const Center(
                                    child: Text(
                                  "End Match",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  otheroutoutSheet() async {
    runoutplayerid = "";
    runouthelperid = "";
    runoutrun.text = "0";
    startmatch.bowlingteamPlayerListFromAPI(
        teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "");
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10.0, vertical: 15),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         "runout?",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TournamentDropdown(
                          // initialValue:
                          //     widget.matchdetail?.team2?.id.toString(),
                          count: [
                            DropdownMenuItem<String>(
                                value:
                                    "${startmatch.matchlive.value.stickerScore?.playerId.toString()}",
                                child: Text(
                                    "${startmatch.matchlive.value.playerstrick?.playerName}")),
                            DropdownMenuItem<String>(
                                value:
                                    "${startmatch.matchlive.value.nonstickerScore?.playerId.toString()}",
                                child: Text(
                                    "${startmatch.matchlive.value.playerNonStricker?.playerName}"))
                          ],
                          onchange: (p0) {
                            runoutplayerid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Out Batsman?";
                            }
                            return null;
                          },
                          lable: "Out Batsman?",
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TournamentDropdown(
                            // initialValue:
                            //     widget.matchdetail?.team2?.id.toString(),
                            count: startmatch.bowlingteam
                                .where((p0) =>
                                    p0.id.toString() !=
                                    startmatch
                                        .matchlive.value.bowlerScore?.playerId
                                        .toString())
                                .map((e) => DropdownMenuItem<String>(
                                    value: "${e.playerId}",
                                    child: Text("${e.player?.playerName}")))
                                .toList(),
                            onchange: (p0) {
                              runouthelperid = p0.toString();
                              setState(() {});
                            },
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return "Out by Whom?";
                              }
                              return null;
                            },
                            lable: "Out by Whom?",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "total run",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Pinput(
                                  controller: runoutrun,
                                  length: 1,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.deny(
                                        RegExp('[\\.]')),
                                  ],
                                  defaultPinTheme: PinTheme(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    width: 56,
                                    height: 56,
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      color: Color.fromRGBO(30, 60, 87, 1),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    runoutrun.text = value ?? "0";
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isballcount,
                            onChanged: (value) {
                              setState(() {
                                isballcount = !isballcount;
                              });
                            },
                          ),
                          Text(
                            "Is Ball Count ?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
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
                                  ),
                                  ),
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
                                        runoutplayerid.isEmpty ? false : true;
                                    if (!valid) {
                                      FlutterToast.showCustomToast(
                                          "Please select player");
                                    } else {
                                      runapi(
                                          run: runoutrun.text,
                                          outtype: "other",
                                          outbyplayerid: runouthelperid,
                                          outplayerid: runoutplayerid,
                                          isballcount:
                                              isballcount == false ? "0" : "1");
                                      Get.back();
                                    }
                                  },
                                  child: const Center(
                                      child: Text(
                                    "Confirm Out",
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
                ),
              );
            },
          ),
        );
      },
    );
  }

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
        actions: [
          // TextButton(
          //     onPressed: () {
          //       declaresheet(0);
          //     },
          //     child: Text(
          //       "End Inning",
          //       style: TextStyle(color: Colors.white),
          //     )),
          TextButton(
              onPressed: () {
                InningsCompleteSheet();
              },
              child: Text(
                "End Innig",
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(width: 5,),
          TextButton(
              onPressed: () {
                declaresheet(0);
              },
              child: Text(
                "Declare",
                style: TextStyle(color: Colors.white),
              )),
        ],
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
          SizedBox(
            height: 10,
          ),
          Obx(
            () {
              if (startmatch.matchlive.value.inningId == 3) {
                Future.delayed(Duration.zero, () {
                  if (startmatch.Endmatch.isTrue) {
                    declaresheet(1);
                  }
                  startmatch.Endmatch.value = false;
                });
              } else if (startmatch.isnewinning.isTrue) {
                Future.delayed(Duration.zero, () {
                  if ((startmatch.matchlive.value.inningId ?? 0) <
                      3)

                    InningsCompleteSheet();
                });
              } else if (startmatch.outplayer.value != 0) {
                Future.delayed(Duration.zero, () {
                  if (startmatch.isnewtap.isFalse)
                  newbatsmanaddSheet();
                });
              } else if ((startmatch.matchlive.value.inningId == 1 ||
                      startmatch.matchlive.value.inningId == 2) &&
                  startmatch.isnewover.isTrue) {
                Future.delayed(Duration.zero, () {

                  Overcompletesheet();
                });
              }

              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
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
                                            Text(
                                              textAlign:
                                              TextAlign.center,
                                              startmatch.matchlive
                                                  .value.summary
                                                  .toString(),
                                              style: TextStyle(
                                                  color:
                                                  Cricket_textColorSecondary,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400),
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 10),
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
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
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
                                                            Expanded(
                                                                flex: 1,
                                                                child:
                                                                    SizedBox()),
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
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            8,
                                                                        left: 8,
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                Text("${startmatch.matchlive.value.playerstrick?.playerName}  🏏", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400))),
                                                                        Expanded(
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.stickerScore?.run.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                        Expanded(
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.stickerScore?.balls.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                        Expanded(
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.stickerScore?.fours.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                        Expanded(
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.stickerScore?.sixers.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                        Expanded(
                                                                            flex:
                                                                                2,
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.stickerScore?.strikeRate.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                        Expanded(
                                                                            flex:
                                                                                1,
                                                                            child: startmatch.isstrikebatsman.isFalse
                                                                                ? SizedBox()
                                                                                : InkWell(
                                                                                    onTap: () {
                                                                                      replacebatsmanaddSheet(0);
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.more_vert_outlined,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                  )),
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
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 0),
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
                                                                        left: 8,
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                Text(startmatch.matchlive.value.playerNonStricker?.playerName.toString() ?? "", style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w400))),
                                                                        Expanded(
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.nonstickerScore?.run.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                        Expanded(
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.nonstickerScore?.balls.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                        Expanded(
                                                                            child:
                                                                                Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.fours.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12)).paddingOnly(left: 4)),
                                                                        Expanded(
                                                                            child:
                                                                                Text(textAlign: TextAlign.center, startmatch.matchlive.value.nonstickerScore?.sixers.toString() ?? "", style: TextStyle(color: Colors.black, fontSize: 12)).paddingOnly(left: 4)),
                                                                        Expanded(
                                                                            flex:
                                                                                2,
                                                                            child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                startmatch.matchlive.value.nonstickerScore?.strikeRate.toString() ?? "",
                                                                                style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                        Expanded(
                                                                            flex:
                                                                                1,
                                                                            child: startmatch.isnonstrikebatsman.isFalse
                                                                                ? SizedBox()
                                                                                : InkWell(
                                                                                    onTap: () {
                                                                                      replacebatsmanaddSheet(1);
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.more_vert_outlined,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                  )),
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
                                                      ]),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                "Partnership   ${startmatch.partnershiprun} (${startmatch.partnershipball})",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade700,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                            InkWell(
                                                                onTap: () {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          backgroundColor: Colors
                                                                              .grey
                                                                              .shade300,
                                                                          title:
                                                                              Text(
                                                                            "Alert",
                                                                            style:
                                                                                TextStyle(fontSize: 20, color: Colors.red),
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                            "Are you sure wan't to change strike?",
                                                                            style:
                                                                                TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
                                                                          ),
                                                                          actions: <
                                                                              Widget>[
                                                                            ElevatedButton(
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white70),
                                                                                ),
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop(false);
                                                                                },
                                                                                child: Text(
                                                                                  "Cancel",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                )),
                                                                            SizedBox(
                                                                              width: 0,
                                                                            ),
                                                                            ElevatedButton(
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white70),
                                                                                ),
                                                                                onPressed: () {
                                                                                  Get.back();
                                                                                  startmatch.changestrike(
                                                                                    touramentid: startmatch.matchlive.value.tournament?.id.toString() ?? "",
                                                                                    matchid: startmatch.matchlive.value.id?.toString() ?? "",
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  "Yes",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                )),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                                child: Text(
                                                                    "Change Strike",
                                                                    style: TextStyle(
                                                                        color:
                                                                            darkBlue,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400)))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
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
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
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
                                                                child: Text(
                                                                    "ER",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        textbar)),
                                                            startmatch.isbowler
                                                                    .isFalse
                                                                ? SizedBox()
                                                                : Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        SizedBox()),
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
                                                                    left: 0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right: 8,
                                                                      left: 8,
                                                                      top: 5),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Expanded(
                                                                          flex:
                                                                              7,
                                                                          child: Text(
                                                                              startmatch.matchlive.value.playerBowler?.playerName ?? "",
                                                                              style: TextStyle(color: Colors.grey.shade700, fontSize: 12))),
                                                                      Expanded(
                                                                          child: Text(
                                                                              textAlign: TextAlign.center,
                                                                              startmatch.matchlive.value.bowlerScore?.overs.toString() ?? '',
                                                                              style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                      Expanded(
                                                                          child: Text(
                                                                              textAlign: TextAlign.center,
                                                                              startmatch.matchlive.value.bowlerScore?.maidenOver.toString() ?? '',
                                                                              style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                      Expanded(
                                                                          child: Text(
                                                                              textAlign: TextAlign.center,
                                                                              startmatch.matchlive.value.bowlerScore?.runs.toString() ?? '',
                                                                              style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                      Expanded(
                                                                          child: Text(
                                                                              textAlign: TextAlign.center,
                                                                              startmatch.matchlive.value.bowlerScore?.wickets.toString() ?? '',
                                                                              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                                                                      Expanded(
                                                                          flex:
                                                                              2,
                                                                          child: Text(
                                                                              textAlign: TextAlign.center,
                                                                              startmatch.matchlive.value.bowlerScore?.economyRate.toString() ?? '',
                                                                              style: TextStyle(color: Colors.black, fontSize: 12))),
                                                                      startmatch
                                                                              .isbowler
                                                                              .isFalse
                                                                          ? SizedBox()
                                                                          : Expanded(
                                                                              flex: 1,
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  replacebowleraddSheet();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.more_vert_outlined,
                                                                                  color: Colors.grey,
                                                                                ),
                                                                              ),
                                                                            ),
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
                                                                horizontal: 12,
                                                                vertical: 0),
                                                        width: screenwidth(
                                                            context,
                                                            dividedby: 1),
                                                        child: Wrap(
                                                          runSpacing: 10,
                                                          spacing: 10,
                                                          children:
                                                              List.generate(
                                                                  startmatch
                                                                      .balls
                                                                      .length,
                                                                  (index) {
                                                            Ball ball =
                                                                startmatch
                                                                        .balls[
                                                                    index];
                                                            return Container(
                                                              width:
                                                                  screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          13),
                                                              height:
                                                                  screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          13),
                                                              // padding: EdgeInsets.all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: ball.outType ==
                                                                        null
                                                                    ? ball.ballType ==
                                                                            "normal"
                                                                        ? ball.run ==
                                                                                6
                                                                            ? Colors.green
                                                                            : ball.run == 4
                                                                                ? Colors.blue
                                                                                : Colors.black45
                                                                        : Colors.orange
                                                                    : Colors.red,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  ball.balltag ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize: ball.balltag?.length ==
                                                                              1
                                                                          ? screenwidth(
                                                                              context,
                                                                              dividedby:
                                                                                  30)
                                                                          : screenwidth(
                                                                              context,
                                                                              dividedby:
                                                                                  35),
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
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Obx(
            () => Column(
              children: [
                startmatch.isnewinning.isTrue
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.grey.shade300,
                                      title: Text(
                                        "Undo",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      content: Text(
                                        "Are you sure wan't to Undo?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.white70),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            )),
                                        SizedBox(
                                          width: 0,
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.white70),
                                            ),
                                            onPressed: () {
                                              startmatch.isnewtap.value = true;
                                              print(startmatch.isnewtap.value);
                                              Get.back();
                                              startmatch.matchundoo(
                                                touramentid: startmatch.matchlive.value.tournament?.id.toString() ?? "", matchid: startmatch.matchlive.value.id?.toString() ?? "",
                                              );
                                            },
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            )),
                                      ],
                                    );
                                  });
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(child: Text("Undo")),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              InningsCompleteSheet();
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                    child: Text(
                                        startmatch.matchlive.value.inningId == 1
                                            ? "Start Next Innings"
                                            : "Declare Winning Team")),
                              ),
                            ),
                          ),
                        ],
                      )
                    : startmatch.isnewover.isTrue
                        ? Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Overcompletesheet();
                                  },
                                  child: Card(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Center(child: Text("Next Over")),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                Visibility(
                  visible: startmatch.isnewinning.isTrue ||
                          startmatch.isnewover.isTrue ||
                          (startmatch.matchlive.value.inningId ?? 0) > 2
                      ? false
                      : true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            buildMaterialButton("0", () {
                              // InningsCompleteSheet();
                              runapi(
                                run: "0",
                              );
                            }),
                            buildMaterialButton("1", () {
                              // breakSheet();
                              runapi(
                                run: "1",
                              );
                            }),
                            buildMaterialButton("2", () {
                              runapi(
                                run: "2",
                              );
                            }),
                            buildMaterialButton("3", () {
                              runapi(
                                run: "3",
                              );
                            }),
                            // InkWell(
                            //   onTap: () {},
                            //   child: Card(
                            //     color: Colors.white,
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(8.0),
                            //       child: Text(
                            //         textAlign: TextAlign.center,
                            //         "Undo",
                            //         style: const TextStyle(
                            //             fontSize: 20, fontWeight: FontWeight.w400),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            buildMaterialButton("4", color: Colors.blue, () {
                              runapi(run: "4");
                            }),
                            buildMaterialButton("5", () {
                              runapi(run: "5");
                            }),
                            buildMaterialButton("6", color: Colors.green, () {
                              runapi(run: "6");
                            }),
                            buildMaterialButton("out", color: Colors.red, () {
                              // outSheet();
                              Outbottomsheet();
                            }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            buildMaterialButton("nb", () {
                              Noballsheet(popupid: 1);
                            }),
                            buildMaterialButton("wd", () {
                              // Overcompletesheet();
                              Noballsheet(popupid: 2);
                              // widesheet();
                            }),
                            buildMaterialButton("by", () {
                              Noballsheet(popupid: 3);
                            }),
                            buildMaterialButton("lby", () {
                              Noballsheet(popupid: 4);
                            }),
                            buildMaterialButton(
                                color: Colors.grey.shade300, "undo", () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.grey.shade300,
                                      title: Text(
                                        "Undo",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      content: Text(
                                        "Are you sure wan't to Undo?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.white70),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            )),
                                        SizedBox(
                                          width: 0,
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.white70),
                                            ),

                                            onPressed: () {
                                              startmatch.isnewtap.value = true;
                                              print(startmatch.isnewtap.value);
                                              Get.back();
                                              startmatch.matchundoo(
                                                touramentid: startmatch
                                                        .matchlive
                                                        .value
                                                        .tournament
                                                        ?.id
                                                        .toString() ??
                                                    "",
                                                matchid: startmatch
                                                        .matchlive.value.id
                                                        ?.toString() ??
                                                    "",
                                              );
                                            },
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            )),
                                      ],
                                    );
                                  });
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
