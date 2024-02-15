import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constcolor.dart';

import '../player/playerslistscreen.dart';
import 'addteamscreen.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              // shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  color: Color(0xffeeeeee),
                  child: ListTile(
                    onTap: () {
                     Get.to(PlayersListScreen());
                    },
                    minVerticalPadding: 20,
                    leading: Container(
                      height: 50,width: 50,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: CupertinoColors.black)),
                    ),
                    title: Text("Team ${index + 1}",style: TextStyle(color: CupertinoColors.black,fontWeight: FontWeight.bold),),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(AddTeamScreen());
            },
            child: Container(
              height: 50,
              color: kthemecolor,
              child: Center(
                child: Text(
                  "Add Team",
                  style: TextStyle(
                      color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
