import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../constcolor.dart';
import '../../../widgets/tournamenttextfield.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({super.key});

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kthemecolor,
          title: Text("Add Match"),
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
                    TournamentDropdown(
                      count: List.generate(
                        8,
                        (index) => DropdownMenuItem<String>(
                            value: "Team ${index + 1}",
                            child: Text("Team ${index + 1}")),
                      ),
                      onchange: (p0) {},
                      validator: (p0) {},
                      lable: "Select First Team",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TournamentDropdown(
                      count: List.generate(
                        8,
                        (index) => DropdownMenuItem<String>(
                            value: "Team ${index + 1}",
                            child: Text("Team ${index + 1}")),
                      ),
                      onchange: (p0) {},
                      validator: (p0) {},
                      lable: "Select Second Team",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TournamentDropdown(
                      count: List.generate(
                        8,
                        (index) => DropdownMenuItem<String>(
                            value: "Surat Ground ${index + 1}",
                            child: Text("Surat Ground ${index + 1}")),
                      ),
                      onchange: (p0) {},
                      validator: (p0) {},
                      lable: "Select Location",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TournamentTextFormField(
                      labelText: "Selct Match Date",
                      keyboardType: TextInputType.text,
                      hintText: "",
                    ),
                    TournamentTextFormField(
                      labelText: "Selct Match Time",
                      keyboardType: TextInputType.text,
                      hintText: "",
                    ),
                    TournamentTextFormField(
                      labelText: "Umpire Name",
                      keyboardType: TextInputType.text,
                      hintText: "Enter Umpire Name",
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
