import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/febricaddcontroller.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/model/create-fabric-category-model.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../services/all_api_services.dart';
import '../../widgets/common_fields.dart';

class AddFabricCategory extends StatefulWidget {
  const AddFabricCategory({super.key});

  @override
  State<AddFabricCategory> createState() => _AddFabricCategoryState();
}

class _AddFabricCategoryState extends State<AddFabricCategory> {
  TextEditingController nameController = TextEditingController();

  bool isLoadingSave = false;

  FebricCategoryController febricCategoryController = Get.put(FebricCategoryController());
  FebricAddController febricadd = Get.put(FebricAddController());

  Future<void> fetchDataFromAPI({required String categoryName}) async {
    context.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      "fabric_category": categoryName,
      "user_id": "1"
    };
    await addFabricCategoryData(parameter: parameter).then((value) {
      if (value.success != false) {
        febricCategoryController.fetchDataFromAPI();
        febricadd.fabricCategoryController.text = value.categoryId.toString();
        Get.back();
      }
      print(value);
      FlutterToast.showCustomToast(value.message.toString());
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      // FlutterToast.showCustomToast(
      //     "This fabric category has been previously saved");
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
    nameController.dispose();
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
                  'Add Fabric Category',
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
                                    return "enter Fabric Category";
                                  }
                                  return null;
                                },
                                controller: nameController,
                                labelText: 'Enter Fabric Category',
                                keyboardType: TextInputType.text,
                                hintText: 'Enter Fabric Category',
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
                                        : Colors.green.withOpacity(0.2))),
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
      ],
    );
  }
}
