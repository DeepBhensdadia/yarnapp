import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../player/playerprofilescreen.dart';

class AddTeamScreen extends StatefulWidget {
  const AddTeamScreen({super.key});

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text("Add Team"),
        actions: [
          TextButton(
              onPressed: () {
                // tournamentController.AddTournamentFromAPI();
              },
              child: Text(
                "Save",
                style: TextStyle(color: kwhite),
              ))
        ],
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
                    Addphoto(),
                    TournamentTextFormField(
                      labelText: "Team Name",
                      keyboardType: TextInputType.text,
                      hintText: "Enter Team Name",
                    ),
                    TournamentTextFormField(
                      labelText: "Team Short Name",
                      keyboardType: TextInputType.text,
                      hintText: "Enter Team Name",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Status",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kthemecolor),
                          ),
                        ),
                        Switch(
                          activeColor: kthemecolor,
                          value: status,
                          onChanged: (value) {
                            setState(() {
                              status = value;
                            });
                          },
                        )
                      ],
                    ),
                    // TournamentDropdown(
                    //   count: List.generate(
                    //     14,
                    //     (index) => DropdownMenuItem<String>(
                    //         value: "${index + 1}", child: Text("${index + 1}")),
                    //   ),
                    //   onchange: (p0) {},
                    //   validator: (p0) {},
                    //   lable: "Select Total Players",
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
        ),
      ),
    ));
  }
}
