import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yarn_modified/helper.dart';

import '../../const/const.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../model/teamwinloseresponse.dart';
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
                                                    InkWell(
                                                      onTap: () => Get.to(
                                                          Teammatcheslist(
                                                              team: team)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 4,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
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
                                                                            color:
                                                                                Colors.grey.shade700,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 12)))
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
                                                    InkWell(
                                                      onTap: () => Get.to(
                                                          Teammatcheslist(
                                                              team: team)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 4,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
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
                                                                            color:
                                                                                Colors.grey.shade700,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 12)))
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
                                                    InkWell(
                                                      onTap: () => Get.to(
                                                          Teammatcheslist(
                                                              team: team)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 4,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
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
                                                                            color:
                                                                                Colors.grey.shade700,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 12)))
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
                                                    InkWell(
                                                      onTap: () => Get.to(
                                                          Teammatcheslist(
                                                              team: team)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 4,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
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
                                                                            color:
                                                                                Colors.grey.shade700,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 12)))
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

class Teammatcheslist extends StatefulWidget {
  final Teampoints team;
  const Teammatcheslist({super.key, required this.team});

  @override
  State<Teammatcheslist> createState() => _TeammatcheslistState();
}

class _TeammatcheslistState extends State<Teammatcheslist> {
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());
  @override
  void initState() {
    tournamentAudiance.getteamwinlose(
        tournamentid: widget.team.tournamentId.toString(),
        teamid: widget.team.id.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotoScreencric(
                dobbn: 20,
                image: URLs.image_url_team + "${widget.team.logo}",
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.team.shortName ?? "",
                textScaleFactor: 1,
                style: TextStyle(
                    letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
        body: Obx(
          () => Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: decration,
            child: tournamentAudiance.getwinlose.isFalse
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        tournamentAudiance.teammatches.isEmpty
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
                                                "Teams",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Date",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                "Result",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
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
                                                  .teammatches.length,
                                              (index) {
                                                Matchwinlose team =
                                                    tournamentAudiance
                                                        .teammatches[index];
                                                String date =
                                                    DateFormat('dd MMM').format(
                                                        team.matchDate ??
                                                            DateTime.now());
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
                                                                dobbn: 15,
                                                                image: URLs
                                                                        .image_url_team +
                                                                    "${widget.team.id == team.team1?.id ? team.team2?.logo : team.team1?.logo}",
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                  child: Text(
                                                                      "${widget.team.id == team.team1?.id ? team.team2?.shortName : team.team1?.shortName}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              11)))
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Row(
                                                            children: <Widget>[
                                                              Text("${date}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          11))
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 5,
                                                          child: Text(
                                                              team
                                                                      .summary ??
                                                                  "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      11)),
                                                        ),
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
