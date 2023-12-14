import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/getresultscontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/main-fabric%20root/photoscreen.dart';
import 'package:yarn_modified/services/app_url.dart';
import '../../../const/const.dart';

class EditResultCategory extends StatefulWidget {
  const EditResultCategory({super.key});

  @override
  State<EditResultCategory> createState() => _EditResultCategoryState();
}

class _EditResultCategoryState extends State<EditResultCategory> {
  ScrollController _controller4 = ScrollController();

  TextEditingController searchController = TextEditingController();
  GetResultController get = Get.put(GetResultController());
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetResultController>(
        builder: (controller) => Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: MyTheme.scaffoldColor,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.30),
                      Colors.white.withOpacity(0.65),
                      Colors.white.withOpacity(0.85),
                    ])),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Builder(builder: (context) {
                    final MediaQueryData data = MediaQuery.of(context);
                    return MediaQuery(
                      data: data.copyWith(textScaleFactor: 1),
                      child: controller.call == false
                          ? Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              controller: _controller4,
                              physics: BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Card(
                                      elevation: 2.5,
                                      color: Colors.white,
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: defaultCardRadius),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  PhotoScreen(image: URLs.image_url + "assets/fabric/${controller.result.general?.photo}",fabricid: controller
                                                      .result
                                                      .general
                                                      ?.id.toString() ?? ""),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          controller.call ==
                                                                  false
                                                              ? "Febric"
                                                              : controller
                                                                      .result
                                                                      .general
                                                                      ?.fabricName ??
                                                                  "",
                                                          textScaleFactor: 1.3,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight:
                                                            //     FontWeight
                                                            //         .w400
                                                          )),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                          controller.call ==
                                                                  false
                                                              ? "Febric Category"
                                                              : controller
                                                                      .result
                                                                      .general
                                                                      ?.categoryName ??
                                                                  "",
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: defaultCardRadius),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(8),
                                                        topRight:
                                                        Radius.circular(
                                                            8)),
                                                    color: Colors.white,
                                                  ),
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                        "WARP",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ))),
                                              Table(
                                                defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                                defaultColumnWidth:
                                                FlexColumnWidth(50),
                                                border: TableBorder(
                                                    verticalInside: BorderSide(
                                                        color:
                                                        Color(0xffdddddd),
                                                        width: 1.5,
                                                        style:
                                                        BorderStyle.solid),
                                                    horizontalInside:
                                                    BorderSide(
                                                        color: Color(
                                                            0xffdddddd),
                                                        width: 1.5,
                                                        style: BorderStyle
                                                            .solid)),
                                                children:
                                                controller.result.warplist!
                                                    .asMap()
                                                    .entries
                                                    .map<TableRow>(
                                                      (e) => TableRow(
                                                      decoration: BoxDecoration(
                                                          color: e.key %
                                                              2 ==
                                                              0
                                                              ? Colors
                                                              .white
                                                              : Color(
                                                              0xffeeeeee),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      children: [
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.yarnName ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.ends.toString() ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.weight.toString(),
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    "${e.value.yarnRate.toString()}" ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                right:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Text(
                                                              e.value.amount
                                                                  ?.toDouble()
                                                                  .toStringAsFixed(2) ??
                                                                  "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(0.8)),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            )),
                                                      ]),
                                                )
                                                    .toList()
                                                  ..insert(
                                                    0,
                                                    TableRow(
                                                        decoration:
                                                        BoxDecoration(
                                                          color: Color(
                                                              0xffeeeeee),
                                                        ),
                                                        children: [
                                                          Column(children: [
                                                            Text(
                                                              "Yarn",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                          Column(children: [
                                                            Text(
                                                              "Ends",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  bottom:
                                                                  5,
                                                                  top:
                                                                  5),
                                                              child: Column(
                                                                  children: [
                                                                    Text(
                                                                      "Weight\n(KG)",
                                                                      style:
                                                                      TextStyle(color: MyTheme.appBarColor),
                                                                    ),
                                                                  ])),
                                                          Column(children: [
                                                            Text(
                                                              "Rate",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                          Column(children: [
                                                            Text(
                                                              "Amount",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                        ]),
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: defaultCardRadius),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(8),
                                                        topRight:
                                                        Radius.circular(
                                                            8)),
                                                    color: Colors.white,
                                                  ),
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                        "WEFT",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ))),
                                              Table(
                                                defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                                border: TableBorder(
                                                    verticalInside: BorderSide(
                                                        color:
                                                        Color(0xffdddddd),
                                                        width: 1.5,
                                                        style:
                                                        BorderStyle.solid),
                                                    horizontalInside:
                                                    BorderSide(
                                                        color: Color(
                                                            0xffdddddd),
                                                        width: 1.5,
                                                        style: BorderStyle
                                                            .solid)),
                                                children:
                                                controller.result.weftlist!
                                                    .asMap()
                                                    .entries
                                                    .map<TableRow>(
                                                      (e) => TableRow(
                                                      decoration: BoxDecoration(
                                                          color: e.key %
                                                              2 ==
                                                              0
                                                              ? Colors
                                                              .white
                                                              : Color(
                                                              0xffeeeeee),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      children: [
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.yarnName.toString() ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.finalPpi?.toDouble().toStringAsFixed(2) ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.weight?.toDouble().toStringAsFixed(4) ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                top:
                                                                10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.yarnRate.toString() ??
                                                                        "",
                                                                    style:
                                                                    TextStyle(color: Colors.black.withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                bottom:
                                                                10,
                                                                right:
                                                                8,
                                                                top:
                                                                10),
                                                            child: Text(
                                                              e.value.rate
                                                                  ?.toDouble()
                                                                  .toStringAsFixed(2) ??
                                                                  "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(0.8)),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            )),
                                                      ]),
                                                )
                                                    .toList()
                                                  ..insert(
                                                    0,
                                                    TableRow(
                                                        decoration:
                                                        BoxDecoration(
                                                          color: Color(
                                                              0xffeeeeee),
                                                        ),
                                                        children: [
                                                          Column(children: [
                                                            Text(
                                                              "Yarn",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                          Column(children: [
                                                            Text(
                                                              "Final\nPPI",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  bottom:
                                                                  5,
                                                                  top:
                                                                  5),
                                                              child: Column(
                                                                  children: [
                                                                    Text(
                                                                      "Weight\n(KG)",
                                                                      style:
                                                                      TextStyle(color: MyTheme.appBarColor),
                                                                    ),
                                                                  ])),
                                                          Column(children: [
                                                            Text(
                                                              "Rate",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                          Column(children: [
                                                            Text(
                                                              "Amount",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
                                                            ),
                                                          ]),
                                                        ]),
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: defaultCardRadius),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(8),
                                                        topRight:
                                                        Radius.circular(
                                                            8)),
                                                  ),
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                        "RESULT",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ))),
                                              Table(
                                                  columnWidths: {
                                                    0: FlexColumnWidth(4),
                                                  },
                                                  defaultVerticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                                  border: TableBorder(
                                                      verticalInside:
                                                      BorderSide(
                                                          color: Color(
                                                              0xffdddddd),
                                                          width: 1.5,
                                                          style: BorderStyle
                                                              .solid),
                                                      horizontalInside:
                                                      BorderSide(
                                                          color: Color(
                                                              0xffdddddd),
                                                          width: 1.5,
                                                          style: BorderStyle
                                                              .solid)),
                                                  children:
                                                  controller
                                                      .result.calculation!
                                                      .asMap()
                                                      .entries
                                                      .map<TableRow>(
                                                        (e) => TableRow(
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius: e.key +
                                                              1 ==
                                                              controller
                                                                  .result
                                                                  .calculation
                                                                  ?.length
                                                              ? BorderRadius.only(
                                                              bottomLeft: Radius.circular(
                                                                  8),
                                                              bottomRight: Radius.circular(
                                                                  8))
                                                              : BorderRadius
                                                              .circular(
                                                              0),
                                                          color: e.key %
                                                              2 !=
                                                              0
                                                              ? Colors
                                                              .white
                                                              : Color(
                                                              0xffeeeeee),
                                                        ),
                                                        children: [
                                                          Column(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.only(
                                                                      left: 10,
                                                                      top: 10,
                                                                      bottom: 10),
                                                                  child:
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional.centerStart,
                                                                    child:
                                                                    Text(
                                                                      e.value.name ?? "",
                                                                      style: TextStyle(fontWeight: e.key == 6 || e.key == 7 ? FontWeight.w600 : FontWeight.w400, color: MyTheme.appBarColor),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                right:
                                                                8.0),
                                                            child: Text(
                                                              e.value.value?.toDouble().toStringAsFixed(2) ==
                                                                  "0.00"
                                                                  ? "NA"
                                                                  : controller.result.weftlist?.first.isAdvance == 0 ? e.key == 7 ? "NA" : e.value.value?.toDouble().toStringAsFixed(2) : e.value.value?.toDouble().toStringAsFixed(2),
                                                              style: TextStyle(
                                                                  fontWeight: e.key == 6 || e.key == 7
                                                                      ? FontWeight.w600
                                                                      : FontWeight.w400,
                                                                  color: Colors.black.withOpacity(0.8)),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                      .toList()),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: defaultCardRadius),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(8),
                                                        topRight:
                                                        Radius.circular(
                                                            8)),
                                                  ),
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                        "WEIGHT DETAILS",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ))),
                                              Table(
                                                  columnWidths: {
                                                    0: FlexColumnWidth(4),
                                                  },
                                                  defaultVerticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                                  border: TableBorder(
                                                      verticalInside:
                                                      BorderSide(
                                                          color: Color(
                                                              0xffdddddd),
                                                          width: 1.5,
                                                          style: BorderStyle
                                                              .solid),
                                                      horizontalInside:
                                                      BorderSide(
                                                          color: Color(
                                                              0xffdddddd),
                                                          width: 1.5,
                                                          style: BorderStyle
                                                              .solid)),
                                                  children:
                                                  controller
                                                      .result.weightDetails!
                                                      .asMap()
                                                      .entries
                                                      .map<TableRow>(
                                                        (e) => TableRow(
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius: e.key +
                                                              1 ==
                                                              controller
                                                                  .result
                                                                  .weightDetails
                                                                  ?.length
                                                              ? BorderRadius.only(
                                                              bottomLeft: Radius.circular(
                                                                  8),
                                                              bottomRight: Radius.circular(
                                                                  8))
                                                              : BorderRadius
                                                              .circular(
                                                              0),
                                                          color: e.key %
                                                              2 !=
                                                              0
                                                              ? Colors
                                                              .white
                                                              : Color(
                                                              0xffeeeeee),
                                                        ),
                                                        children: [
                                                          Column(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.only(
                                                                      left: 10,
                                                                      top: 10,
                                                                      bottom: 10),
                                                                  child:
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional.centerStart,
                                                                    child:
                                                                    Text(
                                                                      e.value.name ?? "",
                                                                      style: TextStyle(
                                                                        // fontWeight: e.key == 0 ? FontWeight.bold :FontWeight.w400,
                                                                        //   fontSize: e.key == 0 ? 16 :14,
                                                                          color: MyTheme.appBarColor),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                right:
                                                                8.0),
                                                            child: Text(
                                                              e.value.value
                                                                  ?.toString() ??
                                                                  "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(0.8)),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                      .toList()),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: defaultCardRadius),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(8),
                                                        topRight:
                                                        Radius.circular(
                                                            8)),
                                                  ),
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                        "OTHER DETAILS",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ))),
                                              Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(4),
                                                },
                                                defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                                border: TableBorder(
                                                    verticalInside: BorderSide(
                                                        color:
                                                        Color(0xffdddddd),
                                                        width: 1.5,
                                                        style:
                                                        BorderStyle.solid),
                                                    horizontalInside:
                                                    BorderSide(
                                                        color: Color(
                                                            0xffdddddd),
                                                        width: 1.5,
                                                        style: BorderStyle
                                                            .solid)),
                                                children:
                                                controller
                                                    .result.otherDetails!
                                                    .asMap()
                                                    .entries
                                                    .map<TableRow>(
                                                      (e) => TableRow(
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius: e.key +
                                                            1 ==
                                                            controller
                                                                .result
                                                                .otherDetails
                                                                ?.length
                                                            ? BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                8),
                                                            bottomRight:
                                                            Radius.circular(
                                                                8))
                                                            : BorderRadius
                                                            .circular(
                                                            0),
                                                        color: e.key %
                                                            2 !=
                                                            0
                                                            ? Colors
                                                            .white
                                                            : Color(
                                                            0xffeeeeee),
                                                      ),
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.only(
                                                                  left:
                                                                  10,
                                                                  top:
                                                                  10,
                                                                  bottom:
                                                                  10),
                                                              child:
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional.centerStart,
                                                                child:
                                                                Text(
                                                                  e.value.name ??
                                                                      "",
                                                                  style: TextStyle(
                                                                    // fontWeight: e.key == 0 ? FontWeight.bold :FontWeight.w400,
                                                                    //   fontSize: e.key == 5 && e.key == 6 ? 16 :14,
                                                                      color: MyTheme.appBarColor),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              right:
                                                              8.0),
                                                          child: Text(
                                                            e.key == 0
                                                                ? e.value.value?.toDouble().toStringAsFixed(0) ??
                                                                ""
                                                                : e.value.value?.toDouble().toStringAsFixed(2) ==
                                                                "0.00"
                                                                ? "NA"
                                                                : controller.result.weftlist?.first.isAdvance == 0 ? e.key == 3 || e.key == 4  ? "NA" : e.value.value?.toDouble().toStringAsFixed(2) : e.value.value?.toDouble().toStringAsFixed(2),
                                                            style: TextStyle(
                                                              // fontWeight: e.key == 0 ? FontWeight.bold :FontWeight.w400,
                                                                color: Colors.black.withOpacity(0.8)),
                                                            textAlign:
                                                            TextAlign
                                                                .end,
                                                          ),
                                                        ),
                                                      ]),
                                                )
                                                    .toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                    );
                  }),
                ),
              ),
            ));
  }
}
