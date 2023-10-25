import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final PageController pageController = PageController();
  FebricAddController feb = Get.put(FebricAddController());
  @override
  void initState() {
    feb.fetchDataFromAPI(key: "");
    feb.yarncategorydatafetch();
    feb.clearall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          getHeader(),
          SizedBox(
            height: 20,
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
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        controller: _allController,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(headerAddFabricItems.length, (index) {
            return GestureDetector(
              onTap: () {
                if (index != 0) {
                  if (activeTab >= index) {
                    pageController.jumpToPage(index);
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color:
                        activeTab == index ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(7.5),
                    border: Border.all(
                      color:
                          activeTab == index ? Colors.grey : Colors.transparent,
                    )),
                child: Tooltip(
                  padding: EdgeInsets.all(5),
                  message: headerAddFabricItems[index]['text'],
                  textStyle: TextStyle(color: Colors.black, fontSize: 13),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    headerAddFabricItems[index]['text'],
                    textScaleFactor: 0.95,
                    style: TextStyle(
                        color: activeTab == index
                            ? MyTheme.appBarColor
                            : Colors.black,
                        fontWeight: activeTab == index
                            ? FontWeight.w500
                            : FontWeight.w400),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
