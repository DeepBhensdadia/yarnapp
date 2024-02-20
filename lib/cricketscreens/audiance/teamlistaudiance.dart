import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/audiance/playerslistaudiance.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import '../admin/player/playerslistscreen.dart';


class TeamListAudiance extends StatefulWidget {
  const TeamListAudiance({super.key});

  @override
  State<TeamListAudiance> createState() => _TeamListAudianceState();
}

class _TeamListAudianceState extends State<TeamListAudiance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.scaffoldColor,

      height: double.maxFinite,
      width: double.maxFinite,

      child: Container(
        decoration: decration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  // shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(bottom: 0, top: 15),
                    child: Card(
                      margin: EdgeInsets.zero,
                      // color: ,
                      child: ListTile(
                        // dense: true,
                        visualDensity: VisualDensity.compact,
                        onTap: () {
                          Get.to(PlayersListAudiance());
                        },
                        // minVerticalPadding: 20,
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.black)),
                        ),
                        title: Text(
                          "India",
                          style: TextStyle(
                              color: CupertinoColors.black, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "IND",
                          style: TextStyle(
                              color: CupertinoColors.black, fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: CupertinoColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
