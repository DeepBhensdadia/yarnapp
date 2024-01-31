import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/febriceditcontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/widgets/customdropdown.dart';
import '../../../getxcontrollers/febricaddcontroller.dart';
import '../../../model/getresultmodelresponse.dart';
import '../../../widgets/common_fields.dart';

class EditWeftCategory extends StatefulWidget {
  final PageController page;
  const EditWeftCategory({super.key, required this.page, this.general});
  final GetResultModel? general;

  @override
  State<EditWeftCategory> createState() => _EditWeftCategoryState();
}

class _EditWeftCategoryState extends State<EditWeftCategory>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  FebricEditController feb = Get.put(FebricEditController());
  PageController? pageController;

  @override
  void initState() {
    isdataavilable = true;
    pageController =
        PageController(keepPage: true, initialPage: feb.currenttab);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isdataavilable = false;
  bool fabricbasic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getHeader(),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      feb.currenttab = value;
                    });
                  },
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 5),
                              children: feb.weftModel
                                  .asMap()
                                  .entries
                                  .map((element) => Card(
                                        key: element.value.key,
                                        elevation: 2.5,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(bottom: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: defaultCardRadius),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "WEFT - ${element.key + 1}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 25),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Column(
                                                  children: [
                                                    Obx(() =>
                                                        CustomDropdownyarn(
                                                          validing: (p0) {
                                                            if (p0 == null &&
                                                                fabricbasic ==
                                                                    true) {
                                                              return "Please Select Yarn";
                                                            }
                                                            return null;
                                                          },
                                                          initialValue: element
                                                              .value
                                                              .selectedYarnID
                                                              .value,
                                                          // initialValue: widget
                                                          //     .general
                                                          //     ?.weftlist?[
                                                          //         element.key]
                                                          //     .yarnId,
                                                          hint:
                                                              "--Select Yarn--",
                                                          yarn: feb.yarnData,
                                                          onSelection: (val) {
                                                            setState(() {
                                                              isdataavilable =
                                                                  true;
                                                            });
                                                            feb.editedt = true;
                                                            element
                                                                .value
                                                                .selectedYarnID
                                                                .value = val!;
                                                            element
                                                                .value.focusNode
                                                                .requestFocus();
                                                          },
                                                        )),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CommonDecimalTextField(
                                                        focusnode: element
                                                            .value.focusNode,
                                                        onchange: (p0) {
                                                          setState(() {
                                                            p0.isNotEmpty ||
                                                                    element.value
                                                                            .selectedYarnID !=
                                                                        0
                                                                ? isdataavilable =
                                                                    true
                                                                : isdataavilable =
                                                                    false;
                                                          });
                                                          feb.weftModel.forEach(
                                                              (element) {
                                                            if (element
                                                                    .ppiController
                                                                    .text
                                                                    .isNotEmpty ||
                                                                // element.repeatController.text.isNotEmpty ||
                                                                element.selectedYarnID !=
                                                                    0) {
                                                              setState(() {
                                                                isdataavilable =
                                                                    true;
                                                              });
                                                              return; // Exit the loop early if data is found
                                                            }
                                                          });
                                                          feb.editedt = true;
                                                        },
                                                        validatorfield: (p0) {
                                                          if (p0!.isEmpty) {
                                                            return "Enter PPI";
                                                          } else if (double
                                                                  .parse(p0) <
                                                              1.0) {
                                                            return "PPI should be greater than 0";
                                                          }
                                                          return null;
                                                        },
                                                        controller: element
                                                            .value
                                                            .ppiController,
                                                        labelText: 'Enter PPI ',
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        hintText: 'Enter PPI ',
                                                        InputAction:
                                                            TextInputAction
                                                                .next),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CommonDecimalTextField(
                                                        onchange: (p0) {
                                                          setState(() {
                                                            p0.isNotEmpty ||
                                                                    element.value
                                                                            .selectedYarnID !=
                                                                        0
                                                                ? isdataavilable =
                                                                    true
                                                                : isdataavilable =
                                                                    false;
                                                          });
                                                          feb.weftModel.forEach(
                                                              (element) {
                                                            if (element.ppiController.text.isNotEmpty ||
                                                                element
                                                                    .tpmController
                                                                    .text
                                                                    .isNotEmpty ||
                                                                element.selectedYarnID !=
                                                                    0) {
                                                              setState(() {
                                                                isdataavilable =
                                                                    true;
                                                              });
                                                              return; // Exit the loop early if data is found
                                                            }
                                                          });
                                                          feb.editedt = true;
                                                        },
                                                        // validatorfield: (p0) {
                                                        //   if (p0!.isEmpty) {
                                                        //     return "Enter TPM";
                                                        //   } else if (double
                                                        //           .parse(p0) <
                                                        //       1.0) {
                                                        //     return "PPI should be greater than 0";
                                                        //   }
                                                        //   return null;
                                                        // },
                                                        controller: element
                                                            .value
                                                            .tpmController,
                                                        labelText:
                                                            'Enter TPM Cost per kg (optional) ',
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        hintText:
                                                            'Enter TPM Cost per kg (optional)',
                                                        InputAction:
                                                            TextInputAction
                                                                .next),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 25, bottom: 50),
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      fabricbasic = true;
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).requestFocus(FocusNode());

                                        bool done = feb.weftModel.every(
                                            (element) =>
                                                element.selectedYarnID != 0);
                                        if (done == true) {
                                          Get.find<FebricEditController>()
                                              .isResultDone = true;
                                          feb.goToResult(
                                            widget,
                                          );
                                          widget.page.jumpToPage(3);
                                        } else {
                                          FlutterToast.showCustomToast(
                                              "Please Select Weft Yarn");
                                        }
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent)),
                                    child: Text('Get Result')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 5),
                              children: feb.weftModel
                                  .asMap()
                                  .entries
                                  .map(
                                    (element) => Card(
                                      key: element.value.key,
                                      elevation: 2.5,
                                      color: Colors.white,
                                      margin: EdgeInsets.only(bottom: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: defaultCardRadius),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "WEFT - ${element.key + 1}",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 25),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                children: [
                                                  Obx(() =>
                                                      CustomDropdownyarn(
                                                        validing: (p0) {
                                                          if (p0 == null &&
                                                              fabricbasic ==
                                                                  true) {
                                                            return "Please Select Yarn";
                                                          }
                                                          return null;
                                                        },
                                                        // key: UniqueKey(),
                                                        initialValue: element
                                                            .value
                                                            .selectedYarnID
                                                            .value,
                                                        // initialValue: widget
                                                        //     .general
                                                        //     ?.weftlist?[element.key]
                                                        //     .yarnId,
                                                        hint: "--Select Yarn--",
                                                        yarn: feb.yarnData,
                                                        onSelection: (val) {
                                                          setState(() {
                                                            isdataavilable =
                                                                true;
                                                          });
                                                          feb.editedt = true;
                                                          element
                                                              .value
                                                              .selectedYarnID
                                                              .value = val!;
                                                          element
                                                              .value.focusNode
                                                              .requestFocus();
                                                        },
                                                      )),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  CommonDecimalTextField(
                                                      focusnode: element
                                                          .value.focusNode,
                                                      onchange: (p0) {
                                                        setState(() {
                                                          p0.isNotEmpty ||
                                                                  element
                                                                      .value
                                                                      .ppiController
                                                                      .text
                                                                      .isNotEmpty ||
                                                                  element
                                                                          .value
                                                                          .selectedYarnID
                                                                          .value !=
                                                                      0
                                                              ? isdataavilable =
                                                                  true
                                                              : isdataavilable =
                                                                  false;
                                                        });
                                                        feb.weftModel
                                                            .forEach((element) {
                                                          if (element.ppiController.text.isNotEmpty ||
                                                              element
                                                                  .repeatController
                                                                  .text
                                                                  .isNotEmpty ||
                                                              element.selectedYarnID !=
                                                                  0) {
                                                            setState(() {
                                                              isdataavilable =
                                                                  true;
                                                            });
                                                            return; // Exit the loop early if data is found
                                                          }
                                                        });
                                                        feb.editedt = true;
                                                      },
                                                      validatorfield: (p0) {
                                                        if (p0!.isEmpty) {
                                                          return "Enter Repeat";
                                                        } else if (double.parse(
                                                                p0) <
                                                            1.0) {
                                                          return "Repeat should be greater than 0";
                                                        }
                                                        return null;
                                                      },
                                                      controller: element.value
                                                          .repeatController,
                                                      labelText:
                                                          'Enter Repeat ',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      hintText: 'Enter Repeat ',
                                                      InputAction:
                                                          TextInputAction.next),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  CommonDecimalTextField(
                                                      onchange: (p0) {
                                                        setState(() {
                                                          p0.isNotEmpty ||
                                                                  element
                                                                      .value
                                                                      .repeatController
                                                                      .text
                                                                      .isNotEmpty ||
                                                                  element
                                                                          .value
                                                                          .selectedYarnID
                                                                          .value !=
                                                                      0
                                                              ? isdataavilable =
                                                                  true
                                                              : isdataavilable =
                                                                  false;
                                                        });
                                                        feb.weftModel
                                                            .forEach((element) {
                                                          if (element.ppiController.text.isNotEmpty ||
                                                              element
                                                                  .repeatController
                                                                  .text
                                                                  .isNotEmpty ||
                                                              element.selectedYarnID !=
                                                                  0) {
                                                            setState(() {
                                                              isdataavilable =
                                                                  true;
                                                            });
                                                            return; // Exit the loop early if data is found
                                                          }
                                                        });
                                                        feb.editedt = true;
                                                      },
                                                      validatorfield: (p0) {
                                                        // bool allNonZero = feb
                                                        //     .weftModel
                                                        //     .any((element) =>
                                                        //         element.ppiController
                                                        //                 .text !=
                                                        //             "0" ||
                                                        //         element.ppiController
                                                        //                 .text !=
                                                        //             "00");
                                                        if (p0!.isEmpty) {
                                                          return "Enter PPI";
                                                        }
                                                        return null;
                                                      },
                                                      controller: element
                                                          .value.ppiController,
                                                      labelText: 'Enter PPI ',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      hintText: 'Enter PPI ',
                                                      InputAction:
                                                          TextInputAction.next),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  CommonDecimalTextField(
                                                      onchange: (p0) {
                                                        setState(() {
                                                          p0.isNotEmpty ||
                                                                  element.value
                                                                          .selectedYarnID !=
                                                                      0
                                                              ? isdataavilable =
                                                                  true
                                                              : isdataavilable =
                                                                  false;
                                                        });
                                                        feb.weftModel
                                                            .forEach((element) {
                                                          if (element.ppiController.text.isNotEmpty ||
                                                              element
                                                                  .tpmController
                                                                  .text
                                                                  .isNotEmpty ||
                                                              element.selectedYarnID !=
                                                                  0) {
                                                            setState(() {
                                                              isdataavilable =
                                                                  true;
                                                            });
                                                            return; // Exit the loop early if data is found
                                                          }
                                                        });
                                                        feb.editedt = true;
                                                      },
                                                      // validatorfield: (p0) {
                                                      //   if (p0!.isEmpty) {
                                                      //     return "Enter PPI";
                                                      //   } else if (double
                                                      //       .parse(p0) <
                                                      //       1.0) {
                                                      //     return "PPI should be greater than 0";
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      controller: element
                                                          .value.tpmController,
                                                      labelText:
                                                          'Enter TPM Cost per kg (optional)',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      hintText:
                                                          'Enter TPM Cost per kg (optional)',
                                                      InputAction:
                                                          TextInputAction.next),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 25, bottom: 50),
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      fabricbasic = true;
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).requestFocus(FocusNode());

                                        bool done = feb.weftModel.every(
                                            (element) =>
                                                element.selectedYarnID != 0);
                                        bool oneppicheck = feb.weftModel.any(
                                            (element) =>
                                                double.parse(element
                                                    .ppiController.text) >=
                                                1);
                                        if (done == true) {
                                          if (oneppicheck) {
                                            Get.find<FebricEditController>()
                                                .isResultDone = true;
                                            feb.goToResult(
                                              widget,
                                            );
                                            widget.page.jumpToPage(3);
                                          } else {
                                            FlutterToast.showCustomToast(
                                                "At least one PPI should be greater than 0");
                                          }
                                        } else {
                                          FlutterToast.showCustomToast(
                                              "Please Select Weft Yarn");
                                        }

                                        // widget.page.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent)),
                                    child: Text('Get Result')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  List<String> headername = ["Basic", "Advance"];

  Widget getHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
      child: Row(
        children: [
          SizedBox(width: screenwidth(context, dividedby: 10)),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(7.5),
              ),
              // color: Colors.white70,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(headername.length, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          feb.weftModel.forEach((element) {
                            if (index != 1) {
                              if (element.ppiController.text.isNotEmpty ||
                                  element.repeatController.text.isNotEmpty ||
                                  element.tpmController.text.isNotEmpty ||
                                  element.selectedYarnID != 0) {
                                isdataavilable = true;
                                return; // Exit the loop early if data is found
                              }
                            } else {
                              if (element.ppiController.text.isNotEmpty ||
                                  element.tpmController.text.isNotEmpty ||
                                  element.selectedYarnID != 0) {
                                isdataavilable = true;
                                return; // Exit the loop early if data is found
                              }
                            }
                          });
                          if (isdataavilable == false) {
                            _formKey.currentState!.reset();
                            pageController!.jumpToPage(index);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: feb.currenttab == index
                                  ? MyTheme.appBarColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(7.5),
                              // border: Border.all(
                              //   color: feb.currenttab == index
                              //       ? Colors.grey
                              //       : Colors.transparent,
                              // ),
                            ),
                            child: Text(
                              headername[index],
                              textScaleFactor: 1.1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: feb.currenttab == index
                                      ? Colors.white
                                      : isdataavilable == true
                                          ? Colors.grey
                                          : Colors.black,
                                  fontWeight: feb.currenttab == index
                                      ? FontWeight.w500
                                      : FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                feb.weftModel.forEach((element) {
                  element.ppiController.clear();
                  element.tpmController.clear();
                  element.repeatController.clear();
                  element.selectedYarnID.value = 0;
                });

                isdataavilable = false;
                setState(() {});
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
