import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yarn_modified/helper.dart';

import '../../../../constcolor.dart';
import '../../../const/themes.dart';
import '../../audiance/matchdetails/cricketdetailscreen.dart';
import 'addmatch.dart';

class matchlScreen extends StatefulWidget {
  const matchlScreen({super.key});

  @override
  State<matchlScreen> createState() => _matchlScreenState();
}

class _matchlScreenState extends State<matchlScreen> {
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
                        Container(
                          color: Colors.grey.shade300,
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 10),
                          width: context.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text('No.',
                                        style: TextStyle(
                                            color: Cricket_Primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("Date",
                                          style: TextStyle(
                                              color: Cricket_Primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("Time",
                                          style: TextStyle(
                                              color: Cricket_Primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Center(
                                    child: Text("Team 1",
                                        style: TextStyle(
                                            color: Cricket_Primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Center(
                                    child: Text("Team 2",
                                        style: TextStyle(
                                            color: Cricket_Primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text("",
                                        style: TextStyle(
                                            color: Cricket_Primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                            ],
                          ),
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 15,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    color: (index.isEven
                                        ? Cricket_white
                                        : Colors.grey.shade200),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text("${index + 1}",
                                                style: TextStyle(
                                                    color:
                                                        Cricket_textColorPrimary,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          // Row(
                                          //   children: <Widget>[
                                          //     Image.asset("images/textilediary-applogo.png",fit: BoxFit.cover, height: 25, width: 25,),
                                          //     SizedBox(width: 10,),
                                          //     Expanded(
                                          //         child: Text("p",
                                          //             style: TextStyle(color: Cricket_textColorPrimary, fontSize: 12)))
                                          //   ],
                                          // ),
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                              child: Text(
                                                  "${index + 2}-Mar-24 ",
                                                  style: TextStyle(
                                                      color:
                                                          Cricket_textColorPrimary,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                              child: Text("10:30",
                                                  style: TextStyle(
                                                      color:
                                                          Cricket_textColorPrimary,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Center(
                                              child: Text("Chennai",
                                                  style: TextStyle(
                                                      color:
                                                          Cricket_textColorPrimary,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Center(
                                              child: Text("Kolkata",
                                                  style: TextStyle(
                                                      color:
                                                          Cricket_textColorPrimary,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )),
                                        // InkWell(
                                        //   onTap:() {
                                        //
                                        //   },
                                        //   child: Expanded(
                                        //       flex: 1,
                                        //       child: Center(
                                        //           child: Icon(
                                        //               Icons.more_vert_outlined))),
                                        // ),
                                        Expanded(
                                          flex: 1,
                                          child: PopupMenuButton(
                                            // offset: Offset(0, 50), // Adjust the offset as needed
                                            icon: Icon(
                                              Icons.more_vert_outlined,
                                            ),
                                            onSelected: (value) {
                                              // Handle the selected menu item
                                              // You can use the 'value' parameter to determine which item was selected
                                            },
                                            itemBuilder:
                                                (BuildContext context) => [
                                              PopupMenuItem(
                                                value: 'item1',
                                                child: Text('Edit'),
                                              ),
                                              PopupMenuItem(
                                                value: 'item2',
                                                child: Text('Delete'),
                                              ),  PopupMenuItem(
                                                value: 'item2',
                                                child: Text('View'),
                                              ),
                                              // Add more menu items as needed
                                            ],
                                            iconSize: 20,
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Divider(color: CupertinoColors.systemBlue,height: 0,thickness: 0.5,),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(AddMatchScreen());
              },
              child: Container(
                height: 50,
                color: kthemecolor,
                child: Center(
                  child: Text(
                    "Add Match",
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
