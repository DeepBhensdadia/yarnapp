import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/player/playerprofilescreen.dart';

import '../../const/const.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../widgets/tournamenttextfield.dart';
import '../getx/usercontroller.dart';
import 'tournamentscreen.dart';

class AddPlayerDetails extends StatefulWidget {
  const AddPlayerDetails({super.key});

  @override
  State<AddPlayerDetails> createState() => _AddPlayerDetailsState();
}

class _AddPlayerDetailsState extends State<AddPlayerDetails> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,

        appBar: AppBar(
            backgroundColor: kthemecolor,
            title: Text("Create Player"),
            ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: decration,
          child: SingleChildScrollView(
            child: Card(
                margin: EdgeInsets.all(15),
                elevation: 2.5,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: defaultCardRadius),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TournamentTextFormField(
                        controller: userController.playername,
                        labelText: "Player Name",
                        keyboardType: TextInputType.text,
                        hintText: "Enter Player Name",
                      ),
                      TournamentTextFormField(
                        controller: userController.skill,
                        labelText: "Player Skill",
                        keyboardType: TextInputType.text,
                        hintText: "Enter Player Skill",
                      ),
                      TournamentTextFormField(
                        controller: userController.nickname,
                        labelText: "Player Nickname",
                        keyboardType: TextInputType.text,
                        hintText: "Enter Player Nickname",
                      ),
                      TournamentDropdown(
                        count: [
                          DropdownMenuItem<String>(
                              value: "Right Hended Bat",
                              child: Text("Right Hended Bat")),
                          DropdownMenuItem<String>(
                              value: "Left Hended Bat",
                              child: Text("Left Hended Bat")),
                        ],
                        onchange: (p0) {
                          userController.battingstyle.text = p0 ?? "";
                        },
                        validator: (p0) {},
                        lable: "Select Player Batting Style",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TournamentDropdown(
                        count: [
                          DropdownMenuItem<String>(
                              value: "Right arm Bowling",
                              child: Text("Right arm Bowling")),
                          DropdownMenuItem<String>(
                              value: "Left arm Bowling",
                              child: Text("Left  arm Bowling")),
                        ],
                        onchange: (p0) {
                          userController.bowlingstyle.text = p0 ?? "";
                        },
                        validator: (p0) {},
                        lable: "Select Player Bowling Style",
                      ),
                      TournamentTextFormField(
                        controller: userController.weight,
                        labelText: "Player weight",
                        keyboardType: TextInputType.text,
                        hintText: "Enter weight",
                      ),
                      TournamentTextFormField(
                        controller: userController.age,
                        labelText: "Player Age",
                        keyboardType: TextInputType.text,
                        hintText: "Enter Age",
                      ),
                      TournamentDropdown(
                        count: [
                          DropdownMenuItem<String>(
                              value: "Batting", child: Text("Batting")),
                          DropdownMenuItem<String>(
                              value: " Bowling", child: Text("Bowling")),
                          DropdownMenuItem<String>(
                              value: "All Rounder", child: Text("All Rounder")),
                        ],
                        onchange: (p0) {
                          userController.fistpref.text = p0 ?? "";
                        },
                        validator: (p0) {},
                        lable: "Select First Prefrence",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TournamentDropdown(
                        count: [
                          DropdownMenuItem<String>(
                              value: "Fast", child: Text("Fast")),
                          DropdownMenuItem<String>(
                              value: "Slow", child: Text("Slow")),
                          DropdownMenuItem<String>(
                              value: "Mediam", child: Text("Mediam")),
                        ],
                        onchange: (p0) {
                          userController.bowlingpace.text = p0 ?? "";
                        },
                        validator: (p0) {},
                        lable: "Select Bowling pace",
                      ),
                      // Obx(
                      //   () => tournamentController.tournamenttypebool == false
                      //       ? SizedBox()
                      //       : TournamentDropdown(
                      //           count: tournamentController.gettype
                      //               .map((e) => DropdownMenuItem<String>(
                      //                   value: e.id.toString(),
                      //                   child: Text(e.name ?? "")))
                      //               .toList(),
                      //           onchange: (p0) {
                      //             tournamentController.tournamnettype.text =
                      //                 p0 ?? "";
                      //           },
                      //           validator: (p0) {},
                      //           lable: "Select Tournament Type",
                      //         ),
                      // ),

                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(TournamentScreenPlayer());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kthemecolor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 45,
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: kwhite),
                          )),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
