import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../constcolor.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../player/playerprofilescreen.dart';

class AddTeamScreen extends StatefulWidget {
  const AddTeamScreen({super.key});

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      body: SingleChildScrollView(
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
                  TournamentDropdown(
                    count: List.generate(
                      14,
                      (index) => DropdownMenuItem<String>(
                          value: "${index + 1}", child: Text("${index + 1}")),
                    ),
                    onchange: (p0) {},
                    validator: (p0) {},
                    lable: "Select Total Players",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
