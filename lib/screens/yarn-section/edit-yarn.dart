import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/model/edit-model.dart';
import 'package:yarn_modified/model/get-yarn-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../services/all_api_services.dart';
import '../../widgets/common_fields.dart';

class EditYarn extends StatefulWidget {
  EditYarn({super.key, this.yarnAllItemsData, this.yarnCategoryData});

  // final yarnItem? allData;
  yarnIndexDatum? yarnAllItemsData;
  // final yarnLowTwistItemsData;
  yarnCategoryDatum? yarnCategoryData;

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
      required String yarnid

      }) async {
    Map<String, dynamic> parameter = {
      "yarn_name": yarn_name,
      "yarn_denier": yarn_denier,
      "yarn_rate": yarn_rate,
      "category_id": categoryid,
      "user_id": "1"
    };
    await editYarnIndexData(
            parameter: jsonEncode(parameter), categoryId: yarnid)
        .then((value) {
      yarnlist.fetchDataFromAPI(key: '');
      FlutterToast.showCustomToast(value.massage);
      Get.back();
      // print(value);
    }).onError((error, stackTrace) {
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
                      setState(() {
                        if (nameController.text.isNotEmpty &&
                            denierController.text.isNotEmpty &&
                            yarnRateController.text.isNotEmpty &&
                            CategoryidController.text.isNotEmpty &&
                            nameController.text ==
                                widget.yarnAllItemsData!.yarnName &&
                            denierController.text ==
                                widget.yarnAllItemsData!.yarnDenier &&
                            yarnRateController.text ==
                                widget.yarnAllItemsData!.yarnRate &&
                            CategoryidController.text ==
                                widget.yarnCategoryData!.yarnCategory) {
                          Navigator.of(context).pop(false);
                        } else if (nameController.text.isNotEmpty ||
                            denierController.text.isNotEmpty ||
                            yarnRateController.text.isNotEmpty ||
                            CategoryidController.text.isNotEmpty ||
                            nameController.text !=
                                widget.yarnAllItemsData!.yarnName ||
                            denierController.text !=
                                widget.yarnAllItemsData!.yarnDenier ||
                            yarnRateController.text !=
                                widget.yarnAllItemsData!.yarnRate ||
                            CategoryidController.text !=
                                widget.yarnCategoryData!.yarnCategory) {
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
                                            controller: nameController,
                                            labelText: 'Edit Yarn Name',
                                            keyboardType: TextInputType.text,
                                            hintText: 'Edit Yarn Name',
                                            InputAction: TextInputAction.next),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CommonDecimalTextField(
                                            controller: denierController,
                                            labelText: 'Edit Yarn Denier',
                                            keyboardType: TextInputType.number,
                                            hintText: 'Edit Yarn Denier',
                                            InputAction: TextInputAction.next),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CommonDecimalTextField(
                                            controller: yarnRateController,
                                            labelText:
                                                'Edit Yarn Rate (Including GST)',
                                            keyboardType: TextInputType.number,
                                            hintText:
                                                'Edit Yarn Rate (Including GST)',
                                            InputAction: TextInputAction.next),
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
                                            child: DropdownButtonFormField<String>(
                                              hint: Text("--Select Category--",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          13)),
                                              onChanged: (value) {
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
                                                suffix: Tooltip(
                                                  message:
                                                      "Add Fabric Category",
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
                                                    onPressed: () {},
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
                                                fontSize: MediaQuery.of(context)
                                                        .textScaleFactor *
                                                    13.5,
                                              ),
                                              value:  CategoryidController.text,
                                              items: getData
                                                  .map((e) =>
                                                      DropdownMenuItem<String>(
                                                          value: e!.id.toString(),
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
                                    fetchDataFromAPI(
                                        yarn_denier: denierController.text,
                                        yarn_name: nameController.text,
                                        yarn_rate: yarnRateController.text,
                                        categoryid: CategoryidController.text,
                                        yarnid: widget.yarnAllItemsData!.id.toString()

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
                                              Colors.blueAccent)),
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
    );

    //   Stack(
    //   children: [
    //     Scaffold(
    //       resizeToAvoidBottomInset: false,
    //       backgroundColor: Colors.grey.shade200,
    //       appBar: AppBar(
    //         iconTheme: IconThemeData(color: Colors.black),
    //         title: Text("Edit Yarn",textScaleFactor: 1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
    //         // title: Text(widget.allData == null ? "Add Yarn" : "Edit Yarn",textScaleFactor: 1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
    //         centerTitle: true,
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //         automaticallyImplyLeading: true,
    //       ),
    //       body: Padding(
    //         padding: const EdgeInsets.all(5),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Card(
    //               elevation: 2.5,
    //               color: Colors.white,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: [
    //                     Align(
    //                       alignment: AlignmentDirectional.topStart,
    //                       child: Text(
    //                         'Enter Yarn Name',
    //                         textScaleFactor: 1,
    //                         style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    //                       ),
    //                     ),
    //                     SizedBox(height: 10,),
    //                     Container(
    //                       constraints: BoxConstraints(),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.all(Radius.circular(4)),
    //                         color: Colors.transparent,
    //                         // border: Border.all(color: Colors.grey.withOpacity(0.5))
    //                       ),
    //                       child: TextFormField(
    //                         autocorrect: false,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: Colors.black,
    //                         textInputAction: TextInputAction.next,
    //                         controller: nameController..text = widget.yarnAllItemsData['title'],
    //                         keyboardType: TextInputType.text,
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                         ),
    //                         decoration: InputDecoration(
    //                           hintText: 'Enter Yarn Name',
    //                           hintStyle: TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                           ),
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 20,
    //                           ),
    //                           disabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           border: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(height: 20,),
    //                     Align(
    //                       alignment: AlignmentDirectional.topStart,
    //                       child: Text(
    //                         'Enter Yarn Denier',
    //                         textScaleFactor: 1,
    //                         style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    //                       ),
    //                     ),
    //                     SizedBox(height: 10,),
    //                     Container(
    //                       constraints: BoxConstraints(),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.all(Radius.circular(4)),
    //                         color: Colors.transparent,
    //                         // border: Border.all(color: Colors.grey.withOpacity(0.5))
    //                       ),
    //                       child: TextFormField(
    //                         autocorrect: false,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: Colors.black,
    //                         textInputAction: TextInputAction.next,
    //                         controller: denierController..text = widget.denierAllData,
    //                         keyboardType: TextInputType.text,
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                         ),
    //                         decoration: InputDecoration(
    //                           hintText: 'Enter Yarn Denier',
    //                           hintStyle: TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                           ),
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 20,
    //                           ),
    //                           disabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           border: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           // focusedBorder: UnderlineInputBorder(
    //                           //   borderSide: BorderSide.none,
    //                           //   borderRadius: BorderRadius.circular(15),
    //                           // ),
    //                           // border: UnderlineInputBorder(
    //                           //   borderSide: BorderSide.none,
    //                           //   borderRadius: BorderRadius.all(Radius.circular(15)),
    //                           // ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(height: 20,),
    //                     Align(
    //                       alignment: AlignmentDirectional.topStart,
    //                       child: Text(
    //                         'Enter Yarn Rate (Including GST)',
    //                         textScaleFactor: 1,
    //                         style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    //                       ),
    //                     ),
    //                     SizedBox(height: 10,),
    //                     Container(
    //                       constraints: BoxConstraints(),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.all(Radius.circular(4)),
    //                         color: Colors.transparent,
    //                         // border: Border.all(color: Colors.grey.withOpacity(0.5))
    //                       ),
    //                       child: TextFormField(
    //                         autocorrect: false,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: Colors.black,
    //                         textInputAction: TextInputAction.next,
    //                         controller: yarnRateController..text = widget.yarnAllItemsData['rate'],
    //                         keyboardType: TextInputType.text,
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                         ),
    //                         decoration: InputDecoration(
    //                           hintText: 'Enter Yarn Rate (Including GST)',
    //                           hintStyle: TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                           ),
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 20,
    //                           ),
    //                           disabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           border: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           // focusedBorder: UnderlineInputBorder(
    //                           //   borderSide: BorderSide.none,
    //                           //   borderRadius: BorderRadius.circular(15),
    //                           // ),
    //                           // border: UnderlineInputBorder(
    //                           //   borderSide: BorderSide.none,
    //                           //   borderRadius: BorderRadius.all(Radius.circular(15)),
    //                           // ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(height: 20,),
    //                     Align(
    //                       alignment: AlignmentDirectional.topStart,
    //                       child: Text(
    //                         'Select Yarn Category',
    //                         textScaleFactor: 1,
    //                         style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    //                       ),
    //                     ),
    //                     SizedBox(height: 10,),
    //                     Container(
    //                       constraints: BoxConstraints(),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.all(Radius.circular(4)),
    //                         color: Colors.transparent,
    //                         // border: Border.all(color: Colors.grey.withOpacity(0.5))
    //                       ),
    //                       child: TextFormField(
    //                         autocorrect: false,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: Colors.black,
    //                         textInputAction: TextInputAction.next,
    //                         controller: categoryController..text = widget.yarnAllItemsData['subtitle'],
    //                         keyboardType: TextInputType.text,
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                         ),
    //                         onTap: () {
    //                           dialogBox();
    //                         },
    //                         decoration: InputDecoration(
    //                           hintText: 'Select Yarn Category',
    //                           hintStyle: TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: MediaQuery.of(context).textScaleFactor * 12,
    //                           ),
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 20,
    //                           ),
    //                           disabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           border: OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    //                           ),
    //                           // focusedBorder: UnderlineInputBorder(
    //                           //   borderSide: BorderSide.none,
    //                           //   borderRadius: BorderRadius.circular(15),
    //                           // ),
    //                           // border: UnderlineInputBorder(
    //                           //   borderSide: BorderSide.none,
    //                           //   borderRadius: BorderRadius.all(Radius.circular(15)),
    //                           // ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(height: 25,),
    //                     Align(
    //                       alignment: Alignment.centerRight,
    //                       child: ElevatedButton(
    //                           onPressed: () {
    //                             setState(() {
    //                               isLoadingSave = true;
    //                             });
    //                             Timer(Duration(milliseconds: 2500), () {
    //                               setState(() {
    //                                 isLoadingSave = false;
    //                               });
    //                               FlutterToast.showCustomToast("DATA SAVED SUCCESSFULLY");
    //                             });
    //                           },
    //                           style: ButtonStyle(
    //                               overlayColor: MaterialStateProperty.all(Colors.grey),
    //                               shape: MaterialStateProperty.all(
    //                                   RoundedRectangleBorder(
    //                                       borderRadius:
    //                                       BorderRadius.circular(10))),
    //                               elevation: MaterialStateProperty.all(0),
    //                               foregroundColor: MaterialStateProperty.all(Colors.white),
    //                               backgroundColor: MaterialStateProperty.all(
    //                                   Colors.blueAccent)),
    //                           child: Text('SAVE')),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //
    //             SizedBox(height: 50,),
    //           ],
    //         ),
    //       ),
    //     ),
    //     isLoadingRefresh
    //         ? Container(
    //       color: Colors.black.withOpacity(0.25),
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.black,
    //           strokeWidth: 3,
    //         ),
    //       ),
    //     )
    //         : Container(),
    //     isLoadingSave
    //         ? Container(
    //       color: Colors.black.withOpacity(0.25),
    //       child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             CircularProgressIndicator(
    //               color: Colors.black,
    //               strokeWidth: 3,
    //             ),
    //             SizedBox(height: 250,),
    //             Text("Data Saving In Progress...",style: TextStyle(color: Colors.black, decoration: TextDecoration.none,fontSize: 13,fontWeight: FontWeight.bold),),
    //           ],
    //         ),
    //       ),
    //     )
    //         : Container(),
    //   ],
    // );
  }
}
