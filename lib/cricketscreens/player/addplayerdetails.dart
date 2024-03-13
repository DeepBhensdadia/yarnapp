import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yarn_modified/cricketscreens/model/usercheckmodel.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../services/app_url.dart';
import '../../widgets/tournamenttextfield.dart';
import '../getx/usercontroller.dart';
import '../model/searchplayerresponse.dart';
import 'tournamentscreen.dart';

class AddPlayerDetails extends StatefulWidget {
  final PlayerDetails? data;
  const AddPlayerDetails({super.key, this.data});

  @override
  State<AddPlayerDetails> createState() => _AddPlayerDetailsState();
}

class _AddPlayerDetailsState extends State<AddPlayerDetails> {
  UserController userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.data != null) {
      userController.playername.text = widget.data?.playerName ?? "";
      userController.skill.text = widget.data?.skills ?? "";
      userController.nickname.text = widget.data?.nickname ?? "";
      userController.battingstyle.text = widget.data?.battingStyle ?? "";
      userController.bowlingstyle.text = widget.data?.bowlingStyle ?? "";
      userController.city.text = widget.data?.city ?? "";
      userController.dob.text = widget.data?.birthdateformat() ?? "";
      userController.wicketkeeping.value =
          widget.data?.wicketKeeper == "Yes" ? true : false;
    }
    userController.getplayerdropdown();
    // TODO: implement initState
    super.initState();
  }

  DateTime selectedStartDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(1950), // Set the start date to 1950
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        editedt = true;

        selectedStartDate = picked;
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        userController.dob.text = formattedDate;
      });
    }
  }

  File? _image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {
        editedt = true;
      });
    } else {
      print('No Image Selected');
    }
  }

  bool editedt = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return editedt == true
            ? showdialogboxalert(
                context,
                widget.data != null
                    ? "Do you want to exit without Updating?"
                    : "Do you want to exit without Saving?")
            : Future.value(true);
      },
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "${widget.data != null ? "Edit Player" : "Player Registration"}",
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
                                          ? widget.data != null
                                              ? Ink.image(
                                                  image: NetworkImage(URLs
                                                          .image_url_player +
                                                      "${widget.data?.logo}"),
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
                                                                        URLs.image_url_player +
                                                                            "${widget.data?.logo}"),
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
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Player Name";
                            }
                            return null;
                          },
                          controller: userController.playername,
                          labelText: "Player Name",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Player Name",
                        ),
                        TournamentTextFormField(
                          maxlength: 20,
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter City";
                            }
                            return null;
                          },
                          controller: userController.city,
                          labelText: "Enter City",
                          keyboardType: TextInputType.text,
                          hintText: "Enter City",
                        ),
                        Obx(() => TournamentDropdown(
                              initialValue: widget.data?.skills,
                              count: userController.cricketerRoles1
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onchange: (p0) {
                                userController.skill.text = p0 ?? "";
                                setState(() {
                                  editedt = true;
                                });
                              },
                              validator: (p0) {
                                if (p0?.isEmpty ?? true) {
                                  return "Select Player Skill";
                                }
                                return null;
                              },
                              lable: "Select Player Skill",
                            )),
                        Obx(() => TournamentDropdown(
                              initialValue: widget.data?.battingStyle,
                              count: userController.battingStyleList1
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onchange: (p0) {
                                userController.battingstyle.text = p0 ?? "";
                                setState(() {
                                  editedt = true;
                                });
                              },
                              validator: (p0) {
                                if (p0?.isEmpty ?? true) {
                                  return "Select Player Batting Style";
                                }
                                return null;
                              },
                              lable: "Select Player Batting Style",
                            )),
                        Obx(() => TournamentDropdown(
                              initialValue: widget.data?.bowlingStyle,
                              count: userController.bowlingStyleList1
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onchange: (p0) {
                                userController.bowlingstyle.text = p0 ?? "";
                                setState(() {
                                  editedt = true;
                                });
                              },
                              validator: (p0) {
                                if (p0?.isEmpty ?? true) {
                                  return "Select Player Bowling Style";
                                }
                                return null;
                              },
                              lable: "Select Player Bowling Style",
                            )),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Birth Date";
                            }
                            return null;
                          },
                          read: true,
                          ontap: () {
                            _selectStartDate(context);
                          },
                          controller: userController.dob,
                          labelText: "Select Birth Date",
                          keyboardType: TextInputType.text,
                          hintText: "",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "Wicket Keeping",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: kthemecolor),
                              ),
                            ),
                            Switch(
                              activeColor: kthemecolor,
                              value: userController.wicketkeeping.value,
                              onChanged: (value) {
                                setState(() {
                                  userController.wicketkeeping.value = value;
                                  editedt = true;
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
                              widget.data != null
                                  ? userController.EditPlayerFromAPI(
                                      logo: _image,
                                      id: widget.data?.id.toString() ?? "")
                                  : userController.AddPlayerFromAPI(
                                      logo: _image);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kthemecolor,
                                borderRadius: BorderRadius.circular(5)),
                            height: 45,
                            padding: EdgeInsets.all(10),
                            child: Center(
                                child: Text(
                              widget.data != null ? "Update" : "Save",
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
