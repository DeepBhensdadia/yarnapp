import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yarn_modified/helper.dart';

import '../../../../constcolor.dart';
import '../../../const/themes.dart';
import '../../audiance/matchdetails/cricketdetailscreen.dart';
import '../../getx/matchcontroller.dart';
import '../../model/tournamentlist.dart';
import 'addmatch.dart';

class matchlScreen extends StatefulWidget {
  final Tournamentdetails tournamentid;
  const matchlScreen({super.key, required this.tournamentid});

  @override
  State<matchlScreen> createState() => _matchlScreenState();
}

class _matchlScreenState extends State<matchlScreen>
    with SingleTickerProviderStateMixin {
  MatchController matchController = Get.put(MatchController());

  @override
  void initState() {
    matchController.getmatchlistCall(id: widget.tournamentid.id.toString());
    // TODO: implement initState
    super.initState();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Obx(
                          () => matchController.machloading.isFalse
                              ? SizedBox()
                              : matchController.matchllist.isEmpty && matchController.pastmatchllist.isEmpty ? Container(
                              height:
                              screenheight(context, dividedby: 1.5),
                              child: Center(
                                child: Text("No data Found"),
                              )) : Column(
                                children: [
                                  matchController.matchllist.isEmpty
                                      ? SizedBox()
                                      : SizedBox(
                                          width: screenwidth(context,
                                              dividedby:
                                                  1), // Set the desired width for the table
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.grey.shade300,
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                'No.',
                                                                style:
                                                                    defaultstyle))),
                                                    Expanded(
                                                        flex: 5,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                'Date',
                                                                style:
                                                                    defaultstyle))),
                                                    Expanded(
                                                        flex: 4,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                'Time',
                                                                style:
                                                                    defaultstyle))),
                                                    Expanded(
                                                        flex: 5,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                'Team 1',
                                                                style:
                                                                    defaultstyle))),
                                                    Expanded(
                                                        flex: 5,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                'Team 2',
                                                                style:
                                                                    defaultstyle))),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                '',
                                                                style:
                                                                    defaultstyle))),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Center(
                                                            child: Text(
                                                                textAlign: TextAlign
                                                                    .center,
                                                                '',
                                                                style:
                                                                    defaultstyle))),
                                                  ],
                                                ),
                                              ),
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: matchController
                                                    .matchllist.length,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (BuildContext context,
                                                    int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Get.to(DetailsScreen(
                                                          match: matchController
                                                              .matchllist[index],
                                                          isadmin: 1));
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 10),
                                                      color: index.isEven
                                                          ? Cricket_white
                                                          : Colors.grey.shade200,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 2,
                                                              child: Center(
                                                                  child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      '${index + 1}',
                                                                      style:
                                                                          defaultstyle2))),
                                                          Expanded(
                                                              flex: 5,
                                                              child: Center(
                                                                  child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      '${matchController.matchllist[index].matchdatecon()}',
                                                                      style:
                                                                          defaultstyle2))),
                                                          Expanded(
                                                              flex: 4,
                                                              child: Center(
                                                                  child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      '${matchController.matchllist[index].matchtimeformat()}',
                                                                      style:
                                                                          defaultstyle2))),
                                                          Expanded(
                                                              flex: 5,
                                                              child: Center(
                                                                  child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      '${matchController.matchllist[index].team1?.shortName}',
                                                                      style:
                                                                          defaultstyle2))),
                                                          Expanded(
                                                              flex: 5,
                                                              child: Center(
                                                                  child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      '${matchController.matchllist[index].team2?.shortName}',
                                                                      style:
                                                                          defaultstyle2))),
                                                          Expanded(
                                                              flex: 1,
                                                              child: Center(
                                                                  child: matchController
                                                                              .matchllist[
                                                                                  index]
                                                                              .matchStatus
                                                                              ?.id ==
                                                                          1
                                                                      ? CircleAvatar(
                                                                          radius: 5,
                                                                          backgroundColor:
                                                                              Colors
                                                                                  .green,
                                                                        )
                                                                      : SizedBox
                                                                          .shrink())),
                                                          Expanded(
                                                            flex: 1,
                                                            child: PopupMenuButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .more_vert_outlined,
                                                                color: Colors.grey,
                                                              ),
                                                              onSelected: (value) {
                                                                if (value == "1") {
                                                                  Get.to(
                                                                      AddMatchScreen(
                                                                    matchdetail:
                                                                        matchController
                                                                                .matchllist[
                                                                            index],
                                                                    tournametid: widget
                                                                        .tournamentid,
                                                                  ));
                                                                } else {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          backgroundColor: Colors
                                                                              .grey
                                                                              .shade200,
                                                                          title:
                                                                              Text(
                                                                            "Alert",
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                    20,
                                                                                color:
                                                                                    Colors.red),
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                            "Do you want to Delete this Match?",
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                // fontWeight: FontWeight.w600,
                                                                                color: Colors.black.withOpacity(0.6)),
                                                                          ),
                                                                          actions: <
                                                                              Widget>[
                                                                            ElevatedButton(
                                                                                style: TextButton.styleFrom(
                                                                                    elevation: 5,
                                                                                    surfaceTintColor: Colors.grey,
                                                                                    backgroundColor: Colors.white70),
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop(false);
                                                                                },
                                                                                child: Text(
                                                                                  "Cancel",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                )),
                                                                            ElevatedButton(
                                                                                style: TextButton.styleFrom(
                                                                                    elevation: 5,
                                                                                    surfaceTintColor: Colors.red.withOpacity(0.3),
                                                                                    foregroundColor: Colors.red,
                                                                                    backgroundColor: Colors.red),
                                                                                onPressed: () async {
                                                                                  matchController.DeletematchFromAPI(id: matchController.matchllist[index].id.toString(), tournamentid: matchController.matchllist[index].tournamentId.toString());
                                                                                },
                                                                                child: Text(
                                                                                  "Delete",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white70),
                                                                                )),
                                                                          ],
                                                                        );
                                                                      });
                                                                }
                                                              },
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context) =>
                                                                      [
                                                                PopupMenuItem(
                                                                    value: '1',
                                                                    child: Text(
                                                                        'Edit')),
                                                                PopupMenuItem(
                                                                    value: '2',
                                                                    child: Text(
                                                                        'Delete')),
                                                              ],
                                                              iconSize: 20,
                                                              padding:
                                                                  EdgeInsets.zero,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                  matchController
                                      .pastmatchllist.isNotEmpty
                                      ? Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 15.0,
                                        vertical: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Completed  Matches",
                                          style: TextStyle(
                                              color:
                                              Colors.blueGrey,
                                              fontWeight:
                                              FontWeight
                                                  .w500),
                                        ),
                                      ],
                                    ),
                                  )
                                      : SizedBox.shrink(),
                                  Column(
                                    children: List.generate(
                                        matchController
                                            .pastmatchllist.length,
                                            (index) => InkWell(
                                          onTap: () {
                                            Get.to(DetailsScreen(
                                                match: matchController
                                                    .pastmatchllist[
                                                index],
                                                isadmin: 1));
                                          },
                                          child: Container(
                                            height: 40,
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal: 10,
                                                vertical: 10),
                                            color: index.isEven
                                                ? Cricket_white
                                                : Colors
                                                .grey.shade200,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                        child: Text(
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            '${index + 1}',
                                                            style:
                                                            defaultstyle2))),
                                                Expanded(
                                                    flex: 5,
                                                    child: Center(
                                                        child: Text(
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            '${matchController.pastmatchllist[index].matchdatecon()}',
                                                            style:
                                                            defaultstyle2))),
                                                Expanded(
                                                    flex: 4,
                                                    child: Center(
                                                        child: Text(
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            '${matchController.pastmatchllist[index].matchtimeformat()}',
                                                            style:
                                                            defaultstyle2))),
                                                Expanded(
                                                    flex: 5,
                                                    child: Center(
                                                        child: Text(
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            '${matchController.pastmatchllist[index].team1?.shortName}',
                                                            style:
                                                            defaultstyle2))),
                                                Expanded(
                                                    flex: 5,
                                                    child: Center(
                                                        child: Text(
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            '${matchController.pastmatchllist[index].team2?.shortName}',
                                                            style:
                                                            defaultstyle2))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                        child: matchController.pastmatchllist[index].matchStatus?.id ==
                                                            1
                                                            ? CircleAvatar(
                                                          radius:
                                                          5,
                                                          backgroundColor:
                                                          Colors.green,
                                                        )
                                                            : SizedBox
                                                            .shrink())),
                                                Expanded(
                                                  flex: 1,
                                                  child:
                                                  PopupMenuButton(
                                                    icon: Icon(
                                                      Icons
                                                          .more_vert_outlined,
                                                      color: Colors
                                                          .grey,
                                                    ),
                                                    onSelected:
                                                        (value) {
                                                      showDialog(
                                                          context:
                                                          context,
                                                          builder:
                                                              (BuildContext
                                                          context) {
                                                            return AlertDialog(
                                                              backgroundColor: Colors
                                                                  .grey
                                                                  .shade200,
                                                              title:
                                                              Text(
                                                                "Alert",
                                                                style:
                                                                TextStyle(fontSize: 20, color: Colors.red),
                                                              ),
                                                              content:
                                                              Text(
                                                                "Do you want to Delete this Match?",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    // fontWeight: FontWeight.w600,
                                                                    color: Colors.black.withOpacity(0.6)),
                                                              ),
                                                              actions: <
                                                                  Widget>[
                                                                ElevatedButton(
                                                                    style: TextButton.styleFrom(elevation: 5, surfaceTintColor: Colors.grey, backgroundColor: Colors.white70),
                                                                    onPressed: () {
                                                                      Navigator.of(context).pop(false);
                                                                    },
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(fontSize: 15, color: Colors.black),
                                                                    )),
                                                                ElevatedButton(
                                                                    style: TextButton.styleFrom(elevation: 5, surfaceTintColor: Colors.red.withOpacity(0.3), foregroundColor: Colors.red, backgroundColor: Colors.red),
                                                                    onPressed: () async {
                                                                      matchController.DeletematchFromAPI(id: matchController.pastmatchllist[index].id.toString(), tournamentid: matchController.pastmatchllist[index].tournamentId.toString());
                                                                    },
                                                                    child: Text(
                                                                      "Delete",
                                                                      style: TextStyle(fontSize: 15, color: Colors.white70),
                                                                    )),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    itemBuilder:
                                                        (BuildContext
                                                    context) =>
                                                    [
                                                      PopupMenuItem(
                                                          value:
                                                          '1',
                                                          child: Text(
                                                              'Delete')),
                                                    ],
                                                    iconSize: 20,
                                                    padding:
                                                    EdgeInsets
                                                        .zero,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )).toList(),
                                  )
                                ],
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(AddMatchScreen(tournametid: widget.tournamentid));
              },
              child: Container(
                height: 50,
                color: darkBlue,
                child: Center(
                  child: Text(
                    "Add Match",
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
      ),
    );
  }
}
