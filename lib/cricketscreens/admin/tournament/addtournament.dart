import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yarn_modified/widgets/tournamenttextfield.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../services/app_url.dart';
import '../../getx/tournamentcontroller.dart';
import '../../model/tournamentlist.dart';

class addtournament extends StatefulWidget {
  final Tournamentdetails? edited;
  const addtournament({
    super.key,
    this.edited,
  });

  @override
  State<addtournament> createState() => _addtournamentState();
}

class _addtournamentState extends State<addtournament> {
  TournamentController tournamentController = Get.put(TournamentController());

  @override
  void initState() {
    tournamentController.name.clear();
    tournamentController.location.clear();
    tournamentController.adress.clear();
    tournamentController.description.clear();
    tournamentController.startdate.clear();
    tournamentController.enddate.clear();
    tournamentController.Organizedname.clear();
    if (widget.edited != null) {
      tournamentController.name.text = widget.edited?.tournamentName ?? "";
      tournamentController.location.text = widget.edited?.location ?? "";
      tournamentController.adress.text = widget.edited?.address ?? "";
      tournamentController.description.text = widget.edited?.description ?? "";
      tournamentController.crickettype.text = widget.edited?.cricketType ?? "";
      tournamentController.balltype.text = widget.edited?.ballType ?? "";
      tournamentController.Organizedname.text =
          widget.edited?.organizationName.toString() ?? "";
      tournamentController.startdate.text =
          widget.edited?.startdateformat().toString() ?? "";
      tournamentController.enddate.text =
          widget.edited?.enddateformat().toString() ?? "";
      status = widget.edited?.status == 1 ? true : false;
      // tournamentController.enddate.text = widget.edited?.description.toString() ?? "";
    }
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
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
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
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        tournamentController.enddate.text = formattedDate;
      });
    }
  }

  File? _image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        editedt = true;
      });
      _image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  bool editedt = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return editedt == true
            ? showdialogboxalert(
                context,
                widget.edited != null
                    ? "Do you want to exit without Updating?"
                    : "Do you want to exit without Saving?")
            : Future.value(true);
      },
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "${widget.edited != null ? "Edit" : "Add"} Tournament",
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
                        Center(
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 190, maxHeight: 190),
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Material(
                                      elevation: 0,
                                      shape: CircleBorder(
                                          side: BorderSide(
                                              width: 1.5, color: Colors.grey)),
                                      clipBehavior: Clip.antiAlias,
                                      color: Colors.white,
                                      child: _image == null
                                          ? widget.edited != null
                                              ? Ink.image(
                                                  image: NetworkImage(URLs
                                                          .image_url_tournament +
                                                      "${widget.edited?.logo}"),
                                                  fit: BoxFit.contain,
                                                  width: 220,
                                                  height: 220,
                                                  child: InkWell(
                                                    radius: 0,
                                                    onTap: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder: (_) => Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 50,
                                                                    right: 50),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        URLs.image_url_tournament +
                                                                            "${widget.edited?.logo}"),
                                                                    fit: BoxFit
                                                                        .contain),
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              : Ink.image(
                                                  image: AssetImage(
                                                      "images/avatar.png"),
                                                  fit: BoxFit.contain,
                                                  width: 220,
                                                  height: 220,
                                                  child: InkWell(
                                                    radius: 0,
                                                    onTap: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder: (_) => Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 50,
                                                                    right: 50),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "images/avatar.png"),
                                                                    fit: BoxFit
                                                                        .contain),
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                          : Ink.image(
                                              image: FileImage(
                                                  File(_image!.path).absolute),
                                              fit: BoxFit.cover,
                                              width: 220,
                                              height: 220,
                                              child: InkWell(
                                                radius: 0,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (_) => Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 50,
                                                                right: 50),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    File(_image!
                                                                            .path)
                                                                        .absolute),
                                                                fit: BoxFit
                                                                    .fill),
                                                          ),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: -40,
                                  left: 70,
                                  child: Tooltip(
                                    message: 'Pick Image',
                                    child: RawMaterialButton(
                                      onPressed: () {
                                        getImage();
                                      },
                                      elevation: 2,
                                      fillColor: Colors.white,
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.grey,
                                      ),
                                      padding: EdgeInsets.all(7.5),
                                      shape: CircleBorder(
                                          side: BorderSide(color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          maxlength: 50,
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Tournament Name";
                            }
                          },
                          controller: tournamentController.name,
                          labelText: "Tournament Name",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Tournament Name",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Tournament City";
                            }
                          },
                          controller: tournamentController.location,
                          labelText: "Tournament City",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Tournament Location",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          maxlength: 50,
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Tournament Address";
                            }
                          },
                          controller: tournamentController.adress,
                          labelText: "Tournament Address",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Tournament Address",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          maxlength: 50,
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Tournament Description";
                            }
                          },
                          controller: tournamentController.description,
                          labelText: "Tournament Description",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Tournament Description",
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TournamentTextFormField(
                                onchange: (p0) {
                                  setState(() {
                                    editedt = true;
                                  });
                                },
                                validatorfield: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Select Start Date";
                                  }
                                },
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
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TournamentTextFormField(
                                onchange: (p0) {
                                  setState(() {
                                    editedt = true;
                                  });
                                },
                                validatorfield: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Select End Date";
                                  }
                                },
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
                        TournamentDropdown(
                          count: [
                            DropdownMenuItem<String>(
                                value: "Ground Cricket",
                                child: Text("Ground Cricket")),
                            DropdownMenuItem<String>(
                                value: "Box Cricket",
                                child: Text("Box Cricket")),
                            DropdownMenuItem<String>(
                                value: "Others", child: Text("Others")),
                          ],
                          onchange: (p0) {
                            tournamentController.crickettype.text = p0 ?? "";
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select Cricket Type";
                            }
                          },
                          lable: "Select Cricket Type",
                          initialValue: widget.edited?.cricketType ?? null,
                        ),
                        TournamentDropdown(
                          count: [
                            DropdownMenuItem<String>(
                                value: "Tennis Ball",
                                child: Text("Tennis Ball")),
                            DropdownMenuItem<String>(
                                value: "Leather Ball",
                                child: Text("Leather Ball")),
                            DropdownMenuItem<String>(
                                value: "Others", child: Text("Others")),
                          ],
                          onchange: (p0) {
                            tournamentController.balltype.text = p0 ?? "";
                          },
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return "Select Ball Type";
                            }
                          },
                          lable: "Select Ball Type",
                          initialValue: widget.edited?.ballType.toString(),
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          maxlength: 50,
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Organizer Name";
                            }
                          },
                          controller: tournamentController.Organizedname,
                          labelText: "Organized By",
                          keyboardType: TextInputType.text,
                          hintText: "Organized By",
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
                                  editedt = true;
                                  status = value;
                                });
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (tournamentController
                                  .Organizedname.text.isNotEmpty)
                                widget.edited != null
                                    ? tournamentController
                                        .EditTournamentFromAPI(
                                            logo: _image,
                                            id: widget.edited?.id.toString() ??
                                                "",
                                            ints: status == true ? 1 : 0)
                                    : tournamentController.AddTournamentFromAPI(
                                        logo: _image,
                                        ints: status == true ? 1 : 0);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            padding: EdgeInsets.all(10),
                            child: Center(
                                child: Text(
                              widget.edited != null ? "Update" : "Save",
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
