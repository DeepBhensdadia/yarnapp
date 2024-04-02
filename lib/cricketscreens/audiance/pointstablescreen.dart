import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/helper.dart';

import '../../const/const.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../services/app_url.dart';
import '../getx/audiance/tournamentshow.dart';

import '../model/getpointsresponse.dart';
import '../photoscreen.dart';

class PointTableScreen extends StatefulWidget {
  const PointTableScreen({super.key});

  @override
  State<PointTableScreen> createState() => _PointTableScreenState();
}

class _PointTableScreenState extends State<PointTableScreen> {
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        // body: Center(
        //     child: Text(
        //   "No Data Found",
        //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        // )),
        body: Obx(
          () => tournamentAudiance.getpoint.isFalse
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: decration,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        tournamentAudiance.getpointsA.isEmpty
                            ? SizedBox()
                            : Container(
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
                                        width:
                                            screenwidth(context, dividedby: 1),
                                        // height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                "Group 1",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "P",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "W",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "L",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "NR",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "Pts",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "NRR",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade700),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                              tournamentAudiance
                                                  .getpointsA.length,
                                              (index) {
                                                Teampoints team =
                                                    tournamentAudiance
                                                        .getpointsA[index];
                                                return Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 4,
                                                          child: Row(
                                                            children: <Widget>[
                                                              PhotoScreencric(
                                                                dobbn: 20,
                                                                image: URLs
                                                                        .image_url_team +
                                                                    "${team.logo}",
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                  child: Text(
                                                                      "${team.shortName}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12)))
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              team.totalMatches !=
                                                                      null
                                                                  ? team
                                                                      .totalMatches
                                                                      .toString()
                                                                  : "0",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalWin}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalLoss}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalDraw}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0),
                                                          child: Text(
                                                              "${team.point}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0),
                                                              child: Text(
                                                                  "${team.netRunrate}",
                                                                  style: primaryTextStyle(
                                                                      color:
                                                                          Cricket_textColorPrimary,
                                                                      size:
                                                                          12)),
                                                            ))
                                                      ],
                                                    ),
                                                    index == 4
                                                        ? SizedBox()
                                                        : Divider()
                                                  ],
                                                );
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        tournamentAudiance.getpointsB.isEmpty
                            ? SizedBox()
                            : Container(
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
                                        width:
                                            screenwidth(context, dividedby: 1),
                                        // height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                "Group 2",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "P",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "W",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "L",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "NR",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "Pts",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "NRR",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade700),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                              tournamentAudiance
                                                  .getpointsB.length,
                                              (index) {
                                                Teampoints team =
                                                    tournamentAudiance
                                                        .getpointsB[index];
                                                return Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 4,
                                                          child: Row(
                                                            children: <Widget>[
                                                              PhotoScreencric(
                                                                dobbn: 20,
                                                                image: URLs
                                                                        .image_url_team +
                                                                    "${team.logo}",
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                  child: Text(
                                                                      "${team.shortName}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12)))
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              team.totalMatches !=
                                                                      null
                                                                  ? team
                                                                      .totalMatches
                                                                      .toString()
                                                                  : "0",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalWin}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalLoss}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalDraw}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0),
                                                          child: Text(
                                                              "${team.point}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0),
                                                              child: Text(
                                                                  "${team.netRunrate}",
                                                                  style: primaryTextStyle(
                                                                      color:
                                                                          Cricket_textColorPrimary,
                                                                      size:
                                                                          12)),
                                                            ))
                                                      ],
                                                    ),
                                                    index == 4
                                                        ? SizedBox()
                                                        : Divider()
                                                  ],
                                                );
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        tournamentAudiance.getpointsC.isEmpty
                            ? SizedBox()
                            : Container(
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
                                        width:
                                            screenwidth(context, dividedby: 1),
                                        // height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                "Group 3",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "P",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "W",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "L",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "NR",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "Pts",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "NRR",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade700),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                              tournamentAudiance
                                                  .getpointsC.length,
                                              (index) {
                                                Teampoints team =
                                                    tournamentAudiance
                                                        .getpointsC[index];
                                                return Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 4,
                                                          child: Row(
                                                            children: <Widget>[
                                                              PhotoScreencric(
                                                                dobbn: 20,
                                                                image: URLs
                                                                        .image_url_team +
                                                                    "${team.logo}",
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                  child: Text(
                                                                      "${team.shortName}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12)))
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              team.totalMatches !=
                                                                      null
                                                                  ? team
                                                                      .totalMatches
                                                                      .toString()
                                                                  : "0",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalWin}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalLoss}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalDraw}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0),
                                                          child: Text(
                                                              "${team.point}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0),
                                                              child: Text(
                                                                  "${team.netRunrate}",
                                                                  style: primaryTextStyle(
                                                                      color:
                                                                          Cricket_textColorPrimary,
                                                                      size:
                                                                          12)),
                                                            ))
                                                      ],
                                                    ),
                                                    index == 4
                                                        ? SizedBox()
                                                        : Divider()
                                                  ],
                                                );
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        tournamentAudiance.getpointsD.isEmpty
                            ? SizedBox()
                            : Container(
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
                                        width:
                                            screenwidth(context, dividedby: 1),
                                        // height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                "Group 4",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "P",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "W",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "L",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "NR",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                child: Text(
                                              textAlign: TextAlign.center,
                                              "Pts",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700),
                                            )),
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "NRR",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade700),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                              tournamentAudiance
                                                  .getpointsD.length,
                                              (index) {
                                                Teampoints team =
                                                    tournamentAudiance
                                                        .getpointsD[index];
                                                return Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 4,
                                                          child: Row(
                                                            children: <Widget>[
                                                              PhotoScreencric(
                                                                dobbn: 20,
                                                                image: URLs
                                                                        .image_url_team +
                                                                    "${team.logo}",
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                  child: Text(
                                                                      "${team.shortName}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12)))
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              team.totalMatches !=
                                                                      null
                                                                  ? team
                                                                      .totalMatches
                                                                      .toString()
                                                                  : "0",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalWin}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalLoss}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${team.totalDraw}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0),
                                                          child: Text(
                                                              "${team.point}",
                                                              style: primaryTextStyle(
                                                                  color:
                                                                      Cricket_textColorPrimary,
                                                                  size: 12)),
                                                        )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0),
                                                              child: Text(
                                                                  "${team.netRunrate}",
                                                                  style: primaryTextStyle(
                                                                      color:
                                                                          Cricket_textColorPrimary,
                                                                      size:
                                                                          12)),
                                                            ))
                                                      ],
                                                    ),
                                                    index == 4
                                                        ? SizedBox()
                                                        : Divider()
                                                  ],
                                                );
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
