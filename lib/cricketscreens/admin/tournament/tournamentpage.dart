import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/helper.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../services/app_url.dart';
import '../../getx/tournamentcontroller.dart';
import '../../model/tournamentlist.dart';

import '../../photoscreen.dart';
import 'tornamenttab.dart';
import 'addtournament.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key});

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  TournamentController tournamentController = Get.put(TournamentController());
  @override
  void initState() {
    tournamentController.getTournamentDataFromAPI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Tournament',
          textScaleFactor: 1,
          style: TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: GetBuilder<TournamentController>(
          builder: (controller) => controller.tournamentbool == false
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    controller.getData.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text('No Data Found...'),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: controller.getData.length,
                                    itemBuilder: (context, index) {
                                      Tournamentdetails data =
                                          controller.getData[index];
                                      return Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Card(
                                          elevation: 5,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: ListTile(
                                            // horizontalTitleGap: 5,
                                            contentPadding: EdgeInsets.only(
                                                top: 8, bottom: 8, left: 8),
                                            visualDensity:
                                                VisualDensity.compact,
                                            onTap: () {
                                              Get.to(TournamentTabs(
                                                teamid: data,
                                              ));
                                            },
                                            // visualDensity: VisualDensity.compact,
                                            // dense: true,

                                            title: Row(
                                              children: [
                                                PhotoScreencric(
                                                  image:
                                                      URLs.image_url_tournament +
                                                          "${data.logo}",
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  width: screenwidth(context,
                                                      dividedby: 2),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          maxLines: 2,
                                                          data.tournamentName ??
                                                              '',
                                                          textScaleFactor: 1.15,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          )),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(data.location ?? '',
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          '${data.startdateformat()}  to  ${data.enddateformat()}',
                                                          textScaleFactor: 0.9,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: data.status == 1
                                                        ? false
                                                        : true,
                                                    child: Icon(
                                                        FontAwesomeIcons.ban,
                                                        size: 18)),
                                                PopupMenuButton(
                                                  // offset: Offset(0, 50), // Adjust the offset as needed
                                                  icon: Icon(
                                                    Icons.more_vert_outlined,
                                                  ),
                                                  onSelected: (value) {
                                                    if (value == "item1") {
                                                      Get.to(addtournament(
                                                          edited: data));
                                                    } else {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              title: Text(
                                                                "Alert",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                              content: Text(
                                                                "Do you want to Delete this Tournament?",
                                                                style:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        // fontWeight: FontWeight.w600,
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.6)),
                                                              ),
                                                              actions: <Widget>[
                                                                ElevatedButton(
                                                                    style: TextButton.styleFrom(
                                                                        elevation:
                                                                            5,
                                                                        surfaceTintColor:
                                                                            Colors
                                                                                .grey,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .white70),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(
                                                                              false);
                                                                    },
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.black),
                                                                    )),
                                                                ElevatedButton(
                                                                    style: TextButton.styleFrom(
                                                                        elevation:
                                                                            5,
                                                                        surfaceTintColor: Colors
                                                                            .red
                                                                            .withOpacity(
                                                                                0.3),
                                                                        foregroundColor:
                                                                            Colors
                                                                                .red,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red),
                                                                    onPressed:
                                                                        () async {
                                                                      tournamentController.DeleteTournamentFromAPI(
                                                                          id: data
                                                                              .id
                                                                              .toString());
                                                                    },
                                                                    child: Text(
                                                                      "Delete",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.white70),
                                                                    )),
                                                              ],
                                                            );
                                                          });
                                                    }
                                                  },
                                                  itemBuilder:
                                                      (BuildContext context) =>
                                                          [
                                                    PopupMenuItem(
                                                      value: 'item1',
                                                      child: Text('Edit'),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 'item2',
                                                      child: Text('Delete'),
                                                    ),
                                                    // Add more menu items as needed
                                                  ],
                                                  // iconSize: 20,
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        Get.to(addtournament());
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: darkBlue,
                        ),
                        child: Center(
                          child: Text(
                            "Add Tournament",
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 16,
                                letterSpacing: 0.65,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       color: darkBlue,
                      //     ),
                      //
                      // ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
