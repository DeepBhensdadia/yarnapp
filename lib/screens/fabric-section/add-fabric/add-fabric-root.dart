import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/result.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/warp.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/weft.dart';
import '../../../const/themes.dart';
import '../../../static_json/root_app_json.dart';
import '../../../getxcontrollers/febricaddcontroller.dart';
import 'general.dart';

class AddFabricRoot extends StatefulWidget {
  const AddFabricRoot({super.key});

  @override
  State<AddFabricRoot> createState() => _AddFabricRootState();
}

class _AddFabricRootState extends State<AddFabricRoot> {
  final ScrollController _allController = ScrollController();
  dynamic activeTab = 0;
  final PageController pageController = PageController(keepPage: true);
  FebricAddController feb = Get.put(FebricAddController());
  FebricCategoryController febcategory = Get.put(FebricCategoryController());
  YarnListController yarnListController = Get.put(YarnListController());

  @override
  void initState() {
    feb.editedt = false;
    feb.isadddone = false;
    feb.isWrapDone = false;
    feb.isWeftDone = false;
    feb.isResultDone = false;
    yarnListController.fetchDataFromAPI(key: "");
    febcategory.fetchDataFromAPI();
    feb.clearall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FebricAddController());
    return Container(
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
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: getBody(),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    feb.editedt == true
                        ? showdialogboxalert(
                            context, "Do you want to exit without Saving?")
                        : Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              Expanded(child: getHeader()),
              // IconButton(
              //     onPressed: () {
              //       FocusScope.of(context).requestFocus(FocusNode());
              //     },
              //     icon: Icon(
              //       Icons.keyboard_alt_outlined,
              //       color: Colors.black,
              //     )),
            ],
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  activeTab = value;
                });
              },
              children: [
                AddGeneralCategory(page: pageController),
                AddWarpCategory(page: pageController),
                AddWeftCategory(page: pageController),
                AddResultCategory(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(7.5),
        ),
        // color: Colors.white70,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(headerAddFabricItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  final controller = Get.find<FebricAddController>();
                  if (activeTab >= index) {
                    pageController.jumpToPage(index);
                  }
                  // if (controller.isWrapDone) {
                  //   if (index == 0 || index == 1) {
                  //     pageController.jumpToPage(index);
                  //   }
                  //   // return;
                  // }
                  //
                  // if (controller.isWeftDone) {
                  //   if (index == 0 || index == 2 || index == 1) {
                  //     pageController.jumpToPage(index);
                  //     return;
                  //   }
                  // }
                  // if (controller.isResultDone && index != activeTab) {
                  //   feb.goToResult(pageController);
                  //   pageController.jumpToPage(index);
                  // }
                  // if (activeTab >= index) {
                  //   pageController.jumpToPage(index);
                  // }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: activeTab == index
                          ? MyTheme.appBarColor.withOpacity(1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Text(
                      headerAddFabricItems[index]['text'],
                      textScaleFactor: 0.95,
                      style: TextStyle(
                          color: activeTab == index
                              ? Colors.white
                              : activeTab >= index
                                  ? Colors.black
                                  : Colors.grey,
                          fontWeight: activeTab == index
                              ? FontWeight.w500
                              : FontWeight.w500),
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
