import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yarn_modified/cricketscreens/model/getteamslistresponse.dart';

import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../services/app_url.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../getx/teamcontroller.dart';

class AddTeamScreen extends StatefulWidget {
  final String? tournamentid;
  final Teams? teamdetails;
  const AddTeamScreen({super.key, this.tournamentid, this.teamdetails});

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TeamController teamcontroller = Get.put(TeamController());

  @override
  void initState() {
    teamcontroller.teamname.clear();
    teamcontroller.shortname.clear();
    teamcontroller.ownername.clear();
    teamcontroller.group.clear();
    teamcontroller.getgroupDataAPI();
    if (widget.teamdetails != null) {
      teamcontroller.teamname.text = widget.teamdetails?.teamName ?? "";
      teamcontroller.shortname.text = widget.teamdetails?.shortName ?? "";
      teamcontroller.ownername.text = widget.teamdetails?.teamOwner ?? "";
      teamcontroller.group.text = widget.teamdetails?.groupId ?? "";
      teamcontroller.status.value =
          widget.teamdetails?.status == 1 ? true : false;
    }
    // TODO: implement initState
    super.initState();
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
      setState(() {});
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
                widget.teamdetails != null
                    ? "Do you want to exit without Updating?"
                    : "Do you want to exit without Saving?")
            : Future.value(true);
      },
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            widget.teamdetails != null ? "Edit Team" : "Add Team",
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
                                          ? widget.teamdetails != null
                                              ? Ink.image(
                                                  image: NetworkImage(URLs
                                                          .image_url_team +
                                                      "${widget.teamdetails?.logo}"),
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
                                                                        URLs.image_url_team +
                                                                            "${widget.teamdetails?.logo}"),
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
                              return "Enter Team Name";
                            }
                            return null;
                          },
                          controller: teamcontroller.teamname,
                          labelText: "Team Name",
                          keyboardType: TextInputType.text,
                          hintText: "Enter Team Name",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          maxlength: 6,
                          validatorfield: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Short Name";
                            }
                            return null;
                          },
                          labelText: "Team Short Name",
                          controller: teamcontroller.shortname,
                          keyboardType: TextInputType.text,
                          hintText: "Enter Team Name",
                        ),
                        TournamentTextFormField(
                          onchange: (p0) {
                            setState(() {
                              editedt = true;
                            });
                          },
                          maxlength: 25,
                          // validatorfield: (p0) {
                          //   if (p0!.isEmpty) {
                          //     return "Enter Owner Name";
                          //   }
                          //   return null;
                          // },
                          labelText: "Team Owner Name",
                          controller: teamcontroller.ownername,
                          keyboardType: TextInputType.text,
                          hintText: "Enter owner Name",
                        ),
                        Obx(
                          () => TournamentDropdown(
                            initialValue: widget.teamdetails?.groupId == "" ?  null :widget.teamdetails?.groupId,
                            count: teamcontroller.getgroups
                                .map((e) => DropdownMenuItem<String>(
                                    value: "${e}", child: Text("${e}")))
                                .toList(),
                            onchange: (p0) {
                              setState(() {
                                editedt = true;
                              });
                              teamcontroller.group.text = p0.toString();
                            },
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return "Select Team Group";
                              }
                              return null;
                            },
                            lable: "Select Team Group",
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
                              value: teamcontroller.status.value,
                              onChanged: (value) {
                                setState(() {
                                  editedt = true;
                                  teamcontroller.status.value = value;
                                });
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              widget.teamdetails != null
                                  ? teamcontroller.EditTeamFromAPI(
                                      logo: _image,
                                      tournamentid: widget.tournamentid ?? "",
                                      id: widget.teamdetails?.id.toString() ??
                                          "")
                                  : teamcontroller.AddTeamFromAPI(
                                      logo: _image,
                                      tournamentid: widget.tournamentid ?? "");
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
                              widget.teamdetails != null ? "Update" : "Save",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: kwhite),
                            )),
                          ),
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
