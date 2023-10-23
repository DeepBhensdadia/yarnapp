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

  void dispose(){
    super.dispose();
    nameController.dispose();
  }

  YarnCategoryController yarncategorycontroller = Get.put(YarnCategoryController());


  Future<void> fetchDataFromAPI({required String yarn_category, required String categoryid}) async {
    context.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      "yarn_category": yarn_category,
    };
    await editYarnCategoryData(parameter: jsonEncode(parameter), categoryId: categoryid).then((value) {
      yarncategorycontroller.fetchDataFromAPI();
      FlutterToast.showCustomToast(value.massage);
      Get.back();
      context.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      print(error);
    });
  }

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
                      ]
                  )
              ),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: Text(
                    'Edit Yarn Category',
                    textScaleFactor: 1,
                    style: TextStyle(letterSpacing: 0.5,color: MyTheme.appBarTextColor),
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
                            ]
                        )
                    ),
                  ),
                  leading: IconButton(
                      tooltip: "Back",
                      splashRadius: 20,
                      onPressed: () {
                        if(nameController.text.isNotEmpty && nameController.text == widget.yarnCategoryData!.yarnCategory) {
                          Navigator.of(context).pop(false);
                        }
                        else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    "Alert",
                                    style: TextStyle(fontSize: 20, color: Colors.red),
                                  ),
                                  content: Text(
                                    "Are you sure you would like to go back without updating data that you have edited in text field(s) ?",
                                    style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.grey,
                                            backgroundColor: Colors.white.withOpacity(0.9)),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(fontSize: 15, color: Colors.black),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.grey,
                                            backgroundColor: Colors.white.withOpacity(0.9)),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => YarnCategoryScreen()));
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(fontSize: 15, color: Colors.black),
                                        )),
                                  ],
                                );
                              });
                        }
                      },
                      icon: Icon(Icons.arrow_back_rounded)
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: categoryCardRadius
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                          child: Column(
                            children: [
                              CommonTextFormField(
                                controller: nameController,
                                labelText: 'Edit Yarn Category',
                                keyboardType: TextInputType.text,
                                hintText: 'Edit Yarn Category',
                                InputAction: TextInputAction.done,
                              ),
                              SizedBox(height: 40,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 50,left: 5,right: 5),
                        child: ElevatedButton(
                            onPressed: () {
                              fetchDataFromAPI(
                                  yarn_category: nameController.text,
                                  categoryid:  widget.yarnCategoryData!.id.toString());

                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.25)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8))),
                                elevation: MaterialStateProperty.all(2.5),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueAccent)),
                            child: Text('UPDATE')),
                      ),
                      SizedBox(height: 30,),
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
                  SizedBox(height: 250,),
                  Text("Data Updating In Progress...",style: TextStyle(color: Colors.black, decoration: TextDecoration.none,fontSize: 13,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          )
              : Container(),
        ],
      );
  }
}
