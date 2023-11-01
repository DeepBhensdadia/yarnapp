import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/getxcontrollers/febriceditcontroller.dart';
import 'package:yarn_modified/getxcontrollers/getresultscontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/model/getresultmodelresponse.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/result.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/warp.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric/weft.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric/result.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric/warp.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric/weft.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import '../../../const/themes.dart';
import '../../../static_json/root_app_json.dart';
import '../../../widgets/common_fields.dart';

import 'general.dart';

class EditFabricRoot extends StatefulWidget {
  final FabricCostList? febricdata;
  const EditFabricRoot({super.key, this.febricdata});

  @override
  State<EditFabricRoot> createState() => _EditFabricRootState();
}

class _EditFabricRootState extends State<EditFabricRoot> {
  final ScrollController _allController = ScrollController();
  dynamic activeTab = 0;
  final PageController pageController = PageController(keepPage: true);
  FebricEditController feb = Get.put(FebricEditController());
  FebricCategoryController febcategory = Get.put(FebricCategoryController());
  GetResultController getResultController = Get.put(GetResultController());

  @override
  void initState() {
    feb.editedt = false;
    feb.clearall();
    getResultController.getresultcall(
        id: widget.febricdata?.id.toString() ?? " ");
    feb.numberOfWarpYarnController.text =
        widget.febricdata?.warpYarn.toString() ?? "";
    feb.numberOfWeftYarnController.text =
        widget.febricdata?.weftYarn.toString() ?? "";
    feb.fetchDataFromAPI(key: "");
    febcategory.fetchDataFromAPI();
    feb.fillModel();
    feb.fillModelweftBasic();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FebricEditController());
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
            leading: IconButton(
                onPressed: () {
                  feb.editedt == true
                      ? showdialogboxalert(context)
                      : Get.back();
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(
              'Edit Fabric',
              textScaleFactor: 1,
              style:
                  TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
            ),
            iconTheme: IconThemeData(color: Colors.white),
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
        child: GetBuilder<GetResultController>(
          builder: (controller) => Column(
            children: [
              getHeader(),
              Expanded(
                child: controller.call != true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            activeTab = value;
                          });
                        },
                        children: [
                          EditGeneralCategory(
                              page: pageController, general: controller.result),
                          EditWarpCategory(
                              page: pageController, general: controller.result),
                          EditWeftCategory(
                              page: pageController, general: controller.result),
                          EditResultCategory(),
                        ],
                      ),
              ),
            ],
          ),
        ));
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
                    // final controller = Get.find<FebricEditController>();
                    if (index != 3) {
                      pageController.jumpToPage(index);
                    } else {
                      if (activeTab != index)
                        feb.goToResult(widget.febricdata?.id);
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: activeTab == index
                            ? MyTheme.appBarColor.withOpacity(1)
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
