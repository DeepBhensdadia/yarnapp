import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/helper.dart';

import '../../../../constcolor.dart';

import '../../../const/themes.dart';
import '../../../services/app_url.dart';
import '../../getx/teamcontroller.dart';
import '../../model/tournamentlist.dart';
import '../../photoscreen.dart';
import '../player/playerslistscreen.dart';
import 'addteamscreen.dart';

class TeamScreen extends StatefulWidget {
  final Tournamentdetails tournamentid;
  const TeamScreen({super.key, required this.tournamentid});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen>
    with SingleTickerProviderStateMixin {
  TeamController teamcontroller = Get.put(TeamController());
  @override
  void initState() {
    teamcontroller.getTeamDataFromAPI(id: widget.tournamentid.id.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      teamcontroller.tournamenttypebool.isFalse
                          ? SizedBox()
                          : teamcontroller.getteams.isEmpty
                              ? Container(
                                  height: screenheight(context, dividedby: 1.5),
                                  child: Center(
                                    child: Text("No data Found"),
                                  ))
                              : ListView.builder(
                                  itemCount: teamcontroller.getteams.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, top: 10),
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(8),
                                        visualDensity: VisualDensity.compact,
                                        onTap: () {
                                          Get.to(PlayersListScreen(
                                              teamid: teamcontroller
                                                  .getteams[index]));
                                        },
                                        // minVerticalPadding: 20,
                                        leading: PhotoScreencric(
                                          image: URLs.image_url_team +
                                              "${teamcontroller.getteams[index].logo}",
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${teamcontroller.getteams[index].teamName}",
                                                textScaleFactor: 1.15,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                "${teamcontroller.getteams[index].shortName}",
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    color: Colors.grey))
                                          ],
                                        ),

                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Visibility(
                                                visible: teamcontroller
                                                            .getteams[index]
                                                            .status ==
                                                        1
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
                                                if (value == "1") {
                                                  Get.to(AddTeamScreen(
                                                    teamdetails: teamcontroller
                                                        .getteams[index],
                                                    tournamentid: teamcontroller
                                                        .getteams[index]
                                                        .tournamentId
                                                        .toString(),
                                                  ));
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
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                          content: Text(
                                                            "Do you want to Delete this Team?",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                // fontWeight: FontWeight.w600,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
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
                                                                onPressed: () {
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
                                                                      color: Colors
                                                                          .black),
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
                                                                  teamcontroller.DeleteTeamFromAPI(
                                                                      id: teamcontroller
                                                                          .getteams[
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      tournamentid: teamcontroller
                                                                          .getteams[
                                                                              index]
                                                                          .tournamentId
                                                                          .toString());
                                                                },
                                                                child: Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white70),
                                                                )),
                                                          ],
                                                        );
                                                      });
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) => [
                                                PopupMenuItem(
                                                  value: '1',
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
                                  ),
                                ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(AddTeamScreen(
                    tournamentid: widget.tournamentid.id.toString()));
              },
              child: Container(
                height: 50,
                color: darkBlue,
                child: Center(
                  child: Text(
                    "Add Team",
                    style: TextStyle(
                        letterSpacing: 0.6,
                        color: kwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
