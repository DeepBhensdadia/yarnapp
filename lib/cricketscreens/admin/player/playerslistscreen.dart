import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';

import '../../../constcolor.dart';
import '../../player/playerprofilescreen.dart';
import 'addplayerscreen.dart';

class PlayersListScreen extends StatefulWidget {
  const PlayersListScreen({super.key});

  @override
  State<PlayersListScreen> createState() => _PlayersListScreenState();
}

class _PlayersListScreenState extends State<PlayersListScreen> {
  MatchController matchController = Get.put(MatchController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: kthemecolor,
          title: Text("Team Name"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                // shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    color: Color(0xffeeeeee),
                    child: ListTile(
                        onTap: () {
                          Get.to(PlayerProfileScreen());
                        },
                        minVerticalPadding: 20,
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.black)),
                        ),
                        title: Text(
                          "Player ${index + 1}",
                          style: TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Obx(() =>  Text("${matchController.selectedindex.value == 1 ? "Captain" : "mjur"}"),),
                            IconButton(
                              onPressed: () {
                                showSortBySheet();
                              },
                              icon: Icon(
                                Icons.more_vert_outlined,
                                color: CupertinoColors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(AddPlayerScreen());
              },
              child: Container(
                height: 50,
                color: kthemecolor,
                child: Center(
                  child: Text(
                    "Add Player",
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

  showSortBySheet() async {
    final result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: true,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (BuildContext context) {
          // return object of type Dialog
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          radius: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Abdullah Fazal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  "VIEW PROFILE",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "REMOVE",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assign Roles",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Container(
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius: BorderRadius.circular(2.5),
                      //           ),
                      //           child: Center(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   radius: 25,
                      //                   backgroundColor:
                      //                       Colors.grey.withOpacity(0.25),
                      //                   child: Center(
                      //                     child: Text(
                      //                       "A",
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 30),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   "Admin",
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius: BorderRadius.circular(2.5),
                      //           ),
                      //           child: Center(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   radius: 25,
                      //                   backgroundColor: Colors.teal,
                      //                   child: Center(
                      //                     child: Text(
                      //                       "C",
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 30),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   "Captain",
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius: BorderRadius.circular(2.5),
                      //           ),
                      //           child: Center(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   radius: 25,
                      //                   backgroundColor:
                      //                       Colors.grey.withOpacity(0.25),
                      //                   child: Center(
                      //                     child: Stack(
                      //                       children: [
                      //                         Center(
                      //                             child: Icon(
                      //                           CupertinoIcons.hand_raised_fill,
                      //                           color: Colors.black,
                      //                           size: 35,
                      //                         )),
                      //                         Center(
                      //                             child: Text(
                      //                           "WK",
                      //                           style: TextStyle(
                      //                               color: Colors.white,
                      //                               fontWeight: FontWeight.bold,
                      //                               fontSize: 15),
                      //                         )),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   "Wicket Keeper",
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Container(
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius: BorderRadius.circular(2.5),
                      //           ),
                      //           child: Center(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   radius: 25,
                      //                   backgroundColor:
                      //                       Colors.grey.withOpacity(0.25),
                      //                   child: Center(
                      //                     child: Icon(
                      //                         Icons.sports_football_rounded,
                      //                         color: Colors.white),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   "Batter",
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius: BorderRadius.circular(2.5),
                      //           ),
                      //           child: Center(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   radius: 25,
                      //                   backgroundColor:
                      //                       Colors.grey.withOpacity(0.25),
                      //                   child: Center(
                      //                     child: Icon(Icons.sports_basketball,
                      //                         color: Colors.white),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   "Bowler",
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius: BorderRadius.circular(2.5),
                      //           ),
                      //           child: Center(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   radius: 25,
                      //                   backgroundColor:
                      //                       Colors.grey.withOpacity(0.25),
                      //                   child: Center(
                      //                     child: Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.center,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.center,
                      //                       children: [
                      //                         Icon(
                      //                           Icons.sports_football_rounded,
                      //                           color: Colors.white,
                      //                           size: 15,
                      //                         ),
                      //                         SizedBox(
                      //                           width: 2.5,
                      //                         ),
                      //                         Icon(
                      //                           Icons.sports_basketball,
                      //                           color: Colors.white,
                      //                           size: 15,
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   "All Rounder",
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              matchController.updateSelectedIndex(index);
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width:
                                        matchController.selectedindex.value ==
                                                index
                                            ? 1
                                            : 0.5,
                                    color:
                                        matchController.selectedindex.value ==
                                                index
                                            ? kthemecolor
                                            : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.25),
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Text(
                                                "A",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Batsman",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.max,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Assign Roles",
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 5.0),
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(2.5),
              //                   ),
              //                   child: Center(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         CircleAvatar(
              //                           radius: 25,
              //                           backgroundColor:
              //                               Colors.grey.withOpacity(0.25),
              //                           child: Center(
              //                             child: Text(
              //                               "A",
              //                               style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontWeight: FontWeight.bold,
              //                                   fontSize: 30),
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           "Admin",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(2.5),
              //                   ),
              //                   child: Center(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         CircleAvatar(
              //                           radius: 25,
              //                           backgroundColor: Colors.teal,
              //                           child: Center(
              //                             child: Text(
              //                               "C",
              //                               style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontWeight: FontWeight.bold,
              //                                   fontSize: 30),
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           "Captain",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(2.5),
              //                   ),
              //                   child: Center(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         CircleAvatar(
              //                           radius: 25,
              //                           backgroundColor:
              //                               Colors.grey.withOpacity(0.25),
              //                           child: Center(
              //                             child: Stack(
              //                               children: [
              //                                 Center(
              //                                     child: Icon(
              //                                   CupertinoIcons.hand_raised_fill,
              //                                   color: Colors.black,
              //                                   size: 35,
              //                                 )),
              //                                 Center(
              //                                     child: Text(
              //                                   "WK",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontWeight: FontWeight.bold,
              //                                       fontSize: 15),
              //                                 )),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           "Wicket Keeper",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 5.0),
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(2.5),
              //                   ),
              //                   child: Center(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         CircleAvatar(
              //                           radius: 25,
              //                           backgroundColor:
              //                               Colors.grey.withOpacity(0.25),
              //                           child: Center(
              //                             child: Icon(
              //                                 Icons.sports_football_rounded,
              //                                 color: Colors.white),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           "Batter",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(2.5),
              //                   ),
              //                   child: Center(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         CircleAvatar(
              //                           radius: 25,
              //                           backgroundColor:
              //                               Colors.grey.withOpacity(0.25),
              //                           child: Center(
              //                             child: Icon(Icons.sports_basketball,
              //                                 color: Colors.white),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           "Bowler",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(2.5),
              //                   ),
              //                   child: Center(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         CircleAvatar(
              //                           radius: 25,
              //                           backgroundColor:
              //                               Colors.grey.withOpacity(0.25),
              //                           child: Center(
              //                             child: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.center,
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.center,
              //                               children: [
              //                                 Icon(
              //                                   Icons.sports_football_rounded,
              //                                   color: Colors.white,
              //                                   size: 15,
              //                                 ),
              //                                 SizedBox(
              //                                   width: 2.5,
              //                                 ),
              //                                 Icon(
              //                                   Icons.sports_basketball,
              //                                   color: Colors.white,
              //                                   size: 15,
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           "All Rounder",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                      height: 45,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          "CANCEL",
                          style: TextStyle(color: kwhite),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: kthemecolor,
                      height: 45,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          "OK",
                          style: TextStyle(color: kwhite),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        });

    // SELECTED AREA
    if (result == null) return;

    setState(() {});
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Sorting by $result")));
  }
}
