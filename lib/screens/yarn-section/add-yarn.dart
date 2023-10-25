import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/yarncategorydata.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
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
  String categoryid = "";

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
      "category_id":category_id,
      "user_id": "1",
    };
    await addYarnIndexData(parameter: jsonEncode(parameter)).then((value) {
      yarnlist.fetchDataFromAPI(key: "");
      print(value);
      Get.back();
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    yarncategory.fetchDataFromAPI();
  }

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
                  style: TextStyle(letterSpacing: 0.5,color: MyTheme.appBarTextColor),
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
                      setState(() {
                        if (nameController.text.isEmpty &&
                            denierController.text.isEmpty &&
                            yarnRateController.text.isEmpty &&
                            categoryController.text.isEmpty) {
                          Navigator.of(context).pop(false);
                        } else if (nameController.text.isNotEmpty ||
                            denierController.text.isNotEmpty ||
                            yarnRateController.text.isNotEmpty ||
                            categoryController.text.isNotEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    "Alert",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ),
                                  content: Text(
                                    "Are you sure you would like to go back without saving data that you have added in text field(s) ?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.grey,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.9)),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.grey,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.9)),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => YarnCategoryScreen()));
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        )),
                                  ],
                                );
                              });
                        }
                      });
                    },
                    tooltip: "Back",
                    icon: Icon(Icons.arrow_back_rounded)),
              ),
              body:
              GetBuilder<YarnCategoryController>(builder: (controller) =>   Stack(
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
                                            controller: nameController,
                                            labelText: 'Enter Yarn Name',
                                            keyboardType: TextInputType.text,
                                            hintText: 'Enter Yarn Name',
                                            InputAction: TextInputAction.next),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CommonDecimalTextField(
                                            controller: denierController,
                                            labelText: 'Enter Yarn Denier',
                                            keyboardType: TextInputType.number,
                                            hintText: 'Enter Yarn Denier',
                                            InputAction: TextInputAction.next),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CommonDecimalTextField(
                                            controller: yarnRateController,
                                            labelText:
                                            'Enter Yarn Rate (Including GST)',
                                            keyboardType: TextInputType.number,
                                            hintText:
                                            'Enter Yarn Rate (Including GST)',
                                            InputAction: TextInputAction.next),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional.topStart,
                                          child: Text(
                                            "Select Yarn Category",
                                            textScaleFactor: 1.3,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: MyTheme.appBarColor),
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
                                            DropdownButtonFormField<String>(
                                              hint: Text("--Select Category--",style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor * 13)),
                                              // value: dropDownHint,
                                              onChanged: (value) {
                                                categoryid = value.toString();
                                              },
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.transparent,
                                              ),
                                              decoration: InputDecoration(
                                                enabled: true,
                                                isDense: true,
                                                suffix: Tooltip(
                                                  message: "Add Yarn Category",
                                                  textStyle: TextStyle(
                                                      color: Colors.black),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                  child: IconButton(
                                                    iconSize: 20,
                                                    color: Colors.grey,
                                                    padding: EdgeInsets.zero,
                                                    splashRadius: 20,
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddYarnCategory()));
                                                    },
                                                    icon:
                                                    Icon(Icons.add_rounded),
                                                  ),
                                                ),
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
                                                hintText: dropDownHint,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: MediaQuery.of(
                                                        context)
                                                        .textScaleFactor *
                                                        13),
                                              ),
                                              style: TextStyle(
                                                  color: Colors.black,fontSize: MediaQuery.of(context).textScaleFactor * 13.5),
                                              // value: sub_Category_Data.first!.catId,
                                              items:
                                              yarncategory.getData
                                                  .map((e) => DropdownMenuItem(
                                                  value: e!.id.toString(),
                                                  child: Text(e.yarnCategory)))
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
                                    fetchDataFromAPI(
                                        yarnName: nameController.text,
                                        yarnDenier: denierController.text,
                                        yarnRate: yarnRateController.text,
                                        category_id: categoryid
                                    );
                                  },
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.white.withOpacity(0.25)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8))),
                                      elevation: MaterialStateProperty.all(2.5),
                                      foregroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white),
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.green)),
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
              ),)

            ),
          ),
        ),

      ],
    );
  }
}
