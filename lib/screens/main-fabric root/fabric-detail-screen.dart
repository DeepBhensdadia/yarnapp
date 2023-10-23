import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/getxcontrollers/getresultscontroller.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import '../../const/const.dart';
import '../../const/themes.dart';

class FabricDetailScreen extends StatefulWidget {
  final FabricCostList data;
  const FabricDetailScreen({super.key, required this.data});

  @override
  State<FabricDetailScreen> createState() => _FabricDetailScreenState();
}

class _FabricDetailScreenState extends State<FabricDetailScreen> {
  ScrollController _controller4 = ScrollController();
  GetResultController get = Get.put(GetResultController());
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    get.getresultcall(id: widget.data.id.toString() ?? "");
    // TODO: implement initState
    super.initState();
  }

  bool isLoading = false;
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
                  appBar: AppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.call == false
                              ? widget.data.fabricName ?? ""
                              : controller.result.general?.fabricName ?? "",
                          textScaleFactor: 1,
                          style: TextStyle(color: MyTheme.appBarTextColor),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                         widget.data.categoryName ?? "",
                          textScaleFactor: 0.75,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.75)),
                        ),
                      ],
                    ),
                    // centerTitle: true,
                    backgroundColor: MyTheme.appBarColor,
                    elevation: 5,
                    automaticallyImplyLeading: false,
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
                          ])),
                    ),
                    leadingWidth: 85,
                    leading: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 1,
                            onPressed: () {
                              Get.back();
                            },
                            tooltip: "Back",
                            icon: Icon(Icons.arrow_back_rounded)),
                        GestureDetector(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (_) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage("images/avatar.png"),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 18,
                              foregroundImage: AssetImage("images/avatar.png")),
                        ),
                      ],
                    ),
                  ),
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
                                      color: Colors.white,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: defaultCardRadius),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
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
                                                    color: Color(0xffdddddd),
                                                    width: 1.5,
                                                    style: BorderStyle.solid),
                                                horizontalInside: BorderSide(
                                                    color: Color(0xffdddddd),
                                                    width: 1.5,
                                                    style: BorderStyle.solid)),
                                            children: controller
                                                .result.warplist!
                                                .asMap()
                                                .entries
                                                .map<TableRow>(
                                                  (e) => TableRow(
                                                      decoration: BoxDecoration(
                                                          color: e.key % 2 == 0
                                                              ? Colors.white
                                                              : Color(
                                                                  0xffeeeeee),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.yarnName ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.ends
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.weight
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.rate
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.amount
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                      ]),
                                                )
                                                .toList()
                                              ..insert(
                                                0,
                                                TableRow(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffeeeeee),
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
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 5,
                                                                  top: 5),
                                                          child:
                                                              Column(children: [
                                                            Text(
                                                              "Weight\n(KG)",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
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
                                                    color: Color(0xffdddddd),
                                                    width: 1.5,
                                                    style: BorderStyle.solid),
                                                horizontalInside: BorderSide(
                                                    color: Color(0xffdddddd),
                                                    width: 1.5,
                                                    style: BorderStyle.solid)),
                                            children: controller
                                                .result.weftlist!
                                                .asMap()
                                                .entries
                                                .map<TableRow>(
                                                  (e) => TableRow(
                                                      decoration: BoxDecoration(
                                                          color: e.key % 2 == 0
                                                              ? Colors.white
                                                              : Color(
                                                                  0xffeeeeee),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.yarnId
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.finalPpi
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.weight
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.rate
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                    e.value.amount
                                                                            .toString() ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.8)),
                                                                  ),
                                                                ])),
                                                      ]),
                                                )
                                                .toList()
                                              ..insert(
                                                0,
                                                TableRow(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffeeeeee),
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
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 5,
                                                                  top: 5),
                                                          child:
                                                              Column(children: [
                                                            Text(
                                                              "Weight\n(KG)",
                                                              style: TextStyle(
                                                                  color: MyTheme
                                                                      .appBarColor),
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
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
                                                  verticalInside: BorderSide(
                                                      color: Color(0xffdddddd),
                                                      width: 1.5,
                                                      style: BorderStyle.solid),
                                                  horizontalInside: BorderSide(
                                                      color: Color(0xffdddddd),
                                                      width: 1.5,
                                                      style:
                                                          BorderStyle.solid)),
                                              children:
                                                  controller.result.calculation!
                                                      .asMap()
                                                      .entries
                                                      .map<TableRow>(
                                                        (e) => TableRow(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: e.key %
                                                                          2 ==
                                                                      0
                                                                  ? Colors.white
                                                                  : Color(
                                                                      0xffeeeeee),
                                                            ),
                                                            children: [
                                                              Column(children: [
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              10),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional
                                                                            .centerStart,
                                                                    child: Text(
                                                                      e.value.name ??
                                                                          "",
                                                                      style: TextStyle(
                                                                          fontWeight: e.key == 6 || e.key == 7
                                                                              ? FontWeight.w600
                                                                              : FontWeight.w400,
                                                                          color: MyTheme.appBarColor),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                              Column(children: [
                                                                Text(
                                                                  e.value.value?.toDouble().toStringAsFixed(2) ?? "",
                                                                  style: TextStyle(
                                                                      fontWeight: e.key == 6 ||
                                                                              e.key ==
                                                                                  7
                                                                          ? FontWeight
                                                                              .w600
                                                                          : FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.8)),
                                                                ),
                                                              ]),
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
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
                                                  verticalInside: BorderSide(
                                                      color: Color(0xffdddddd),
                                                      width: 1.5,
                                                      style: BorderStyle.solid),
                                                  horizontalInside: BorderSide(
                                                      color: Color(0xffdddddd),
                                                      width: 1.5,
                                                      style:
                                                          BorderStyle.solid)),
                                              children: controller
                                                  .result.weightDetails!
                                                  .asMap()
                                                  .entries
                                                  .map<TableRow>(
                                                    (e) => TableRow(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: e.key % 2 == 0
                                                              ? Colors.white
                                                              : Color(
                                                                  0xffeeeeee),
                                                        ),
                                                        children: [
                                                          Column(children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      top: 10,
                                                                      bottom:
                                                                          10),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional
                                                                        .centerStart,
                                                                child: Text(
                                                                  e.value.name ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      // fontWeight: e.key == 0 ? FontWeight.bold :FontWeight.w400,
                                                                      //   fontSize: e.key == 0 ? 16 :14,
                                                                      color: MyTheme.appBarColor),
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                          Column(children: [
                                                            Text(
                                                              e.value.value?.toDouble().toStringAsFixed(2) ?? "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.8)),
                                                            ),
                                                          ]),
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
                                              ),
                                              width: double.infinity,
                                              child: Center(
                                                  child: Text(
                                                "ORDER DETAILS",
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
                                                    color: Color(0xffdddddd),
                                                    width: 1.5,
                                                    style: BorderStyle.solid),
                                                horizontalInside: BorderSide(
                                                    color: Color(0xffdddddd),
                                                    width: 1.5,
                                                    style: BorderStyle.solid)),
                                            children: controller
                                                .result.otherDetails!
                                                .asMap()
                                                .entries
                                                .map<TableRow>(
                                                  (e) => TableRow(
                                                      decoration: BoxDecoration(
                                                        color: e.key % 2 == 0
                                                            ? Colors.white
                                                            : Color(0xffeeeeee),
                                                      ),
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      top: 10,
                                                                      bottom:
                                                                          10),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional
                                                                        .centerStart,
                                                                child: Text(
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
                                                        Column(children: [
                                                          Text(
                                                            e.value.value?.toDouble().toStringAsFixed(2) ?? "",
                                                            style: TextStyle(
                                                                // fontWeight: e.key == 0 ? FontWeight.bold :FontWeight.w400,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        ]),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.blueAccent)),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.arrow_back_rounded,
                                                      color: Colors.white,
                                                      size: 20),
                                                  SizedBox(width: 10),
                                                  Text('PREVIOUS'),
                                                ],
                                              )),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green)),
                                              child: Row(
                                                children: [
                                                  Text('NEXT'),
                                                  SizedBox(width: 10),
                                                  Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      color: Colors.white,
                                                      size: 20),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
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
