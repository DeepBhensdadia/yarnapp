import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/result.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/warp.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/weft.dart';
import '../../../const/themes.dart';
import '../../../static_json/root_app_json.dart';
import '../../../widgets/common_fields.dart';
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Add Fabric',
              textScaleFactor: 1,
              style:
                  TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            // centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  feb.editedt == true
                      ? showdialogboxalert(context)
                      : Get.back();
                },
                icon: Icon(Icons.arrow_back)),
            backgroundColor: MyTheme.appBarColor,
            elevation: 5,
            automaticallyImplyLeading: false,
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
                  ],
                ),
              ),
            ),
          ),
          body: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          getHeader(),
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
    return SingleChildScrollView(
      controller: _allController,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(headerAddFabricItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    final controller = Get.find<FebricAddController>();
                    if (controller.isWrapDone) {
                      if (index == 0 || index == 1) {
                        pageController.jumpToPage(index);
                      }
                      // return;
                    }

                    if (controller.isWeftDone) {
                      if (index == 0 || index == 2 || index == 1) {
                        pageController.jumpToPage(index);
                        return;
                      }
                    }
                    if (controller.isResultDone && index != activeTab) {
                      feb.goToResult(pageController);
                      pageController.jumpToPage(index);
                    }
                    if (activeTab >= index) {
                      pageController.jumpToPage(index);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: activeTab == index
                            ? MyTheme.appBarColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(7.5),
                        // border: Border.all(
                        //   color: activeTab == index
                        //       ? Colors.grey
                        //       : Colors.transparent,
                        // ),
                      ),
                      child: Text(
                        headerAddFabricItems[index]['text'],
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: activeTab == index
                                ? Colors.white
                                : Colors.black,
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
      ),
    );
  }
}
