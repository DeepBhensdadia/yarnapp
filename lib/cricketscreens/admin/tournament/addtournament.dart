import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/widgets/tournamenttextfield.dart';
import '../../../const/const.dart';
import '../../../constcolor.dart';
import '../../getx/tournamentcontroller.dart';

class addtournament extends StatefulWidget {
  const addtournament({super.key});

  @override
  State<addtournament> createState() => _addtournamentState();
}

class _addtournamentState extends State<addtournament> {
  TournamentController tournamentController = Get.put(TournamentController());

  @override
  void initState() {
    tournamentController.getTournamenttypeDataFromAPI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
          backgroundColor: kthemecolor,
          title: Text("Add Tournament"),
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
                  TournamentTextFormField(
                    controller: tournamentController.name,
                    labelText: "Tournament Name",
                    keyboardType: TextInputType.text,
                    hintText: "Enter Tournament Name",
                  ),
                  TournamentTextFormField(
                    controller: tournamentController.location,
                    labelText: "Tournament Location",
                    keyboardType: TextInputType.text,
                    hintText: "Enter Tournament Location",
                  ),
                  TournamentTextFormField(
                    controller: tournamentController.adress,
                    labelText: "Tournament Adress",
                    keyboardType: TextInputType.text,
                    hintText: "Enter Tournament Adress",
                  ),
                  TournamentTextFormField(
                    controller: tournamentController.description,
                    labelText: "Tournament description",
                    keyboardType: TextInputType.text,
                    hintText: "Enter Tournament description",
                  ),
                  Obx(
                    () => tournamentController.tournamenttypebool == false
                        ? SizedBox()
                        : TournamentDropdown(
                            count: tournamentController.gettype
                                .map((e) => DropdownMenuItem<String>(
                                value: e.id.toString(), child: Text(e.name ?? "")))
                                .toList(),
                            onchange: (p0) {
                              tournamentController.tournamnettype.text = p0 ?? "";
                            },
                            validator: (p0) {},
                            lable: "Select Tournament Type",
                          ),
                  ),
                  TextButton(
                      onPressed: () {
                        tournamentController.AddTournamentFromAPI();
                      },
                      child: Text("Updated"))
                ],
              ),
            )),
      ),
    );
  }
}
