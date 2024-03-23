import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/services/app_url.dart';

import '../../constcolor.dart';
import '../../helper.dart';
import '../getx/audiance/tournamentshow.dart';
import '../model/tournamentdetailresponse.dart';
import 'matchdetails/cricketdetailscreen.dart';

class MatchScreenAudiance extends StatefulWidget {
  const MatchScreenAudiance({super.key});

  @override
  State<MatchScreenAudiance> createState() => _MatchScreenAudianceState();
}

class _MatchScreenAudianceState extends State<MatchScreenAudiance> {
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: kthemecolor,
      //   title: Text("Matches"),
      // ),
      body: Obx(() => tournamentAudiance.gettournadetai.isFalse
          ? Center(
              child: CircularProgressIndicator(),
            )
          : tournamentAudiance.getmatchinfo.isEmpty
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
                                    itemCount:
                                        tournamentAudiance.getmatchinfo.length,
                                    itemBuilder: (context, index) {
                                      Matchinfo match = tournamentAudiance
                                          .getmatchinfo[index];
                                      return InkWell(
                                        onTap: () => Get.to(DetailsScreen(match:match)),
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
                                                                "Surat",
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
                                                                "Ahemdabad",
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 2,
                                                      child: Row(
                                                        children: <Widget>[
                                                          Stack(
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        ClipOval(
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child:
                                                                            FractionalTranslation(
                                                                          translation: Offset(
                                                                              -0.2,
                                                                              0),
                                                                          child:
                                                                              Image.network(
                                                                            URLs.image_url_team +
                                                                                "${match.team1?.logo}",
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        gradient:
                                                                            RadialGradient(
                                                                          colors: [
                                                                            Colors.white.withOpacity(0.9),
                                                                            Colors.white.withOpacity(0.5),
                                                                          ],
                                                                          radius:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Positioned(
                                                                right: -18,
                                                                top: 8.5,
                                                                bottom: 8.5,
                                                                child:
                                                                    Container(
                                                                  width: 70,
                                                                  height: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.4),
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                NetworkImage(
                                                                              URLs.image_url_team + "${match.team1?.logo}",
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          )),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(width: 8),
                                                          Text(
                                                            match.team1
                                                                    ?.shortName ??
                                                                "",
                                                            style: TextStyle(
                                                                fontSize: 14,
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
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red
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
                                                                  fontSize: 11,
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
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              )),
                                                          SizedBox(
                                                            height: 2.5,
                                                          ),
                                                          Text(match.match ?? "",
                                                              style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize: 12,
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
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .blueGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(width: 8),
                                                          Stack(
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        ClipOval(
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.centerRight,
                                                                        child:
                                                                            FractionalTranslation(
                                                                          translation: Offset(
                                                                              0.2,
                                                                              0),
                                                                          child:
                                                                              Image.network(
                                                                            URLs.image_url_team +
                                                                                "${match.team2?.logo}",
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        gradient:
                                                                            RadialGradient(
                                                                          colors: [
                                                                            Colors.white.withOpacity(0.9),
                                                                            Colors.white.withOpacity(0.5),
                                                                          ],
                                                                          radius:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Positioned(
                                                                left: -18,
                                                                top: 8.5,
                                                                bottom: 8.5,
                                                                child:
                                                                    Container(
                                                                  width: 70,
                                                                  height: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.4),
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                NetworkImage(
                                                                              URLs.image_url_team + "${match.team2?.logo}",
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          )),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets
                                                //           .symmetric(
                                                //       horizontal: 8,
                                                //       vertical: 5),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Row(
                                                //         children: [
                                                //           Text(
                                                //             "120/10 ",
                                                //             style: TextStyle(
                                                //                 color: Colors
                                                //                     .blueGrey,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold,
                                                //                 fontSize: 16),
                                                //           ),
                                                //           Text(
                                                //             "( 9.5/10 )",
                                                //             style: TextStyle(
                                                //                 color: Colors
                                                //                     .blueGrey,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold,
                                                //                 fontSize: 13),
                                                //           )
                                                //         ],
                                                //       ),
                                                //       Row(
                                                //         children: [
                                                //           Text(
                                                //             "120/10 ",
                                                //             style: TextStyle(
                                                //                 color: Colors
                                                //                     .blueGrey,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold,
                                                //                 fontSize: 16),
                                                //           ),
                                                //           Text(
                                                //             "( 9.5/10 )",
                                                //             style: TextStyle(
                                                //                 color: Colors
                                                //                     .blueGrey,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold,
                                                //                 fontSize: 13),
                                                //           )
                                                //         ],
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 5,
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
                                                            "Match Yet to be started on ${match.matchdateformat()}",
                                                            // "ENG needs 1002 runs to win",
                                                            style: TextStyle(
                                                                fontSize: 10,
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
                                                                    vertical: 3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color:
                                                                    Colors.yellow),
                                                            child: Text("Future",
                                                                // "ENG needs 1002 runs to win",
                                                                style: TextStyle(
                                                                    fontSize: 10,
                                                                    color: Colors
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
                )),
    );
  }
}
