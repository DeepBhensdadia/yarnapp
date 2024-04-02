import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import '../../../const/themes.dart';
import '../../../services/app_url.dart';
import '../admin/player/playerprofileadmin.dart';
import '../getx/usercontroller.dart';
import '../model/searchplayerresponse.dart';
import '../photoscreen.dart';
import 'addplayerdetails.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({
    super.key,
  });

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen>
    with SingleTickerProviderStateMixin {
  UserController userController = Get.put(UserController());

  late TabController _tabController;
  bool dataall = false;
  @override
  void initState() {
    playerdata = userController.playerdata.value;
    if (userController.playerdata != null) dataall = true;
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  late PlayerDetails playerdata;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      playerdata = userController.playerdata.value;
      return Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            dataall ? playerdata.playerName ?? '' : 'Deep Bhensdadia',
            textScaleFactor: 1,
            style:
                TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(AddPlayerDetails(data: playerdata));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              color: Cricket_SkyBlue_Color,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(7.5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  dividerColor: kthemecolor,
                  indicatorColor: kthemecolor,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      color: kthemecolor),
                  labelColor: kwhite,
                  unselectedLabelColor: kthemecolor,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  tabs: [
                    Tab(
                      text: 'PROFILE',
                    ),
                    Tab(
                      text: "MATCHES",
                    ),
                    Tab(
                      text: 'TEAMS',
                    ),
                    Tab(
                      text: 'STATS',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: decration,
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: PhotoScreencric(
                                          dobbn: 35,
                                          image: URLs.image_url_player +
                                              "${playerdata.logo}",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dataall
                                                  ? playerdata.playerName ?? ''
                                                  : "Deep Bhensdadia",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            // SizedBox(height: 5),
                                            // Text(
                                            //   "Age :-  ${dataall ? playerdata.age ?? '   ---' : "23"}",
                                            //   style: TextStyle(fontSize: 14,color:Cricket_textColorSecondary ),
                                            // ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            InkWell(
                                              onTap: () {},
                                              child: Card(
                                                margin: EdgeInsets.zero,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: darkBlue),
                                                  height: 25,
                                                  width: 100,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Follow",
                                                        style: TextStyle(
                                                            color: kwhite),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                            Container(
                              width: screenwidth(context, dividedby: 1),
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Age",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataall
                                                ? playerdata.calAge
                                                        .toString() ??
                                                    ''
                                                : "23",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Location",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataall
                                                ? playerdata.city.toString() ??
                                                    ''
                                                : "surat",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Playing Role",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataall
                                                ? playerdata.skills ?? ''
                                                : "----",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Batting Style",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataall
                                                ? playerdata.battingStyle ?? ''
                                                : "RHB (Right Handed Batsman)",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bowling Style",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataall
                                                ? playerdata.bowlingStyle ?? ''
                                                : "----",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        height: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Wicket Keeping",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataall
                                                ? playerdata.wicketKeeper ?? ''
                                                : "Yes",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Playermatches(),
                    Playerteams(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.wine_bar_rounded,
                        //   color: Colors.black,
                        //   size: 100,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("No Data.",
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// class PlayerTeams extends StatefulWidget {
//   const PlayerTeams({super.key});
//
//   @override
//   State<PlayerTeams> createState() => _PlayerTeamsState();
// }
//
// class _PlayerTeamsState extends State<PlayerTeams> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyTheme.scaffoldColor,
//       body: Obx(() => tournamentAudiance.gettournadetai.isFalse
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : tournamentAudiance.getteaminfo.isEmpty
//               ? Center(
//                   child: Text('No Data Found...'),
//                 )
//               : Container(
//                   color: MyTheme.scaffoldColor,
//                   height: double.maxFinite,
//                   width: double.maxFinite,
//                   child: Container(
//                       decoration: decration,
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: tournamentAudiance.getteaminfo.length,
//                               // shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 15,
//                               ),
//                               // physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 TeamAudiance team =
//                                     tournamentAudiance.getteaminfo[index];
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.only(bottom: 0, top: 15),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         bottom: 0, top: 00),
//                                     child: Card(
//                                       margin: EdgeInsets.zero,
//                                       child: ListTile(
//                                         contentPadding: EdgeInsets.all(8),
//                                         visualDensity: VisualDensity.compact,
//                                         onTap: () {
//                                           Get.to(PlayersListAudiance(
//                                               teamid: team));
//                                         },
//                                         // minVerticalPadding: 20,
//                                         leading: PhotoScreencric(
//                                           image: URLs.image_url_team +
//                                               "${team.logo}",
//                                         ),
//                                         title: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                                 team.teamName ??
//                                                     "Channai Super King",
//                                                 textScaleFactor: 1.15,
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                 )),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(team.shortName ?? "CSK",
//                                                 textScaleFactor: 1,
//                                                 style: TextStyle(
//                                                     color: Colors.grey))
//                                           ],
//                                         ),
//                                         // trailing: Icon(
//                                         //     Icons.arrow_forward_ios_rounded,size: 15,)
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             SizedBox(
//                               height: 15,
//                             )
//                           ],
//                         ),
//                       )),
//                 )),
//     );
//     ;
//   }
// }
