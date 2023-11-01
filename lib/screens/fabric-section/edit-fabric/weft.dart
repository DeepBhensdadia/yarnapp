import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/febriceditcontroller.dart';
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
    edit = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      feb.weftModel.forEach((element) {
                        element.ppiController.clear();
                        element.repeatController.clear();
                        element.selectedYarnID = 0;
                      });
                      setState(() {});
                    },
                    child: Text(
                      "Reset",
                    )),
              ],
            ),
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
                                                    CustomDropdownyarn(
                                                      key: UniqueKey(),
                                                      initialValue: widget
                                                          .general
                                                          ?.weftlist?[
                                                              element.key]
                                                          .yarnId,
                                                      hint: "--Select Yarn--",
                                                      yarn: feb.yarnData,
                                                      onSelection: (val) {
                                                        feb.editedt = true;
                                                        element.value
                                                                .selectedYarnID =
                                                            val!;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CommonDecimalTextField(
                                                        onchange: (p0) {
                                                          p0.isNotEmpty ? feb.editedt = true: feb.editedt = false;
                                                        },
                                                        validatorfield: (p0) {
                                                          if (p0!.isEmpty) {
                                                            return "enter ppi";
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
                                        Get.find<FebricEditController>()
                                            .isResultDone = true;
                                        feb.goToResult(
                                            widget.general?.general?.id);
                                        widget.page.jumpToPage(3);
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
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              children: [
                                                CustomDropdownyarn(
                                                  key: UniqueKey(),
                                                  initialValue: widget
                                                      .general
                                                      ?.weftlist?[element.key]
                                                      .yarnId,
                                                  hint: "--Select Yarn--",
                                                  yarn: feb.yarnData,
                                                  onSelection: (val) {
                                                    feb.editedt = true;
                                                    element.value
                                                        .selectedYarnID = val!;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                CommonDecimalTextField(
                                                    onchange: (p0) {
                                                      p0.isNotEmpty ? feb.editedt = true: feb.editedt = false;
                                                    },
                                                    validatorfield: (p0) {
                                                      if (p0!.isEmpty) {
                                                        return "enter repeat";
                                                      }
                                                      return null;
                                                    },
                                                    controller: element
                                                        .value.repeatController,
                                                    labelText: 'Enter repeat ',
                                                    keyboardType:
                                                        TextInputType.number,
                                                    hintText: 'Enter repeat ',
                                                    InputAction:
                                                        TextInputAction.next),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                CommonDecimalTextField(
                                                    onchange: (p0) {
                                                      p0.isNotEmpty ? feb.editedt = true: feb.editedt = false;
                                                    },
                                                    validatorfield: (p0) {
                                                      if (p0!.isEmpty) {
                                                        return "enter ppi";
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
                                    // if (_formKey.currentState!.validate()) {
                                    Get.find<FebricEditController>()
                                        .isResultDone = true;
                                    feb.goToResult(widget);
                                    // }
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
  bool edit = false;
  Widget getHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
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
                        element.ppiController.text.isNotEmpty ||
                                element.repeatController.text.isNotEmpty
                            ? edit = true
                            : edit = false;
                      } else {
                        element.ppiController.text.isNotEmpty
                            ? edit = true
                            : edit = false;
                      }
                    });
                    if (edit == false) pageController!.jumpToPage(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
    );
  }
}
