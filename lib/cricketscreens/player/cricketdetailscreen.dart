import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:yarn_modified/helper.dart';

import '../../const/const.dart';
import '../../constcolor.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Cricket_white,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 90),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back,
                                    size: 25, color: Cricket_Primary)
                                .paddingOnly(left: 8.0),
                          ),
                          Text("England vs Australia",
                                  style:
                                      TextStyle(color: darkBlue, fontSize: 18))
                              .paddingOnly(left: 16, right: 8.0),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 4.0, right: 4),
                      indicatorWeight: 4.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: darkBlue,
                      labelColor: darkBlue,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Center(
                          child: Text("SUMMARY",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold))
                              .paddingSymmetric(vertical: 10, horizontal: 10),
                        ),
                        Center(
                          child: Text("OVERS",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold))
                              .paddingSymmetric(vertical: 10, horizontal: 10),
                        ),
                        Center(
                          child: Text("SCORECARD",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold))
                              .paddingSymmetric(vertical: 10, horizontal: 10),
                        ),
                        Center(
                          child: Text("SQUADS",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold))
                              .paddingSymmetric(vertical: 10, horizontal: 10),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16, left: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Text("Batsman",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("R",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("B",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("4s",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("6s",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("SR",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 4.0, bottom: 4.0, right: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Text("Ben Stokes",
                                        style: TextStyle(
                                          color: darkBlue,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("135",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("219",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("11",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("8",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("61.64",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 4.0, bottom: 4.0, right: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Text("Ben Stokes",
                                        style: TextStyle(
                                          color: darkBlue,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("121",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("119",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("15",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("18",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("75.64",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                ],
                              )),
                          const Divider(),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 4.0, bottom: 4.0, left: 16, right: 4.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Text("Bowler",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("O",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("M",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("R",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("W",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("ER",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 8),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Text("Pat Cummins",
                                        style: TextStyle(
                                          color: darkBlue,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("24.4",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("5",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("80",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("1",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("3.28",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                  ),
                                ],
                              )),
                          const Divider(),
                          Text("Last Wkt: Broad(0 (2))",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )).paddingOnly(left: 16, top: 4)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ListView.separated(
                reverse: true,
                scrollDirection: Axis.vertical,
                itemCount: 20,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      onTap: () {
                        showBottomSheetDialogForBall(context, index + 1);
                      },
                      leading: Column(
                        children: [
                          Text("Ov ${index + 1}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${index + 5} runs",
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Padmakar Surve to Virat Mehsaniya, Sikandar to Deep Paatil not Patel",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      subtitle: Row(
                        children: List.generate(
                            6,
                            (index) => Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: darkBlue,
                                    ),
                                    child: Center(
                                      child: index == 0
                                          ? Text(
                                              "w",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          : Text(
                                              "${index + 3}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                    ),
                                  ),
                                )),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 0.75,
                  );
                },
              ),
              SingleChildScrollView(
                child: Column(
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      color: Colors.grey.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Image.asset("images/textilediary-applogo.png",
                                    height: 15, width: 25, fit: BoxFit.cover)
                                .paddingAll(8),
                            Text(
                              "ENG",
                              style: TextStyle(color: darkBlue, fontSize: 12),
                            ),
                          ]),
                          Row(children: [
                            Text(
                              "AUS",
                              style: TextStyle(color: darkBlue, fontSize: 12),
                            ),
                            Image.asset("images/textilediary-applogo.png",
                                    height: 15, width: 25, fit: BoxFit.cover)
                                .paddingAll(8),
                          ]),
                        ],
                      ),
                    ),
                    Container(
                        height: 40,
                        color: Colors.grey.withOpacity(0.75),
                        child: Center(
                          child: Text(
                            "Playing XI",
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    Container(
                      color: Colors.grey.withOpacity(0.25),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            Divider(height: 0),
                        itemCount: 11 * 2 - 1,
                        itemBuilder: (context, index) {
                          if (index.isEven) {
                            var teamIndex = index ~/ 2;
                            var team = "Player ${teamIndex + 1}";
                            var isLeading = teamIndex.isEven;
                            return buildTeamWidget(team, isLeading, index);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    Container(
                        height: 40,
                        color: Colors.grey.withOpacity(0.75),
                        child: Center(
                          child: Text(
                            "Bench",
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    Container(
                      color: Colors.grey.withOpacity(0.25),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            Divider(height: 0),
                        itemCount: 5 * 2 - 1, // Adjusted for separators
                        itemBuilder: (context, index) {
                          if (index.isEven) {
                            var teamIndex = index ~/ 2;
                            var team = "Player ${teamIndex + 1}";
                            var isLeading = teamIndex.isEven;
                            return buildTeamWidget(team, isLeading, index);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    Container(
                        height: 40,
                        color: Colors.grey.withOpacity(0.75),
                        child: Center(
                          child: Text(
                            "Support Staff",
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    Container(
                      color: Colors.grey.withOpacity(0.25),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            Divider(height: 0),
                        itemCount: 5, // Adjusted for separators
                        itemBuilder: (context, index) {
                          if (index.isEven) {
                            var teamIndex = index ~/ 2;
                            var team = "Player ${teamIndex + 1}";
                            var isLeading = teamIndex.isEven;
                            return buildTeamWidget(team, isLeading, index);
                          } else {
                            return SizedBox();
                          }
                        },
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
  }
}

Widget buildTeamWidget(String team, bool isLeading, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 2,
        child: InkWell(
          onTap: () {
            // PCCricketPlayerInfoScreen().launch(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent,
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    CupertinoIcons.person,
                    color: Cricket_Primary,
                    size: 20,
                  ),
                ),
                SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      team,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Batter/Bowler\nAllrounder",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        width: 0.5,
        height: 55,
        color: Colors.grey.withOpacity(0.5),
      ),
      Expanded(
        flex: 2,
        child: InkWell(
          onTap: () {
            // PCCricketPlayerInfoScreen().launch(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent,
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      team,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Batter/Bowler\nAllrounder",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    CupertinoIcons.person,
                    color: Cricket_Primary,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

showBottomSheetDialogForBall(context, ballIndex) async {
  showModalBottomSheet(
    backgroundColor: Cricket_white,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: screenwidth(context, dividedby: 1),
            decoration: BoxDecoration(
              color: Cricket_Primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Over ${ballIndex}",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    // finish(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            reverse: true,
            scrollDirection: Axis.vertical,
            itemCount: 6,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 10, top: 10),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {},
                leading: Column(
                  children: [
                    Text("${ballIndex}.${index + 1}"),
                    SizedBox(
                      height: 5,
                    ),
                    if (index == 2 || index == 4)
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade800,
                        ),
                        child: Center(
                            child: Text(
                          "w",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Ravindra Jadeja, Suresh Raina, Padmakar Surve to Virat Mehsaniya, Sikandar to Deep Paatil not Patel 2(0), 3(2)",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 0.75,
              );
            },
          ),
        ],
      );
    },
  );
}
