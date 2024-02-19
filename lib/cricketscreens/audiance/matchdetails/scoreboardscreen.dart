import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../../constcolor.dart';

class ScoreBoardScreen extends StatefulWidget {
  const ScoreBoardScreen({super.key});

  @override
  State<ScoreBoardScreen> createState() => _ScoreBoardScreenState();
}

class _ScoreBoardScreenState extends State<ScoreBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                iconColor: Colors.grey,
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                "images/textilediary-applogo.png",
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover)
                                .paddingAll(16),
                          ),
                          Text("England",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18))
                              .paddingOnly(left: 8.0)
                        ],
                      ),
                      Text("362-9 (125.4)",
                          style: TextStyle(
                              color: Colors.black, fontSize: 18))
                          .paddingOnly(left: 8.0),
                    ],
                  ),
                ).paddingAll(8),
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 4),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Text("Batsman",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))),
                        Expanded(
                            child: Text("R",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 0)),
                        Expanded(
                            child: Text("B",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("4s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("6s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("SR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 8)),
                        Expanded(
                            child: Text("",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 8)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 4,
                                          child: Text("Ben Stokes",
                                              style: TextStyle(
                                                  color: darkBlue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight
                                                      .w600))),
                                      Expanded(
                                          child: Text("135",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight
                                                      .bold))),
                                      Expanded(
                                          child: Text("219",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Expanded(
                                          child: Text("11",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("8",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("61.64",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Icon(
                                        Icons
                                            .keyboard_arrow_right_rounded,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        top: 5,
                                        bottom: 5),
                                    child: Text("run out",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12))
                                        .paddingOnly(
                                        top: 4, bottom: 4)),
                                const Divider(
                                  thickness: 0.8,
                                  height: 0,
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 0.25,
                    height: 0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 5, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Text("Extras",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text("T31,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))
                                  .paddingOnly(left: 4)),
                          Expanded(
                              child: Text("b5,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 10)),
                          Expanded(
                              child: Text("lb15,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 4)),
                          Expanded(
                              child: Text("w10,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 6)),
                          Expanded(
                              child: Text("nb1,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 8)),
                          Expanded(
                              child: Text("p0",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 8)),
                        ],
                      ).paddingOnly(right: 4),
                    ),
                  ),
                  const Divider(
                    thickness: 0.25,
                    height: 0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Text("Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            "362 (9 wkts,75.2 Ov)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.25,
                    height: 0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 4),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Text("Bowler",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))),
                        Expanded(
                            child: Text("O",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 0)),
                        Expanded(
                            child: Text("M",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("R",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("W",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("ER",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 8)),
                        Expanded(
                            child: Text("",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 8)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 4,
                                          child: Text("Jack Leach",
                                              style: TextStyle(
                                                  color: darkBlue,
                                                  fontSize: 15))),
                                      Expanded(
                                          child: Text("135",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Expanded(
                                          child: Text("219",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Expanded(
                                          child: Text("9",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("15",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("99.99",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Icon(
                                        Icons
                                            .keyboard_arrow_right_rounded,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        top: 5,
                                        bottom: 5),
                                    child: Text("not out (Head)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12))
                                        .paddingOnly(
                                        top: 4, bottom: 4)),
                                const Divider(
                                  thickness: 0.8,
                                  height: 0,
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 4),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 6,
                            child: Text("Fall of Wickets",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))),
                        Expanded(
                            flex: 1,
                            child: Text("Score",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))),
                        Expanded(
                            flex: 1,
                            child: Text("Over",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 12)),
                        Expanded(
                            child: Text("",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 8)),
                      ],
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 4,
                                        child: Text("Ben Stokes",
                                            style: TextStyle(
                                                color: darkBlue,
                                                fontSize: 15))),
                                    Expanded(
                                        flex: 1,
                                        child: Text("135",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))
                                            .paddingOnly(left: 12)),
                                    Expanded(
                                        flex: 0,
                                        child: Text("95.94",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))),
                                    Expanded(
                                        flex: 0,
                                        child: Text("",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))
                                            .paddingOnly(right: 35)),
                                  ],
                                ).paddingOnly(right: 4),
                              ),
                              const Divider(
                                thickness: 0.8,
                                height: 0,
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
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                iconColor: Colors.grey,
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                "images/textilediary-applogo.png",
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover)
                                .paddingAll(16),
                          ),
                          Text("Australia",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18))
                              .paddingOnly(left: 8.0)
                        ],
                      ),
                      Text("246-10 (75.2)",
                          style: TextStyle(
                              color: Colors.black, fontSize: 18))
                          .paddingOnly(left: 8.0),
                    ],
                  ),
                ).paddingAll(8),
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 4),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Text("Batsman",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))),
                        Expanded(
                            child: Text("R",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 0)),
                        Expanded(
                            child: Text("B",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("4s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("6s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("SR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 8)),
                        Expanded(
                            child: Text("",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 8)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 4,
                                          child: Text("Ben Stokes",
                                              style: TextStyle(
                                                  color: darkBlue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight
                                                      .w600))),
                                      Expanded(
                                          child: Text("135",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight
                                                      .bold))),
                                      Expanded(
                                          child: Text("219",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Expanded(
                                          child: Text("11",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("8",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("61.64",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Icon(
                                        Icons
                                            .keyboard_arrow_right_rounded,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        top: 5,
                                        bottom: 5),
                                    child: Text("run out",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12))
                                        .paddingOnly(
                                        top: 4, bottom: 4)),
                                const Divider(
                                  thickness: 0.8,
                                  height: 0,
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 0.25,
                    height: 0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 5, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Text("Extras",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text("T31,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))
                                  .paddingOnly(left: 4)),
                          Expanded(
                              child: Text("b5,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 10)),
                          Expanded(
                              child: Text("lb15,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 4)),
                          Expanded(
                              child: Text("w10,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 6)),
                          Expanded(
                              child: Text("nb1,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 8)),
                          Expanded(
                              child: Text("p0",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12))
                                  .paddingOnly(left: 8)),
                        ],
                      ).paddingOnly(right: 4),
                    ),
                  ),
                  const Divider(
                    thickness: 0.25,
                    height: 0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Text("Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            "362 (9 wkts,75.2 Ov)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.25,
                    height: 0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 4),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Text("Bowler",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))),
                        Expanded(
                            child: Text("O",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 0)),
                        Expanded(
                            child: Text("M",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("R",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("W",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 4)),
                        Expanded(
                            child: Text("ER",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 8)),
                        Expanded(
                            child: Text("",
                                style: primaryTextStyle(
                                    color: Cricket_textColorPrimary,
                                    size: 12))
                                .paddingOnly(left: 8)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 4,
                                          child: Text("Jack Leach",
                                              style: TextStyle(
                                                  color: darkBlue,
                                                  fontSize: 15))),
                                      Expanded(
                                          child: Text("135",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Expanded(
                                          child: Text("219",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Expanded(
                                          child: Text("9",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("15",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold))
                                              .paddingOnly(left: 4)),
                                      Expanded(
                                          child: Text("99.99",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12))),
                                      Icon(
                                        Icons
                                            .keyboard_arrow_right_rounded,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        top: 5,
                                        bottom: 5),
                                    child: Text("not out (Head)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12))
                                        .paddingOnly(
                                        top: 4, bottom: 4)),
                                const Divider(
                                  thickness: 0.8,
                                  height: 0,
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 4),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 6,
                            child: Text("Fall of Wickets",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))),
                        Expanded(
                            flex: 1,
                            child: Text("Score",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))),
                        Expanded(
                            flex: 1,
                            child: Text("Over",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 12)),
                        Expanded(
                            child: Text("",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12))
                                .paddingOnly(left: 8)),
                      ],
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PCCricketPlayerInfoScreen()));
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 4,
                                        child: Text("Ben Stokes",
                                            style: TextStyle(
                                                color: darkBlue,
                                                fontSize: 15))),
                                    Expanded(
                                        flex: 1,
                                        child: Text("135",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))
                                            .paddingOnly(left: 12)),
                                    Expanded(
                                        flex: 0,
                                        child: Text("95.94",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))),
                                    Expanded(
                                        flex: 0,
                                        child: Text("",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))
                                            .paddingOnly(right: 35)),
                                  ],
                                ).paddingOnly(right: 4),
                              ),
                              const Divider(
                                thickness: 0.8,
                                height: 0,
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
