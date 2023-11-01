import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/yarncategorydata.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../model/edit-model.dart';
import '../../model/get-yarn-category-model.dart';
import '../../services/all_api_services.dart';
import '../../widgets/common_fields.dart';

class EditYarnCategory extends StatefulWidget {
  EditYarnCategory({super.key, this.yarnCategoryData});

  yarnCategoryDatum? yarnCategoryData;

  @override
  State<EditYarnCategory> createState() => _EditYarnCategoryState();
}

class _EditYarnCategoryState extends State<EditYarnCategory> {
  TextEditingController nameController = TextEditingController();

  bool isLoadingSave = false;

  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  YarnCategoryController yarncategorycontroller =
      Get.put(YarnCategoryController());

  Future<void> fetchDataFromAPI(
      {required String yarn_category, required String categoryid}) async {
    context.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      "yarn_category": yarn_category,
      "user_id": "1"
    };
    await editYarnCategoryData(
            parameter: jsonEncode(parameter), categoryId: categoryid)
        .then((value) {
      if (value.success != false) {
        yarncategorycontroller.fetchDataFromAPI();
        Get.back();
      }
      FlutterToast.showCustomToast(value.massage);
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // FlutterToast.showCustomToast("Something Wrong Plz restart app");
      context.loaderOverlay.hide();
      print(error);
    });
  }

  bool editedt = false;
  @override
  void initState() {
    nameController.text = widget.yarnCategoryData!.yarnCategory;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        //   onWillPop: () {
        // if(nameController.text.isNotEmpty && nameController.text != widget.yarnCategoryData['text']) {
        // return _onBackButtonPressed(context);
        // }
        // return Future._falseFuture;
        // },
        Stack(
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
                  'Edit Yarn Category',
                  textScaleFactor: 1,
                  style: TextStyle(
                      letterSpacing: 0.5, color: MyTheme.appBarTextColor),
                ),
                // centerTitle: true,
                backgroundColor: MyTheme.appBarColor,
                elevation: 0,
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
                      editedt == true
                          ? showdialogboxalert(context)
                          : Get.back();
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
                              onchange: (p0) {
                                setState(() {
                                  p0.isNotEmpty
                                      ? editedt = true
                                      : editedt = false;
                                });
                              },
                              controller: nameController,
                              labelText: 'Edit Yarn Category',
                              keyboardType: TextInputType.text,
                              hintText: 'Edit Yarn Category',
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
                            if (editedt = true)
                              fetchDataFromAPI(
                                  yarn_category: nameController.text,
                                  categoryid:
                                      widget.yarnCategoryData!.id.toString());
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
                              backgroundColor: MaterialStateProperty.all(
                                  editedt == true
                                      ? Colors.blueAccent
                                      : Colors.blueAccent.withOpacity(0.2))),
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
