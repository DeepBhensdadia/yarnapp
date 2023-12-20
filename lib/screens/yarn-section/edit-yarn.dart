import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/model/edit-model.dart';
import 'package:yarn_modified/model/get-yarn-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../services/all_api_services.dart';
import '../../widgets/common_fields.dart';

class EditYarn extends StatefulWidget {
  EditYarn({super.key, this.yarnAllItemsData, });

  // final yarnItem? allData;
  yarnIndexDatum? yarnAllItemsData;
  // final yarnLowTwistItemsData;

  @override
  State<EditYarn> createState() => _EditYarnState();
}

class _EditYarnState extends State<EditYarn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController denierController = TextEditingController();
  TextEditingController yarnRateController = TextEditingController();
  TextEditingController CategoryidController = TextEditingController();
  TextEditingController dialogController = TextEditingController();

  bool isLoadingSave = false;

  List<yarnCategoryDatum?> getData = [];

  Future<void> fetchCategoryDataFromAPI() async {
    await yarnCategoryData().then((value) {
      setState(() {
        getData = value.data;
      });
      // print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  YarnListController yarnlist = Get.put(YarnListController());

  Future<void> fetchDataFromAPI(
      {required String yarn_denier,
      required String yarn_rate,
      required String yarn_name,
      required String categoryid,
      required String yarnid}) async {
    context.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      "yarn_name": yarn_name,
      "yarn_denier": yarn_denier,
      "yarn_rate": yarn_rate,
      "category_id": categoryid,
      "user_id": "${saveUser()?.id}"
    };
    await editYarnIndexData(
            parameter: jsonEncode(parameter), categoryId: yarnid)
        .then((value) {
      if (value.success != false) {
        yarnlist.fetchDataFromAPI(key: '');
        Get.back();
      }
      // print(value);
      FlutterToast.showCustomToast(value.message ?? "");
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // FlutterToast.showCustomToast("This yarn has been previously saved");

      context.loaderOverlay.hide();

      print(error);
    });
  }

  @override
  void initState() {
    fetchCategoryDataFromAPI();
    nameController.text = widget.yarnAllItemsData!.yarnName.toString();
    denierController.text = widget.yarnAllItemsData!.yarnDenier.toString();
    yarnRateController.text = widget.yarnAllItemsData!.yarnRate.toString();
    CategoryidController.text = widget.yarnAllItemsData!.categoryId.toString();

    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool editedt = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: MyTheme.scaffoldColor,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.30),
                    Colors.white.withOpacity(0.65),
                    Colors.white.withOpacity(0.85)
                  ])),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  title: Text(
                    'Edit Yarn',
                    textScaleFactor: 1,
                    style: TextStyle(
                        letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
                        ])),
                  ),
                  leading: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        if (nameController.text.isNotEmpty &&
                            denierController.text.isNotEmpty &&
                            yarnRateController.text.isNotEmpty) {
                          editedt == true
                              ? showdialogboxalert(context,
                                  "Do you want to exit without Updating?")
                              : Get.back();
                        } else {
                          showdialogboxalert(
                              context, "Do you want to exit without Updating?");
                        }
                      },
                      tooltip: "Back",
                      icon: Icon(Icons.arrow_back_rounded)),
                ),
                body: Stack(
                  children: [
                    ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    elevation: 2.5,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: defaultCardRadius),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CommonTextFormField(
                                              read: true,
                                              onchange: (p0) {
                                                setState(() {
                                                  p0.isNotEmpty
                                                      ? editedt = true
                                                      : editedt = false;
                                                });
                                              },
                                              controller: nameController,
                                              labelText: 'Edit Yarn Name',
                                              keyboardType: TextInputType.text,
                                              hintText: 'Edit Yarn Name',
                                              InputAction:
                                                  TextInputAction.next),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CommonDecimalTextField(
                                              onchange: (p0) {
                                                setState(() {
                                                  p0.isNotEmpty
                                                      ? editedt = true
                                                      : editedt = false;
                                                });
                                              },
                                              validatorfield: (p0) {
                                                if (p0!.isEmpty) {
                                                  return "Enter Yarn Denier";
                                                } else if (double.parse(
                                                    p0) <
                                                    1.0) {
                                                  return "Yarn denier should be greater than 0";
                                                }
                                                return null;
                                              },
                                              controller: denierController,

                                              labelText: 'Edit Yarn Denier',
                                              keyboardType:
                                                  TextInputType.number,
                                              hintText: 'Edit Yarn Denier',
                                              InputAction:
                                                  TextInputAction.next),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CommonDecimalTextField(
                                              validatorfield: (p0) {
                                                if (p0!.isEmpty) {
                                                  return "Enter Yarn Rate";
                                                } else if (double.parse(
                                                    p0) <
                                                    1.0) {
                                                  return "Yarn rate should be greater than 0";
                                                }
                                                return null;
                                              },
                                              onchange: (p0) {
                                                setState(() {
                                                  p0.isNotEmpty
                                                      ? editedt = true
                                                      : editedt = false;
                                                });
                                              },
                                              controller: yarnRateController,
                                              labelText:
                                                  'Edit Yarn Rate (Including GST)',
                                              keyboardType:
                                                  TextInputType.number,
                                              hintText:
                                                  'Edit Yarn Rate (Including GST)',
                                              InputAction:
                                                  TextInputAction.next),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Text(
                                              "Edit Yarn Category",
                                              textScaleFactor: 1.3,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: MyTheme.appBarColor),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            height: 40,
                                            child: Theme(
                                              data: ThemeData(
                                                  canvasColor: Colors.white,
                                                  primaryColor: Colors.grey,
                                                  accentColor: Colors.grey,
                                                  hintColor: Colors.grey,
                                                  colorScheme:
                                                      ColorScheme.dark()),
                                              child: DropdownButtonFormField<
                                                  String>(
                                                hint: Text(
                                                    "--Select Category--",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor *
                                                            13)),
                                                onChanged: (value) {
                                                  setState(() {
                                                    editedt = true;
                                                  });
                                                  CategoryidController.text =
                                                      value.toString();
                                                },
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.transparent,
                                                ),
                                                decoration: InputDecoration(
                                                  enabled: true,
                                                  isDense: true,
                                                  disabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        width: 0.25),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        width: 0.25),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        width: 0.25),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        width: 0.25),
                                                  ),
                                                  floatingLabelAlignment:
                                                      FloatingLabelAlignment
                                                          .center,
                                                  // hintText: dropDownHint,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          13),
                                                ),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .textScaleFactor *
                                                          13.5,
                                                ),
                                                value:
                                                    CategoryidController.text,
                                                items: getData
                                                    .map((e) =>
                                                        DropdownMenuItem<
                                                                String>(
                                                            value: e!.id
                                                                .toString(),
                                                            child: Text(e
                                                                .yarnCategory
                                                                .toString())))
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (editedt == true)
                                          fetchDataFromAPI(
                                              yarn_denier:
                                                  denierController.text,
                                              yarn_name: nameController.text,
                                              yarn_rate:
                                                  yarnRateController.text,
                                              categoryid:
                                                  CategoryidController.text,
                                              yarnid: widget
                                                  .yarnAllItemsData!.id
                                                  .toString());
                                      }
                                    },
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.white.withOpacity(0.25)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        elevation:
                                            MaterialStateProperty.all(2.5),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                editedt == true
                                                    ? Colors.blueAccent
                                                    : Colors.blueAccent
                                                        .withOpacity(0.2))),
                                    child: Text('UPDATE')),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
