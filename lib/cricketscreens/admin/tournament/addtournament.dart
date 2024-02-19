import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yarn_modified/widgets/tournamenttextfield.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../getx/tournamentcontroller.dart';
import '../../player/playerprofilescreen.dart';

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

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        tournamentController.startdate.text = formattedDate;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        tournamentController.enddate.text = formattedDate;
      });
    }
  }


  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text("Add Tournament"),
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
                    Row(
                      children: [
                        Expanded(
                          child: TournamentTextFormField(
                            read: true,
                            ontap: () {
                              _selectStartDate(context);
                            },
                            controller: tournamentController.startdate,
                            labelText: "Start Date",
                            keyboardType: TextInputType.text,
                            hintText: "Enter Tournament description",
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TournamentTextFormField(
                            read: true,
                            ontap: () {
                               _selectEndDate(context);
                            },
                            controller: tournamentController.enddate,
                            labelText: "End Date",
                            keyboardType: TextInputType.text,
                            hintText: "Enter Tournament description",
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => tournamentController.tournamenttypebool == false
                          ? SizedBox()
                          : TournamentDropdown(
                              count: tournamentController.gettype
                                  .map((e) => DropdownMenuItem<String>(
                                      value: e.id.toString(),
                                      child: Text(e.name ?? "")))
                                  .toList(),
                              onchange: (p0) {
                                tournamentController.tournamnettype.text =
                                    p0 ?? "";
                              },
                              validator: (p0) {},
                              lable: "Select Tournament Type",
                            ),
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
                    TextButton(
                        onPressed: () {
                          tournamentController.AddTournamentFromAPI();
                        },
                        child: Text("Updated"))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
