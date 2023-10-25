import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/model/edit-model.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../services/all_api_services.dart';
import '../../widgets/common_fields.dart';

class EditFabricCategory extends StatefulWidget {
  EditFabricCategory({super.key, this.fabricCategoryData});

  fabricCategoryDatum? fabricCategoryData;

  @override
  State<EditFabricCategory> createState() => _EditFabricCategoryState();
}

class _EditFabricCategoryState extends State<EditFabricCategory> {
  TextEditingController nameController = TextEditingController();

  bool isLoadingSave = false;

  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  FebricCategoryController febricCategoryController =
      Get.put(FebricCategoryController());

  Future<void> fetchDataFromAPI(
      {required String febric_category, required String categoryid}) async {
    context.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      "fabric_category": febric_category,
    };
    await editFabricCategoryData(
            parameter: jsonEncode(parameter), categoryId: categoryid)
        .then((value) {
      febricCategoryController.fetchDataFromAPI();
      FlutterToast.showCustomToast(value.massage);
      Get.back();
      print(value);
      context.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();

      print(error);
    });
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
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  'Edit Fabric Category',
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
                    tooltip: "Back",
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (nameController.text.isNotEmpty &&
                            nameController.text ==
                                widget.fabricCategoryData!.fabricCategory) {
                          Navigator.of(context).pop(false);
                        } else {
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
                                    "Are you sure you would like to go back without updating data that you have edited in text field(s) ?",
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
                    icon: Icon(Icons.arrow_back_rounded)),
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: categoryCardRadius),
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Column(
                          children: [
                            CommonTextFormField(
                              controller: nameController
                                ..text =
                                    widget.fabricCategoryData!.fabricCategory,
                              labelText: 'Edit Fabric Category',
                              keyboardType: TextInputType.text,
                              hintText: 'Edit Fabric Category',
                              InputAction: TextInputAction.done,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(),
                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 50, left: 5, right: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            fetchDataFromAPI(
                                febric_category: nameController.text,
                                categoryid:
                                    widget.fabricCategoryData!.id.toString());
                          },
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.white.withOpacity(0.25)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              elevation: MaterialStateProperty.all(2.5),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent)),
                          child: Text('UPDATE')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoadingSave
            ? Container(
                color: Colors.black.withOpacity(0.25),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 3,
                      ),
                      SizedBox(
                        height: 250,
                      ),
                      Text(
                        "Data Updating In Progress...",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
