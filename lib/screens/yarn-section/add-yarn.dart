import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/yarncategorydata.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/model/create-yarn-index-model.dart';
import 'package:yarn_modified/widgets/common_fields.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../model/get-yarn-category-model.dart';
import '../../services/all_api_services.dart';
import 'add-yarn-category.dart';

class AddYarn extends StatefulWidget {
  const AddYarn({super.key});

  @override
  State<AddYarn> createState() => _AddYarnState();
}

class _AddYarnState extends State<AddYarn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController denierController = TextEditingController();
  TextEditingController yarnRateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dialogController = TextEditingController();

  bool isLoadingSave = false;

  void dispose() {
    super.dispose();
    nameController.dispose();
    denierController.dispose();
    yarnRateController.dispose();
    categoryController.dispose();
    dialogController.dispose();
  }

  String dropDownHint = "--Select Category--";

  YarnListController yarnlist = Get.put(YarnListController());

  YarnCategoryController yarncategory = Get.put(YarnCategoryController());

  Future<void> fetchDataFromAPI({
    required String yarnName,
    required String yarnDenier,
    required String yarnRate,
    required String category_id,
  }) async {
    context.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      "yarn_name": yarnName,
      "yarn_denier": yarnDenier,
      "yarn_rate": yarnRate,
      "category_id": category_id,
      "user_id": "${saveUser()?.id}"
    };
    await addYarnIndexData(parameter: jsonEncode(parameter)).then((value) {
      if (value.success != false) {
        yarnlist.fetchDataFromAPI(key: "");
        Get.back();
      }
      print(value);
      FlutterToast.showCustomToast(value.message);
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // FlutterToast.showCustomToast("This yarn rate has been previously saved");
      context.loaderOverlay.hide();
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    yarncategory.categoryid = "0";
    yarncategory.fetchDataFromAPI();
  }

  final _formKey = GlobalKey<FormState>();
  bool editedt = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    'Add Yarn',
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
                        if(
                        nameController.text.isNotEmpty&&
                        denierController.text.isNotEmpty&&
                        yarnRateController.text.isNotEmpty){
                        editedt == true
                            ? showdialogboxalert(
                                context, "Do you want to exit without Saving?")
                            : Get.back();}else{
                          showdialogboxalert(
                              context, "Do you want to exit without Saving?");
                        }
                      },
                      tooltip: "Back",
                      icon: Icon(Icons.arrow_back_rounded)),
                ),
                body: GetBuilder<YarnCategoryController>(
                  builder: (controller) => Stack(
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
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                  onchange: (p0) {
                                                    setState(() {
                                                      p0.isNotEmpty
                                                          ? editedt = true
                                                          : editedt = false;
                                                    });
                                                  },
                                                  validatorfield: (p0) {
                                                    if (p0!.isEmpty) {
                                                      return "Enter Yarn Name";
                                                    }
                                                    return null;
                                                  },
                                                  controller: nameController,
                                                  labelText: 'Enter Yarn Name',
                                                  keyboardType:
                                                      TextInputType.text,
                                                  hintText: 'Enter Yarn Name',
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
                                                    }
                                                    return null;
                                                  },
                                                  controller: denierController,
                                                  labelText:
                                                      'Enter Yarn Denier',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText: 'Enter Yarn Denier',
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
                                                      return "Enter Yarn Rate";
                                                    }
                                                    return null;
                                                  },
                                                  controller:
                                                      yarnRateController,
                                                  labelText:
                                                      'Enter Yarn Rate (Including GST)',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText:
                                                      'Enter Yarn Rate (Including GST)',
                                                  InputAction:
                                                      TextInputAction.next),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional
                                                    .topStart,
                                                child: Text(
                                                  "Select Yarn Category",
                                                  textScaleFactor: 1.3,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          MyTheme.appBarColor),
                                                ),
                                              ),
                                              SizedBox(height: 10),
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
                                                  child:
                                                      DropdownButtonFormField<
                                                          String>(
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter Yarn Category";
                                                      }
                                                      return null;
                                                    },
                                                    menuMaxHeight: screenheight(
                                                        context,
                                                        dividedby: 2),
                                                    hint: Text(
                                                        "--Select Category--",
                                                        style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .textScaleFactor *
                                                                13)),
                                                    // value: dropDownHint,
                                                    onChanged: (value) {
                                                      editedt = true;
                                                      yarncategory.categoryid =
                                                          value.toString();
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.transparent,
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabled: true,
                                                      isDense: true,
                                                      suffix: Tooltip(
                                                        message:
                                                            "Add Yarn Category",
                                                        textStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: IconButton(
                                                          iconSize: 20,
                                                          color: Colors.grey,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          splashRadius: 20,
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AddYarnCategory()));
                                                          },
                                                          icon: Icon(Icons
                                                              .add_rounded),
                                                        ),
                                                      ),
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 0.25),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 0.25),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 0.25),
                                                      ),
                                                      border:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 0.25),
                                                      ),
                                                      floatingLabelAlignment:
                                                          FloatingLabelAlignment
                                                              .center,
                                                      hintText: dropDownHint,
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor *
                                                              13),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor *
                                                            13.5),
                                                    value:
                                                        yarncategory.categoryid,
                                                    items: yarncategory.getData
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                                value: e!.id
                                                                    .toString(),
                                                                child: Text(e
                                                                    .yarnCategory)))
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
                                          fetchDataFromAPI(
                                              yarnName: nameController.text,
                                              yarnDenier: denierController.text,
                                              yarnRate: yarnRateController.text,
                                              category_id:
                                                  yarncategory.categoryid);
                                        }
                                      },
                                      style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.all(
                                              Colors.white.withOpacity(0.25)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          elevation:
                                              MaterialStateProperty.all(2.5),
                                          foregroundColor: MaterialStateProperty.all(
                                              Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  editedt == true
                                                      ? Colors.green
                                                      : Colors.green
                                                          .withOpacity(0.5))),
                                      child: Text('SAVE')),
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
                )),
          ),
        ),
      ],
    );
  }
}
