import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/yarncategorydata.dart';
import 'package:yarn_modified/model/create-yarn-category-model.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../services/all_api_services.dart';
import '../../widgets/common_fields.dart';

class AddYarnCategory extends StatefulWidget {
  const AddYarnCategory({super.key});

  @override
  State<AddYarnCategory> createState() => _AddYarnCategoryState();
}

class _AddYarnCategoryState extends State<AddYarnCategory> {
  TextEditingController nameController = TextEditingController();

  bool isLoadingSave = false;

  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  YarnCategoryController yarncategorycontroller =
      Get.put(YarnCategoryController());

  Future<void> fetchDataFromAPI({required String categoryName}) async {
    context.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      "yarn_category": categoryName,
      "user_id": "1"
    };
    await addYarnCategoryData(parameter: parameter).then((value) {
      if (value.success != false) {
        yarncategorycontroller.fetchDataFromAPI();
        yarncategorycontroller.categoryid = value.yarncategoryid.toString();
        Get.back();
      }
      FlutterToast.showCustomToast(value.message.toString());
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // FlutterToast.showCustomToast(
      //     "This Yarn category has been previously saved");
      context.loaderOverlay.hide();
      print(error);
    });
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
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  'Add Yarn Category',
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
                    tooltip: "Back",
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
                child: Form(
                  key: _formKey,
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
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
                                validatorfield: (value) {
                                  if (value!.isEmpty) {
                                    return "enter yarn Category";
                                  }
                                  return null;
                                },
                                controller: nameController,
                                labelText: 'Enter Yarn Category',
                                keyboardType: TextInputType.text,
                                hintText: 'Enter Yarn Category',
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
                              if (_formKey.currentState!.validate()) {
                                fetchDataFromAPI(
                                    categoryName: nameController.text);
                              }
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
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    editedt == true
                                        ? Colors.green
                                        : Colors.green.withOpacity(0.5))),
                            child: Text('SAVE')),
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
                        "Data Saving In Progress...",
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
