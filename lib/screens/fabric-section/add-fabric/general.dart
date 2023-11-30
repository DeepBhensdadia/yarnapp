import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric-category.dart';
import 'package:yarn_modified/getxcontrollers/febricaddcontroller.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../widgets/common_fields.dart';

class AddGeneralCategory extends StatefulWidget {
  final PageController page;
  AddGeneralCategory({
    super.key,
    required this.page,
  });

  @override
  State<AddGeneralCategory> createState() => _AddGeneralCategoryState();
}

class _AddGeneralCategoryState extends State<AddGeneralCategory>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller1 = ScrollController();
  FebricAddController feb = Get.put(FebricAddController());

  String dropDownHint = "--Select Category--";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List count = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  @override
  void initState() {
    feb.currenttab = 0;
    // feb.buttaCuttingController.text = "0";
    // feb.additionalCostController.text = "0";
    feb.fabricCategoryController.text = "0";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          controller: _controller1,
          physics: BouncingScrollPhysics(),
          child: GetBuilder<FebricCategoryController>(
            builder: (v) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 2.5,
                  color: Colors.white,
                  shape:
                      RoundedRectangleBorder(borderRadius: defaultCardRadius),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonTextFormField(
                              read: feb.isWrapDone,
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "Enter Fabric Name";
                                }
                                return null;
                              },
                              controller: feb.nameController,
                              labelText: 'Enter Fabric Name',
                              keyboardType: TextInputType.text,
                              hintText: 'Enter Fabric Name',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Select Number of Warp Yarn",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 40,
                            child: Theme(
                              data: ThemeData(
                                  canvasColor: Colors.white,
                                  primaryColor: Colors.grey,
                                  accentColor: Colors.grey,
                                  hintColor: Colors.grey,
                                  colorScheme: ColorScheme.dark()),
                              child: AbsorbPointer(
                                absorbing: feb.isWrapDone,
                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null) {
                                      return "Select Number of Warp Yarn";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    feb.editedt = true;

                                    feb.numberOfWarpYarnController.text =
                                        value ?? "";
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  ),
                                  decoration: InputDecoration(
                                    enabled: true,
                                    isDense: true,
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                  ),
                                  style: TextStyle(
                                    color: !feb.isWrapDone
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            13.5,
                                  ),
                                  // value: sub_Category_Data.first!.catId,
                                  items: count
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e, child: Text(e)))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Select Number of Weft Yarn",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 40,
                            child: Theme(
                              data: ThemeData(
                                  canvasColor: Colors.white,
                                  primaryColor: Colors.grey,
                                  accentColor: Colors.grey,
                                  hintColor: Colors.grey,
                                  colorScheme: ColorScheme.dark()),
                              child: AbsorbPointer(
                                absorbing: feb.isWrapDone,
                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null) {
                                      return "Select Number of Weft Yarn";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    feb.editedt = true;
                                    feb.numberOfWeftYarnController.text =
                                        value ?? "";
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  ),
                                  decoration: InputDecoration(
                                    // enabled: false,
                                    isDense: true,
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                  ),
                                  style: TextStyle(
                                    color: !feb.isWrapDone
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            13.5,
                                  ),
                                  // value: sub_Category_Data.first!.catId,
                                  items: count
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e, child: Text(e)))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "Enter Width in Inch";
                                }else if(p0 == "0"){
                                  return "Width should be greater than 0";
                                }
                                return null;
                              },
                              controller: feb.widthInInchController,
                              labelText: 'Enter Fabric Width in Inch',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Fabric Width in Inch',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "Enter Cost of per PPI";
                                }
                                return null;
                              },
                              controller: feb.costPerFinalController,
                              labelText: 'Enter Cost of Per PPI',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Cost of Per PPI',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              // validatorfield: (p0) {
                              //   if (p0!.isEmpty) {
                              //     return "Enter wrap wesrage % onn warap amount";
                              //   }
                              //   return null;
                              // },
                              controller: feb.warpAmountController,
                              labelText:
                                  'Enter Warp Wastage in % on Warp Amount',
                              keyboardType: TextInputType.number,
                              hintText:
                                  'Enter Warp Wastage in % on Warp Amount',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              // validatorfield: (p0) {
                              //   if (p0!.isEmpty) {
                              //     return "Enter weft wastage in % on weft amount";
                              //   }
                              //   return null;
                              // },
                              controller: feb.weftAmountController,
                              labelText:
                                  'Enter Weft Wastage in % on Weft Amount',
                              keyboardType: TextInputType.number,
                              hintText:
                                  'Enter Weft Wastage in % on Weft Amount',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              // validatorfield: (p0) {
                              //   if (p0!.isEmpty) {
                              //     return "Enter butta cutting cost pr meter";
                              //   }
                              //   return null;
                              // },
                              // ontaps: () => feb.buttaCuttingController.clear(),
                              controller: feb.buttaCuttingController,
                              labelText: 'Enter Butta Cutting Cost Per Metre',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Butta Cutting Cost Per Metre',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              // validatorfield: (p0) {
                              //   if (p0!.isEmpty) {
                              //     return "Enter any addittional cost per meter";
                              //   }
                              //   return null;
                              // },
                              // ontaps: () => feb.additionalCostController.clear(),
                              controller: feb.additionalCostController,
                              labelText: 'Enter Any Additional Cost Per Metre',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Any Additional Cost Per Metre',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Select Fabric Category",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                          ),
                          SizedBox(height: 10),
                          v.febricbool == false
                              ? SizedBox.shrink()
                              : Container(
                                  height: 40,
                                  child: Theme(
                                    data: ThemeData(
                                        canvasColor: Colors.white,
                                        primaryColor: Colors.grey,
                                        accentColor: Colors.grey,
                                        hintColor: Colors.grey,
                                        colorScheme: ColorScheme.dark()),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child:
                                              DropdownButtonFormField<String>(
                                            menuMaxHeight: screenheight(context,
                                                dividedby: 1.5),
                                            onChanged: (value) {
                                              feb.editedt = true;
                                              feb.fabricCategoryController
                                                  .text = value ?? "";
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
                                                  FloatingLabelAlignment.center,
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  13.5,
                                            ),
                                            value: feb
                                                .fabricCategoryController.text,
                                            items: v.getData
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        value: e!.id.toString(),
                                                        child: Text(e
                                                            .fabricCategory
                                                            .toString())))
                                                .toList(),
                                          ),
                                        ),
                                        Tooltip(
                                          message: "Add Fabric Category",
                                          textStyle:
                                              TextStyle(color: Colors.black),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                                                          AddFabricCategory()));
                                            },
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (!feb.isWrapDone) {
                            context.loaderOverlay.show();
                            Map<String, dynamic> params = {
                              "fabric_name": feb.nameController.text
                            };

                            await febricvalidation(
                                    parameter: jsonEncode(params))
                                .then((value) {
                              if (value.success == true) {
                                Get.find<FebricAddController>().isWrapDone =
                                    true;
                                widget.page.jumpToPage(1);
                              } else {
                                FlutterToast.showCustomToast(
                                    value.message ?? "");
                              }
                              context.loaderOverlay.hide();
                            }).onError((error, stackTrace) {
                              print("error..$error");
                              context.loaderOverlay.hide();
                            });
                          } else {
                            Get.find<FebricAddController>().isWrapDone = true;
                            widget.page.jumpToPage(1);
                          }
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent)),
                      child: Text('NEXT')),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
