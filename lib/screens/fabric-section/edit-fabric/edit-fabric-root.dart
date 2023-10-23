import 'package:flutter/material.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric/result.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric/warp.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric/weft.dart';
import '../../../const/themes.dart';
import '../../../static_json/root_app_json.dart';
import '../../../widgets/common_fields.dart';
import 'general.dart';

class EditFabricRoot extends StatefulWidget {
  const EditFabricRoot({
    super.key,
    this.fabricAllItemsData,
    // this.velvetData,
    // this.georgetteData,
    // this.cottonData,
    // this.softCottonData,
    // this.chiffonData,
    // this.crepeCottonData,
    // this.satinSilkData,
    // this.silkCottonData
  });

  final fabricAllItemsData;
  // final velvetData;
  // final georgetteData;
  // final cottonData;
  // final softCottonData;
  // final chiffonData;
  // final crepeCottonData;
  // final satinSilkData;
  // final silkCottonData;

  @override
  State<EditFabricRoot> createState() => _EditFabricRootState();
}

class _EditFabricRootState extends State<EditFabricRoot> {
  final ScrollController _allController = ScrollController();
  int activeTab = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(_pageListener);
    // TODO: implement initState
    super.initState();
  }

  void _pageListener() {
    setState(() {
      activeTab = int.parse(pageController.page!.round().toString());
    });
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
                  ])),
            ),
            // leading: IconButton(
            //     splashRadius: 20,
            //     onPressed: () {
            //       setState(() {
            //         if(nameController.text.isEmpty && denierController.text.isEmpty && yarnRateController.text.isEmpty && categoryController.text.isEmpty) {
            //           Navigator.of(context).pop(false);
            //         }
            //         else if (nameController.text.isNotEmpty || denierController.text.isNotEmpty || yarnRateController.text.isNotEmpty || categoryController.text.isNotEmpty) {
            //           showDialog(
            //               context: context,
            //               builder: (BuildContext context) {
            //                 return AlertDialog(
            //                   backgroundColor: Colors.white,
            //                   title: Text(
            //                     "Alert",
            //                     style: TextStyle(fontSize: 20, color: Colors.red),
            //                   ),
            //                   content: Text(
            //                     "Are you sure you would like to go back without saving data that you have added in text field(s) ?",
            //                     style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            //                   ),
            //                   actions: <Widget>[
            //                     TextButton(
            //                         style: TextButton.styleFrom(
            //                             foregroundColor: Colors.grey,
            //                             backgroundColor: Colors.white.withOpacity(0.9)),
            //                         onPressed: () {
            //                           Navigator.of(context).pop(false);
            //                         },
            //                         child: Text(
            //                           "Cancel",
            //                           style: TextStyle(fontSize: 15, color: Colors.black),
            //                         )),
            //                     TextButton(
            //                         style: TextButton.styleFrom(
            //                             foregroundColor: Colors.grey,
            //                             backgroundColor: Colors.white.withOpacity(0.9)),
            //                         onPressed: () {
            //                           Navigator.of(context).pop(false);
            //                           // Navigator.push(context, MaterialPageRoute(builder: (context) => YarnCategoryScreen()));
            //                           Navigator.of(context).pop(false);
            //                         },
            //                         child: Text(
            //                           "Yes",
            //                           style: TextStyle(fontSize: 15, color: Colors.black),
            //                         )),
            //                   ],
            //                 );
            //               });
            //         }
            //       });
            //     },
            //     icon: Icon(Icons.arrow_back_rounded)
            // ),
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
              // onPageChanged: (_) {},
              children: [
                EditGeneralCategory(
                    fabricAllItemsData: widget.fabricAllItemsData,
                    page: pageController
                    //   velvetData: widget.velvetData,
                    //   georgetteData: widget.georgetteData,
                    //   cottonData: widget.cottonData,
                    //   softCottonData: widget.softCottonData,
                    //   chiffonData: widget.chiffonData,
                    //   crepeCottonData: widget.crepeCottonData,
                    // satinSilkData: widget.satinSilkData,
                    // silkCottonData: widget.silkCottonData,
                    ),
                EditWarpCategory(page: pageController),
                EditWeftCategory(page: pageController),
                EditResultCategory()
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
                setState(() {
                  activeTab = index;
                });
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
                  textStyle: TextStyle(color: Colors.white),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(7.5)),
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
