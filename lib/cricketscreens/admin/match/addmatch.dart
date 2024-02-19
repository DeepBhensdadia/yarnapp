import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../widgets/tournamenttextfield.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({super.key});

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
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
        selectedStartDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        date.text = formattedDate;
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
        selectedTime = picked;
        String formattedTime = "${picked.hour}:${picked.minute}";
        time.text = formattedTime;
      });
    }
  }


  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,

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
                      TournamentTextFormField(
                        labelText: "Selct Match Location",
                        keyboardType: TextInputType.text,
                        hintText: "",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TournamentTextFormField(
                        read: true,
                        ontap: () {
                          _selectStartDate(context);
                        },
                        controller: date,
                        labelText: "Selct Match Date",
                        keyboardType: TextInputType.text,
                        hintText: "",
                      ),
                      TournamentTextFormField(
                        read: true,
                        ontap: () {
                          _selectTime(context);
                        },
                        controller: time,
                        labelText: "Selct Match Time",
                        keyboardType: TextInputType.text,
                        hintText: "",
                      ),
                      TournamentTextFormField(
                        labelText: "Umpire Name",
                        keyboardType: TextInputType.text,
                        hintText: "Enter Umpire Name",
                      ),    TournamentTextFormField(
                        labelText: "Description",
                        keyboardType: TextInputType.text,
                        hintText: "Enter Description",
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
