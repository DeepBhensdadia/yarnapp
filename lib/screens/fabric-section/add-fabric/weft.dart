import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/febricaddcontroller.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/yarn-section/add-yarn.dart';
import 'package:yarn_modified/widgets/customdropdown.dart';
import '../../../widgets/common_fields.dart';

class AddWeftCategory extends StatefulWidget {
  final PageController page;
  const AddWeftCategory({super.key, required this.page});

  @override
  State<AddWeftCategory> createState() => _AddWeftCategoryState();
}

class _AddWeftCategoryState extends State<AddWeftCategory>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  PageController? pageController;
  // final ScrollController _scrollController = ScrollController();

  FebricAddController feb = Get.put(FebricAddController());

  @override
  void initState() {
    super.initState();

    pageController = PageController(keepPage: true, initialPage: 0);
    feb.fillModelweftBasic();
  }

  @override
  void dispose() {
    super.dispose();
    // _scrollController.dispose();
    pageController!.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isdataavilable = false;
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
            Expanded(
              child: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      feb.currenttab = value;
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      // controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            text(),
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
                                                    GetBuilder<
                                                        YarnListController>(
                                                      builder: (controller) =>
                                                          Row(
                                                        children: [
                                                          Expanded(
                                                              child: Obx(
                                                            () =>
                                                                CustomDropdownyarn(
                                                              // validing: (p0) {
                                                              //   if (p0 == null) {
                                                              //     return "Please Select Yarn";
                                                              //   }
                                                              //   return null;
                                                              // },
                                                              initialValue: element
                                                                  .value
                                                                  .selectedYarnID
                                                                  .value,
                                                              hint:
                                                                  "--Select Yarn--",
                                                              yarn: controller
                                                                  .yarnData,
                                                              onSelection:
                                                                  (val) {
                                                                // setState(() {});
                                                                setState(() {
                                                                  isdataavilable =
                                                                      true;
                                                                });
                                                                feb.editedt =
                                                                    true;
                                                                element
                                                                    .value
                                                                    .selectedYarnID
                                                                    .value = val!;
                                                              },
                                                            ),
                                                          )),
                                                          IconButton(
                                                              onPressed: () {
                                                                Get.to(
                                                                    AddYarn());
                                                              },
                                                              icon: Icon(

                                                                Icons.add_circle_outline_rounded,
                                                                color:
                                                                    Colors.grey,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CommonDecimalTextField(
                                                        onchange: (p0) {
                                                          setState(() {
                                                            p0.isNotEmpty ||
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
                                                          p0.isNotEmpty ||
                                                                  element
                                                                          .value
                                                                          .selectedYarnID
                                                                          .value !=
                                                                      0
                                                              ? feb.editedt =
                                                                  true
                                                              : feb.editedt =
                                                                  false;
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
                                                          feb.weftModel.forEach(
                                                                  (element) {
                                                                if (element
                                                                    .ppiController
                                                                    .text
                                                                    .isNotEmpty ||
                                                                     element.TpmController.text.isNotEmpty ||
                                                                    element.selectedYarnID !=
                                                                        0) {
                                                                  setState(() {
                                                                    isdataavilable =
                                                                    true;
                                                                  });
                                                                  return; // Exit the loop early if data is found
                                                                }
                                                              });
                                                          p0.isNotEmpty ||
                                                              element
                                                                  .value
                                                                  .selectedYarnID
                                                                  .value !=
                                                                  0
                                                              ? feb.editedt =
                                                          true
                                                              : feb.editedt =
                                                          false;
                                                        },
                                                        // validatorfield: (p0) {
                                                        //   if (p0!.isEmpty) {
                                                        //     return "Enter TPM";
                                                        //   } else if (double.parse(p0) < 1.0) {
                                                        //     return "Ends (Taar) should be greater than 0";
                                                        //   }
                                                        //   return null;
                                                        // },
                                                        controller: element.value.TpmController,
                                                        labelText: 'Enter TPM Cost per kg (optional)',
                                                        keyboardType: TextInputType.number,
                                                        hintText: 'Enter TPM Cost per kg (optional)',
                                                        InputAction: TextInputAction.next),
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
                                      if (_formKey.currentState!.validate()) {
                                        bool done = feb.weftModel.every(
                                            (element) =>
                                                element.selectedYarnID != 0);
                                        if (done == true) {
                                          fabricbasic = true;
                                          Get.find<FebricAddController>()
                                              .isResultDone = true;
                                          feb.goToResult(widget);
                                          print("done");
                                        } else {
                                          FlutterToast.showCustomToast(
                                              "Select Weft Yarn");
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
                      // controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            text(),
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
                                                  GetBuilder<
                                                      YarnListController>(
                                                    builder: (controller) =>
                                                        Row(
                                                      children: [
                                                        Expanded(
                                                            child: Obx(
                                                          () =>
                                                              CustomDropdownyarn(
                                                            // validing: (p0) {
                                                            //   if (p0 == 0) {
                                                            //     return "Please Select Yarn";
                                                            //   }
                                                            //   return null;
                                                            // },
                                                            initialValue: element
                                                                .value
                                                                .selectedYarnID
                                                                .value,
                                                            // key: UniqueKey(),
                                                            hint:
                                                                "--Select Yarn--",
                                                            yarn: controller
                                                                .yarnData,
                                                            onSelection: (val) {
                                                              setState(() {
                                                                isdataavilable =
                                                                    true;
                                                              });

                                                              feb.editedt =
                                                                  true;
                                                              element
                                                                  .value
                                                                  .selectedYarnID
                                                                  .value = val!;
                                                            },
                                                          ),
                                                        )),
                                                        IconButton(
                                                            onPressed: () {
                                                              Get.to(AddYarn());
                                                            },
                                                            icon: Icon(
                                                              Icons.add_circle_outline_rounded,
                                                              color:
                                                                  Colors.grey,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  CommonDecimalTextField(
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
                                                        feb.weftModel.forEach(
                                                                (element) {
                                                              if (element
                                                                  .ppiController
                                                                  .text
                                                                  .isNotEmpty ||
                                                                  element.TpmController.text.isNotEmpty ||
                                                                  element.selectedYarnID !=
                                                                      0) {
                                                                setState(() {
                                                                  isdataavilable =
                                                                  true;
                                                                });
                                                                return; // Exit the loop early if data is found
                                                              }
                                                            });
                                                        p0.isNotEmpty ||
                                                            element
                                                                .value
                                                                .selectedYarnID
                                                                .value !=
                                                                0
                                                            ? feb.editedt =
                                                        true
                                                            : feb.editedt =
                                                        false;
                                                      },
                                                      // validatorfield: (p0) {
                                                      //   if (p0!.isEmpty) {
                                                      //     return "Enter TPM";
                                                      //   } else if (double.parse(p0) < 1.0) {
                                                      //     return "Ends (Taar) should be greater than 0";
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      controller: element.value.TpmController,
                                                      labelText: 'Enter TPM Cost per kg (optional)',
                                                      keyboardType: TextInputType.number,
                                                      hintText: 'Enter TPM Cost per kg (optional)',
                                                      InputAction: TextInputAction.next),
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
                                      if (_formKey.currentState!.validate()) {
                                        print("hablja,bjcm");
                                        bool done = feb.weftModel.every(
                                            (element) =>
                                                element.selectedYarnID != 0);
                                        bool oneppicheck = feb.weftModel
                                            .any((element) =>
                                                double.parse(element
                                                    .ppiController.text) >=
                                                1);
                                        if (done == true) {
                                          if (oneppicheck) {
                                            fabricbasic = true;
                                            feb.goToResult(widget);
                                            print("done");
                                          } else {
                                           FlutterToast.showCustomToast("At least one PPI should be greater than 0");
                                          }
                                        } else {
                                          FlutterToast.showCustomToast(
                                              "Select Weft Yarn");
                                        }
                                      } else {
                                        print("djvkjbsdlvkj");
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

  bool fabricbasic = false;
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
                  vertical: 5,
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
                                  element.selectedYarnID != 0) {
                                setState(() {
                                  isdataavilable = true;
                                });
                                return; // Exit the loop early if data is found
                              }
                            } else {
                              if (element.ppiController.text.isNotEmpty ||
                                  element.selectedYarnID != 0) {
                                setState(() {
                                  isdataavilable = true;
                                });
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
                                horizontal: 8, vertical: 3),
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
                  element.repeatController.clear();
                  element.selectedYarnID.value = 0;
                });
                isdataavilable = false;
                feb.editedt = true;
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

  Widget text() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
                textAlign: TextAlign.start,
                "Note :- ",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500)),
          ),
          Flexible(
            flex: 5,
            child: Text(
                textAlign: TextAlign.start,
                "If you have the average PPI of all weft, use “Basic” otherwise, use “Advance”.",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
