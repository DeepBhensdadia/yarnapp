import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/cricketscreens/model/matchlivedetailsresponse.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/widgets/tournamenttextfield.dart';

import '../../../../const/themes.dart';
import '../../../getx/startmatchcontroller.dart';

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
    startmatch.matchInfoDetailFromAPI(
        tournamentid: widget.match.tournament?.id.toString() ?? "",
        matchid: widget.match.id.toString() ?? "");
    // TODO: implement initState
    super.initState();
  }

  Widget buildMaterialButton(
    String input,
    void Function()? ontap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Card(
          color: input == "Out"
              ? Colors.redAccent
              : input == "4"
                  ? Colors.green.shade300
                  : input == "6"
                      ? Colors.yellow
                      : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "$input",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
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
              " Are You Sure Do you want to Continue?",
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

  runapi({
    required String run,
    String? balltype,
    String? outtype,
    String? outtypeid,
    String? outplayerid,
  }) {
    startmatch.runaddFromAPI(
        battingteamid: startmatch.matchlive.value.bettingTeamId.toString(),
        bowlingteamid: startmatch.matchlive.value.bowlingTeamId.toString(),
        outtype: outtype ?? "",
        outbyplayerid: outtypeid ?? "",
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
  Noballsheet() async {
    nbtotalrun = 1;
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
                          children: const [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "No Ball",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "NB",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
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
                              const SizedBox(
                                width: 10,
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
                                    length: 1,
                                    defaultPinTheme: PinTheme(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 6),
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
                                      nbtotalrun = 1;
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
                                  runapi(
                                      run: "${nbtotalrun - 1}", balltype: "nb");
                                  Get.back();
                                },
                                child: const Center(
                                    child: Text("OK",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
      },
    );
  }

  int wdtotalrun = 1;
  widesheet() async {
    nbtotalrun = 1;
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
                          children: const [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wide",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "WB",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
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
                              const SizedBox(
                                width: 10,
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
                                    length: 1,
                                    defaultPinTheme: PinTheme(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 6),
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
                                      wdtotalrun = 1;
                                      wdtotalrun =
                                          wdtotalrun + int.parse(value);
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
                                "${wdtotalrun}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
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
                                  runapi(
                                      run: "${wdtotalrun - 1}", balltype: "wb");
                                  Get.back();
                                },
                                child: const Center(
                                    child: Text("OK",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "End of over by ${startmatch.matchlive.value.playerBowler?.playerName}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kthemecolor,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.settings,
                            color: Colors.white,
                          ),
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

                          Container(
                            // width: screenwidth(context, dividedby: 2),
                            child: Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              children: List.generate(
                                  startmatch.balls.length,
                                  (index) => CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Colors.blueGrey.shade100,
                                        child: Center(
                                          child: Text(
                                              "${startmatch.balls[index].ballType != "normal" ? "${startmatch.balls[index].ballType}" : ""}${startmatch.balls[index].run}"),
                                        ),
                                      )),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //
                          //     const Padding(
                          //         padding: EdgeInsets.only(bottom: 20),
                          //         child: Text(
                          //           "= 11",
                          //           style: TextStyle(color: Colors.black54),
                          //         )),
                          //   ],
                          // ),
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
                          SizedBox(
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
                                      startmatch.nextoverbowleradd(
                                          teamid: startmatch.matchlive.value
                                                  .bowlerScore?.teamId
                                                  .toString() ??
                                              "",
                                          tournamentid: startmatch.matchlive
                                                  .value.tournament?.id
                                                  .toString() ??
                                              "",
                                          matchid: startmatch.matchlive.value.id
                                                  .toString() ??
                                              "",
                                          playerid: nextbowlerid);
                                    },
                                    child: const Center(
                                        child: Text(
                                      "START NEXT OVER",
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
                            "First innings completed",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kthemecolor,
                            ),
                          ),
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
                          const Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "End of innings for TramA",
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
                                              ? "18"
                                              : index == 1
                                                  ? "1"
                                                  : index == 2
                                                      ? "0"
                                                      : "3",
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
                                      startmatch.Firstinningcomplete(
                                          tournamentid: widget
                                                  .match.tournament?.id
                                                  .toString() ??
                                              "",
                                          matchid:
                                              widget.match.id.toString() ?? "");
                                    },
                                    child: const Center(
                                        child: Text(
                                      "START NEXT INNINGS",
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
    await showDialog(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "What's the Caught player?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
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
                            playercughtid = p0.toString();
                            setState(() {});
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select Caught Player";
                            }
                            return null;
                          },
                          lable: "Select Caught Player",
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
                                  runapi(
                                      run: "0",
                                      outtype: "caught",
                                      outtypeid: playercughtid,
                                      outplayerid: startmatch
                                          .matchlive.value.stickerPlayerId
                                          .toString());

                                  Get.back();
                                  newbatsmanaddSheet();
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
    runoutrun.text = "0";
    startmatch.bowlingteamPlayerListFromAPI(
        teamid: startmatch.matchlive.value.bowlingTeamId.toString() ?? "");
    await showDialog(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "runout?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
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
                            return "Select Out Player";
                          }
                          return null;
                        },
                        lable: "Select Out Player",
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
                              return "Select player helper";
                            }
                            return null;
                          },
                          lable: "Select player helper",
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
                                  runapi(
                                      run: runoutrun.text,
                                      outtype: "runout",
                                      outtypeid: runoutplayerid,
                                      outplayerid: runouthelperid);
                                  Get.back();
                                  newbatsmanaddSheet(isrunout: 1);
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

  Outbottomsheet() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
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
                          outtypeid:
                              startmatch.matchlive.value.bowlerId.toString() ??
                                  "",
                          outplayerid: startmatch
                              .matchlive.value.stickerPlayerId
                              .toString());
                      Get.back();
                      newbatsmanaddSheet();
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
                      runapi(
                          run: "0",
                          outtype: "stumped",
                          outtypeid:
                              startmatch.matchlive.value.bowlerId.toString() ??
                                  "",
                          outplayerid: startmatch
                              .matchlive.value.stickerPlayerId
                              .toString());
                      Get.back();
                      newbatsmanaddSheet();
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
                          outtypeid:
                              startmatch.matchlive.value.bowlerId.toString() ??
                                  "",
                          outplayerid: startmatch
                              .matchlive.value.stickerPlayerId
                              .toString());
                      Get.back();
                      newbatsmanaddSheet();
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
                      newbatsmanaddSheet();
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
                      runapi(
                          run: "0",
                          outtype: "Other",
                          outtypeid:
                              startmatch.matchlive.value.bowlerId.toString() ??
                                  "",
                          outplayerid: startmatch
                              .matchlive.value.stickerPlayerId
                              .toString());
                      Get.back();
                      newbatsmanaddSheet();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String nextbatsmanid = "";
  bool newbatsmanonstrike = true;

  newbatsmanaddSheet({int? isrunout}) async {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "Select New Player",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
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
                              return "Select Batsman";
                            }
                            return null;
                          },
                          lable: "Select Batsman",
                        ),
                      ),
                    ),
                    isrunout == null
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
                                  startmatch.newbatsmanadd(
                                      teamid: startmatch
                                          .matchlive.value.bettingTeamId
                                          .toString(),
                                      tournamentid: startmatch
                                              .matchlive.value.tournament?.id
                                              .toString() ??
                                          "",
                                      matchid: startmatch.matchlive.value.id
                                              .toString() ??
                                          "",
                                      playerid: nextbatsmanid);
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

  int breakresson = 15;
  breakSheet() async {
    await showDialog(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "Break reason?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TournamentDropdown(
                        count: List.generate(
                            breakreason.length,
                            (index) => DropdownMenuItem<String>(
                                value: breakreason[index],
                                child: Text(breakreason[index]))),
                        onchange: (p0) {},
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return "Select break reason?";
                          }
                          return null;
                        },
                        lable: "Select Break reason",
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Wrap(
                    //     spacing: 10,
                    //     runSpacing: 10,
                    //     children: List.generate(
                    //         outreason.length,
                    //         (index) => InkWell(
                    //               onTap: () {
                    //                 setState(() {
                    //                   breakresson = index;
                    //                 });
                    //               },
                    //               child: Container(
                    //                 padding: EdgeInsets.all(8),
                    //                 decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(5),
                    //                     color: breakresson == index
                    //                         ? kthemecolor
                    //                         : Colors.grey.shade100),
                    //                 child: Text(
                    //                   outreason[index],
                    //                   style: TextStyle(
                    //                       fontSize: 16,
                    //                       color: breakresson == index
                    //                           ? kwhite
                    //                           : Colors.black54,
                    //                       fontWeight: FontWeight.w400),
                    //                 ),
                    //               ),
                    //             )),
                    //   ),
                    // ),
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
                                onPressed: () {},
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
                                onPressed: () {},
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

  int legbyrun = 0;
  Legbysheet({String? isby}) async {
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
                                isby != null ? "By" : "Leg By",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                isby != null ? "By" : "Leg By",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
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
                                    length: 1,
                                    defaultPinTheme: PinTheme(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 6),
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
                                      legbyrun = int.parse(value);
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
                                "${legbyrun}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
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
                                  runapi(
                                    run: "${legbyrun}",
                                    balltype: isby != null ? "by" : "leg_by",
                                  );
                                  Get.back();
                                },
                                child: const Center(
                                    child: Text("OK",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
      },
    );
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
            () {
              if (startmatch.isnewinning.isTrue) {
                Future.delayed(Duration.zero, () {
                  InningsCompleteSheet();
                });
              }
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: 200,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child: Text(
                                    startmatch.batteam.value,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          startmatch.matchlive.value
                                                      .bettingTeamId
                                                      .toString() ==
                                                  startmatch
                                                      .matchlive.value.team1?.id
                                                      .toString()
                                              ? "${startmatch.matchlive.value.team1TotalRun}/${startmatch.matchlive.value.team1TotalWickets}"
                                              : "${startmatch.matchlive.value.team2TotalRun}/${startmatch.matchlive.value.team2TotalWickets}",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          " ( ${startmatch.matchlive.value.runingOver}/${startmatch.matchlive.value.overseas} )",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${startmatch.matchlive.value.toss}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      startmatch.matchlive.value.playerstrick?.id == null
                          ? SizedBox.shrink()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 4,
                                      // margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),

                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${startmatch.matchlive.value.playerstrick?.playerName} *",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${startmatch.matchlive.value.stickerScore?.run} (${startmatch.matchlive.value.stickerScore?.balls})",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Card(
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              startmatch
                                                      .matchlive
                                                      .value
                                                      .playerNonStricker
                                                      ?.playerName ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${startmatch.matchlive.value.nonstickerScore?.run} (${startmatch.matchlive.value.nonstickerScore?.balls})",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      startmatch.matchlive.value.playerBowler?.id == null
                          ? SizedBox.shrink()
                          : Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  // height: 200,
                                  width: double.infinity,
                                  child: Card(
                                    elevation: 4,
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, bottom: 15),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0.0),
                                            child: Text(
                                              startmatch.ballteam.value,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                startmatch
                                                        .matchlive
                                                        .value
                                                        .playerBowler
                                                        ?.playerName ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "${startmatch.matchlive.value.bowlerScore?.overs}-${startmatch.matchlive.value.bowlerScore?.runs}-${startmatch.matchlive.value.bowlerScore?.wickets}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: screenwidth(context,
                                                dividedby: 1),
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              children: List.generate(
                                                  startmatch.balls.length,
                                                  (index) => CircleAvatar(
                                                        radius: 18,
                                                        backgroundColor: Colors
                                                            .blueGrey.shade100,
                                                        child: Center(
                                                          child: Text(
                                                              "${startmatch.balls[index].ballType != "normal" ? "${startmatch.balls[index].ballType}" : ""}${startmatch.balls[index].run}"),
                                                        ),
                                                      )),
                                            ),
                                          )
                                        ],
                                      ),
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
          Obx(
            () => startmatch.isnewover.isTrue
                ? MaterialButton(
                    onPressed: () {
                      Overcompletesheet();
                    },
                    child: Text("Next Over"),
                  )
                : SizedBox(),
          ),
          Column(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    buildMaterialButton("4", () {
                      runapi(run: "4");
                    }),
                    buildMaterialButton("5", () {
                      runapi(run: "5");
                    }),
                    buildMaterialButton("6", () {
                      runapi(run: "6");
                    }),
                    buildMaterialButton("Out", () {
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
                    buildMaterialButton("NB", () {
                      Noballsheet();
                    }),
                    buildMaterialButton("WB", () {
                      // Overcompletesheet();
                      widesheet();
                    }),
                    buildMaterialButton("BY", () {
                      Legbysheet(isby: "12");
                    }),
                    buildMaterialButton("L.BY", () {
                      Legbysheet();
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
