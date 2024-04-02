import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/audiance/playerslistaudiance.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../services/app_url.dart';
import '../admin/player/playerslistscreen.dart';
import '../getx/audiance/tournamentshow.dart';
import '../model/tournamentdetailresponse.dart';
import '../photoscreen.dart';

class TeamListAudiance extends StatefulWidget {
  const TeamListAudiance({super.key});

  @override
  State<TeamListAudiance> createState() => _TeamListAudianceState();
}

class _TeamListAudianceState extends State<TeamListAudiance> {
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      body: Obx(() => tournamentAudiance.gettournadetai.isFalse
          ? Center(
              child: CircularProgressIndicator(),
            )
          : tournamentAudiance.getteaminfo.isEmpty
              ? Center(
                  child: Text('No Data Found...'),
                )
              : Container(
                  color: MyTheme.scaffoldColor,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Container(
                      decoration: decration,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: tournamentAudiance.getteaminfo.length,
                              // shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                TeamAudiance team =
                                    tournamentAudiance.getteaminfo[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 0, top: 15),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, top: 00),
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(8),
                                        visualDensity: VisualDensity.compact,
                                        onTap: () {
                                          Get.to(PlayersListAudiance(
                                              teamid: team));
                                        },
                                        // minVerticalPadding: 20,
                                        leading: PhotoScreencric(
                                          image: URLs.image_url_team +
                                              "${team.logo}",
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                team.teamName ??
                                                    "Channai Super King",
                                                textScaleFactor: 1.15,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(team.shortName ?? "CSK",
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    color: Colors.grey))
                                          ],
                                        ),
                                        // trailing: Icon(
                                        //     Icons.arrow_forward_ios_rounded,size: 15,)
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
                      )),
                )),
    );
  }
}
