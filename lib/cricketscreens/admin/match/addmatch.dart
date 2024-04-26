import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yarn_modified/cricketscreens/model/matchlistmode.dart';

import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../getx/matchcontroller.dart';
import '../../getx/teamcontroller.dart';
import '../../model/tournamentdetailresponse.dart';
import '../../model/tournamentlist.dart';

class AddMatchScreen extends StatefulWidget {
  final Tournamentdetails tournametid;
  final Matchinfo? matchdetail;
  const AddMatchScreen(
      {super.key, required this.tournametid, this.matchdetail});

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  TeamController teamcontroller = Get.put(TeamController());
  MatchController matchController = Get.put(MatchController());

  @override
  void initState() {
    matchController.team1.clear();
    matchController.team2.clear();
    matchController.Location.clear();
    matchController.upmire.clear();
    matchController.matchdate.clear();
    matchController.matchtime.clear();
    matchController.description.clear();

    if (widget.matchdetail != null) {
      matchController.team1.text =
          widget.matchdetail?.team1?.id.toString() ?? "";
      matchController.team2.text =
          widget.matchdetail?.team2?.id.toString() ?? "";
      matchController.Location.text =
          widget.matchdetail?.venue?.toString() ?? "";
      matchController.description.text =
          widget.matchdetail?.description?.toString() ?? "";
      matchController.matchtime.text =
          widget.matchdetail?.matchTime?.toString() ?? "";
      matchController.matchdate.text =
          widget.matchdetail?.matchdateformat().toString() ?? "";
      matchController.upmire.text =
          widget.matchdetail?.umpires?.toString() ?? "";
      matchController.overs.text =
          widget.matchdetail?.overseas?.toString() ?? "";
      matchController.matchtype.text =
          widget.matchdetail?.matchType?.toString() ?? "";
    } else {
      matchController.Location.text = widget.tournametid.address.toString();
    }
    teamcontroller.getTeamDataFromAPI(id: widget.tournametid.id.toString());
    super.initState();
  }

  DateTime selectedStartDate = DateTime.now();
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        editedt = true;
        selectedStartDate = picked;
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        matchController.matchdate.text = formattedDate;
      });
    }
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        editedt = true;
        selectedTime = picked;

        // Format the selected time as "15:26:00"
        String formattedTime = DateFormat('HH:mm').format(
          DateTime(2024, 2, 2, picked.hour, picked.minute),
        );

        matchController.matchtime.text = formattedTime;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool editedt = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return editedt == true
            ? showdialogboxalert(
                context,
                widget.matchdetail != null
                    ? "Do you want to exit without Updating?"
                    : "Do you want to exit without Saving?")
            : Future.value(true);
      },
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            widget.matchdetail != null ? "Edit Match" : "Add Match",
            textScaleFactor: 1,
            style:
                TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
          ),
          // centerTitle: true,
          backgroundColor: MyTheme.appBarColor,
          elevation: 5,
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.20),
                  Colors.white.withOpacity(0.15),
                  Colors.white.withOpacity(0.025),
                  Colors.transparent,
                ],
              ),
            ),
          ),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Obx(
                          () => TournamentDropdown(
                            initialValue:
                                widget.matchdetail?.team1?.id.toString(),
                            count: teamcontroller.getteams
                                .where((p0) =>
                                    p0.id.toString() !=
                                    matchController.team2.text)
                                .map((e) => DropdownMenuItem<String>(
                                    value: "${e.id}",
                                    child: Text("${e.teamName}")))
                                .toList(),
                            onchange: (p0) {
                              setState(() {
                                editedt = true;
                              });
                              matchController.team1.text = p0.toString();
                            },
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return "Select First Team";
                              }
                              return null;
                            },
                            lable: "Select First Team",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TournamentDropdown(
                            initialValue:
                                widget.matchdetail?.team2?.id.toString(),
                            count: teamcontroller.getteams
                                .where((p0) =>
                                    p0.id.toString() !=
                                    matchController.team1.text)
                                .map((e) => DropdownMenuItem<String>(
                                    value: "${e.id}",
                                    child: Text("${e.teamName}")))
                                .toList(),
                            onchange: (p0) {
                              setState(() {
                                editedt = true;
                              });
                              matchController.team2.text = p0.toString();
                            },
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return "Select Second Team";
                              }
                              return null;
                            },
                            lable: "Select Second Team",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TournamentTextFormField(
                          maxlength: 50,
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Match Address";
                            }
                            return null;
                          },
                          controller: matchController.Location,
                          labelText: "Match Address",
                          keyboardType: TextInputType.text,
                          hintText: "",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Match Date";
                            }
                            return null;
                          },
                          read: true,
                          ontap: () {
                            _selectStartDate(context);
                          },
                          controller: matchController.matchdate,
                          labelText: "Select Match Date",
                          keyboardType: TextInputType.text,
                          hintText: "",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Match Time";
                            }
                            return null;
                          },
                          read: true,
                          ontap: () {
                            _selectTime(context);
                          },
                          controller: matchController.matchtime,
                          labelText: "Select Match Time",
                          keyboardType: TextInputType.text,
                          hintText: "",
                        ),
                        TournamentDropdown(
                          initialValue: widget.matchdetail?.matchType != null
                              ? widget.matchdetail?.matchType.toString()
                              : null,
                          count: [
                            DropdownMenuItem<String>(
                                value: "Early", child: Text("Early")),
                            DropdownMenuItem<String>(
                                value: "Quaterfinal",
                                child: Text("Quaterfinal")),
                            DropdownMenuItem<String>(
                                value: "Semifinal", child: Text("Semifinal")),
                            DropdownMenuItem<String>(
                                value: "Final", child: Text("Final")),
                          ],
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                            matchController.matchtype.text = p0.toString();
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select Match Type";
                            }
                            return null;
                          },
                          lable: "Select Match Type",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Match Umpire";
                            }
                            return null;
                          },
                          controller: matchController.upmire,
                          labelText: "Umpire Name",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Umpire Name",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          // validatorfield: (p0) {
                          //   if (p0!.isEmpty) {
                          //     return "Enter Match Description";
                          //   }
                          //   return null;
                          // },
                          controller: matchController.description,
                          labelText: "Description",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Description",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          // validatorfield: (p0) {
                          //   if (p0!.isEmpty) {
                          //     return "Enter Match Description";
                          //   }
                          //   return null;
                          // },
                          controller: matchController.overs,
                          labelText: "Match Overs",
                          keyboardType: TextInputType.number,
                          hintText: "Enter Description",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Total Player";
                            }
                            return null;
                          },
                          controller: matchController.totalplayers,
                          labelText: "Match Total Player",
                          keyboardType: TextInputType.number,
                          hintText: "Enter Description",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              widget.matchdetail != null
                                  ? matchController.EditmatchFromAPI(
                                      tournamentid:
                                          widget.tournametid.id.toString(),
                                      id: widget.matchdetail?.id.toString() ??
                                          "")
                                  : matchController.AddmatchFromAPI(
                                      tournamentid:
                                          widget.tournametid.id.toString());
                            }
                            // Get.to(TournamentScreenPlayer());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            padding: EdgeInsets.all(10),
                            child: Center(
                                child: Text(
                              widget.matchdetail != null ? "Update" : "Save",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: kwhite),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
