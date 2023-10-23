import 'dart:async';
import 'package:flutter/material.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../widgets/common_fields.dart';
import '../../root-app.dart';
class EditResultCategory extends StatefulWidget {
  const EditResultCategory({super.key});

  @override
  State<EditResultCategory> createState() => _EditResultCategoryState();
}

class _EditResultCategoryState extends State<EditResultCategory> {
  ScrollController _controller4 = ScrollController();

  TextEditingController searchController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Builder(builder: (context) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Scrollbar(
                  controller: _controller4,
                  child: SingleChildScrollView(
                    controller: _controller4,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Container(
                          //     height: 40,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.only(
                          //             topRight: Radius.circular(15),
                          //             topLeft: Radius.circular(15)),
                          //         gradient: LinearGradient(
                          //             begin: Alignment.centerLeft,
                          //             end: Alignment.centerRight,
                          //             colors: [
                          //               Colors.grey.withOpacity(0.2),
                          //               Colors.white.withOpacity(0.2)
                          //             ])),
                          //     width: double.infinity,
                          //     child: Center(
                          //         child: Text(
                          //           "Category :",
                          //           style: TextStyle(
                          //               color: Colors.grey.shade600,
                          //               fontWeight: FontWeight.bold),
                          //         ))),
                          // SizedBox(
                          //   height: 25,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 15, right: 15),
                          //   child: Container(
                          //     height: 40,
                          //     decoration: BoxDecoration(
                          //         color: Colors.white.withOpacity(0.5),
                          //         borderRadius: BorderRadius.all(
                          //             Radius.circular(10)),
                          //         border: Border.all(color: Colors.grey)
                          //     ),
                          //     child: TextField(
                          //         cursorColor: Colors.black,
                          //         textInputAction:
                          //         TextInputAction.done,
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: MediaQuery.of(context)
                          //               .textScaleFactor *
                          //               12,
                          //         ),
                          //         controller: searchController,
                          //         decoration: InputDecoration(
                          //             contentPadding:
                          //             EdgeInsets.symmetric(
                          //                 horizontal: 10),
                          //             prefixIcon: Icon(
                          //               Icons.search,
                          //               color: Colors.grey.shade600,
                          //               size: 30,
                          //             ),
                          //             suffixIcon: IconButton(
                          //               splashRadius: 0.1,
                          //               onPressed: () {
                          //                 searchController.clear();
                          //               },
                          //               icon: Icon(
                          //                 Icons.cancel_rounded,
                          //                 color: Colors.grey,
                          //               ),
                          //             ),
                          //             hintText: "Search Fabric Cost",
                          //             hintStyle: TextStyle(
                          //                 fontSize: MediaQuery.of(context)
                          //                     .textScaleFactor *
                          //                     12,
                          //                 color: Colors.grey),
                          //             disabledBorder: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                     color:
                          //                     Colors.transparent),
                          //                 borderRadius:
                          //                 BorderRadius.circular(
                          //                     5)),
                          //             enabledBorder: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                     color:
                          //                     Colors.transparent),
                          //                 borderRadius:
                          //                 BorderRadius.circular(5)),
                          //             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(5)),
                          //             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(5)))),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 25,
                          // ),
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
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.centerLeft,
                                      //     end: Alignment.centerRight,
                                      //     colors: [
                                      //       MyTheme.appBarColor.withOpacity(0.75),
                                      //       Colors.white.withOpacity(0.2)
                                      //     ])
                                    ),
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                          "WARP",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Table(
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  defaultColumnWidth: FlexColumnWidth(50),
                                  border: TableBorder(
                                      verticalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid),
                                      horizontalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  children: [
                                    TableRow(
                                        decoration: BoxDecoration(
                                          color: Color(0xffeeeeee),
                                        ),
                                        children: [
                                          Column(children: [
                                            Text(
                                              "Yarn",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "Ends",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 5, top: 5),
                                              child: Column(children: [
                                                Text(
                                                  "Weight\n(KG)",
                                                  style: TextStyle(
                                                      color:
                                                      MyTheme.appBarColor),
                                                ),
                                              ])),
                                          Column(children: [
                                            Text(
                                              "Rate",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "Amount",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                        ]),
                                  ],
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
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.centerLeft,
                                      //     end: Alignment.centerRight,
                                      //     colors: [
                                      //       MyTheme.appBarColor.withOpacity(0.75),
                                      //       Colors.white.withOpacity(0.2)
                                      //     ])
                                    ),
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                          "WEFT",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Table(
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  border: TableBorder(
                                      verticalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid),
                                      horizontalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  children: [
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Text(
                                              "Yarn",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 5, top: 5),
                                              child: Column(children: [
                                                Text(
                                                  "Final\nPPI",
                                                  style: TextStyle(
                                                      color:
                                                      MyTheme.appBarColor),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 5, top: 5),
                                              child: Column(children: [
                                                Text(
                                                  "Weight\n(KG)",
                                                  style: TextStyle(
                                                      color:
                                                      MyTheme.appBarColor),
                                                ),
                                              ])),
                                          Column(children: [
                                            Text(
                                              "Rate",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "Amount",
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Column(children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ])),
                                        ]),
                                  ],
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
                                          topRight: Radius.circular(8)),
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.centerLeft,
                                      //     end: Alignment.centerRight,
                                      //     colors: [
                                      //       MyTheme.appBarColor.withOpacity(0.75),
                                      //       Colors.white.withOpacity(0.2)
                                      //     ])
                                    ),
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                          "RESULT",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(4),
                                  },
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  border: TableBorder(
                                      verticalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid),
                                      horizontalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  children: [
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                alignment: AlignmentDirectional
                                                    .centerStart,
                                                child: Text(
                                                  "Yarn Cost",
                                                  style: TextStyle(
                                                      color:
                                                      MyTheme.appBarColor),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0.00",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration:
                                        BoxDecoration(color: Colors.white),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Production Cost on Total Final PPI",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(
                                            children: [
                                              Text(
                                                "0.00",
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                              ),
                                            ],
                                          ),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "% Wastage on Warp Amount",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0.00",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration:
                                        BoxDecoration(color: Colors.white),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "% Wastage on Weft Amount",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0.00",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Butta Cutting Cost",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "NaN",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration:
                                        BoxDecoration(color: Colors.white),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Any Additional Cost",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "NaN",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Final Cost Per Metre",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "NaN",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Final Cost Per Piece",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "NaN",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                  ],
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
                                          topRight: Radius.circular(8)),
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.centerLeft,
                                      //     end: Alignment.centerRight,
                                      //     colors: [
                                      //       Colors.grey.withOpacity(0.2),
                                      //       Colors.white.withOpacity(0.2)
                                      //     ])
                                    ),
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                          "WEIGHT DETAILS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(4),
                                  },
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  border: TableBorder(
                                      verticalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid),
                                      horizontalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  children: [
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Warp Weight (KG)",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration:
                                        BoxDecoration(color: Colors.white),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Warp Weight (KG)",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee),
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Total Weight (KG)",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0.000",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                  ],
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
                                          topRight: Radius.circular(8)),
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.centerLeft,
                                      //     end: Alignment.centerRight,
                                      //     colors: [
                                      //       Colors.grey.withOpacity(0.2),
                                      //       Colors.white.withOpacity(0.2)
                                      //     ])
                                    ),
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                          "ORDER DETAILS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(4),
                                  },
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  border: TableBorder(
                                      verticalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid),
                                      horizontalInside: BorderSide(
                                          color: Color(0xffdddddd),
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  children: [
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Total Ends (Taar)",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration:
                                        BoxDecoration(color: Colors.white),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Width (Inch)",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Total Final PPI",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "0.00",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration:
                                        BoxDecoration(color: Colors.white),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Cut in Inch",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "NaN",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xffeeeeee),
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        children: [
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Align(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .centerStart,
                                                  child: Text(
                                                    "Cut in Metre",
                                                    style: TextStyle(
                                                        color: MyTheme
                                                            .appBarColor),
                                                  )),
                                            ),
                                          ]),
                                          Column(children: [
                                            Text(
                                              "NaN",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                          ]),
                                        ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Timer(Duration(milliseconds: 2500), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RootApp()));
                                    FlutterToast.showCustomToast("Data Saved");
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8))),
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueAccent)),
                                child: Text('SAVE')),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
            }
          ),
        ),
        isLoading
            ? Container(
          color: Colors.black.withOpacity(0.25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 3,
                ),
                SizedBox(height: 250,),
                Text("Data Updating In Progress...",style: TextStyle(color: Colors.black, decoration: TextDecoration.none,fontSize: 13,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        )
            : Container(),
      ],
    );
  }
}
