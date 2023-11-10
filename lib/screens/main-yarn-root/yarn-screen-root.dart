import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/yarncategorydata.dart';
import 'package:yarn_modified/getxcontrollers/yarnlistcontroller.dart';
import 'package:yarn_modified/model/get-yarn-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import 'package:yarn_modified/screens/yarn-section/edit-yarn.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import '../../const/themes.dart';
import '../../static_json/category-json.dart';
import '../yarn-section/add-yarn.dart';

class YarnScreenRoot extends StatefulWidget {
  const YarnScreenRoot({super.key});

  @override
  State<YarnScreenRoot> createState() => _YarnScreenRootState();
}

class _YarnScreenRootState extends State<YarnScreenRoot> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _allController = ScrollController();

  YarnListController yarnlist = Get.put(YarnListController());
  YarnCategoryController yarncategorycontroll =
      Get.put(YarnCategoryController());

  @override
  void initState() {
    super.initState();
    yarnlist.fetchDataFromAPI(key: "");
    yarncategorycontroll.fetchDataFromAPI();
  }

  List yarnhbj = [];
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
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Yarn Rate',
              textScaleFactor: 1,
              style:
                  TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
            actions: [
              Theme(
                data: ThemeData(
                  canvasColor: Colors.black,
                  buttonColor: MyTheme.appBarColor,
                  buttonTheme: ButtonThemeData(
                      colorScheme: ColorScheme.dark(
                          onSurface: MyTheme.appBarColor,
                          onPrimary: MyTheme.appBarColor,
                          surface: MyTheme.appBarColor)),
                ),
                child: Tooltip(
                  message: "Categories",
                  textStyle: TextStyle(color: Colors.black),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    margin: EdgeInsets.only(top: 7, bottom: 5),
                    padding: const EdgeInsets.only(right: 10),
                    child: GetBuilder<YarnCategoryController>(
                      builder: (controler) =>
                          yarncategorycontroll.yarncategorybool == true
                              ? MultiSelectDialogField(
                                  // initialValue: yarnCatDataids,
                                  // chipDisplay: MultiSelectChipDisplay.none(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 1)))),
                                  chipDisplay: MultiSelectChipDisplay.none(),
                                  items: List.generate(
                                          controler.getData.length,
                                          (index) => MultiSelectItem(
                                              controler.getData[index]!.id,
                                              "${controler.getData[index]!.yarnCategory}"))
                                      .toList(),
                                  title: Text(
                                    "Yarn Categories",
                                    style:
                                        TextStyle(color: MyTheme.appBarColor),
                                  ),

                                  selectedColor: Colors.blue,
                                  buttonIcon: Icon(
                                    Icons.category_outlined,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                  buttonText: Text(
                                    "",
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),

                                  onConfirm: (value) {
                                    if (value.isNotEmpty) {
                                      yarnhbj = value;
                                      yarnlist.fetchDataFromAPI(
                                          key: "", category: value.toString());
                                    } else {
                                      yarnlist.fetchDataFromAPI(key: "");
                                    }
                                  },
                                )
                              : SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
              IconButton(
                  splashRadius: 25,
                  tooltip: "Sort",
                  onPressed: () async {
                    await showModalBottomSheet<void>(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      )),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'Sort By :',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    yarnlist.fetchDataFromAPI(
                                        key: "",
                                        category: yarnhbj.toString(),
                                        price: "desc");
                                  },
                                  title: Text(
                                    "Sort By Price (High To Low)",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    Icons.currency_rupee,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    yarnlist.fetchDataFromAPI(
                                        key: "",
                                        category: yarnhbj.toString(),
                                        price: "asc");
                                  },
                                  title: Text(
                                    "Sort By Price (Low To high)",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    Icons.currency_rupee,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    yarnlist.fetchDataFromAPI(
                                        category: yarnhbj.toString(),
                                        key: "",
                                        atoz: true);
                                  },
                                  title: Text(
                                    "Sort By A to Z",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    Icons.abc,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    yarnlist.fetchDataFromAPI(
                                        category: yarnhbj.toString(),
                                        key: "",
                                        date: "desc");
                                  },
                                  title: Text(
                                    "Sort By Date",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.sort_rounded,
                    size: 21,
                  )),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: IconButton(
                    splashRadius: 25,
                    tooltip: "Add Yarn",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddYarn()));
                    },
                    icon: Icon(Icons.add_rounded)),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 7.5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey)),
                        child: TextField(
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 15,
                            ),
                            controller: searchController,
                            onChanged: (text) {
                              yarnlist.fetchDataFromAPI(
                                key: text,
                                category: yarnhbj.toString(),
                              );
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade600,
                                  size: 30,
                                ),
                                suffixIcon: searchController.text.isNotEmpty
                                    ? IconButton(
                                        splashRadius: 0.1,
                                        onPressed: () {
                                          setState(() {
                                            searchController.text = "";
                                          });
                                          yarnlist.fetchDataFromAPI(
                                            key: "",
                                          );
                                        },
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                      )
                                    : SizedBox(),
                                hintText: "Search Yarn Rate...",
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            13,
                                    color: Colors.grey),
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(5)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(5)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(5)))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GetBuilder<YarnListController>(
                  builder: (controller) => controller.yarnlistbool == true
                      ? controller.yarnData.isEmpty
                          ? Center(
                              child: Text("No Data Found",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            )
                          : RefreshIndicator(
                              color: Colors.white,
                              onRefresh: () async {
                                await yarnlist.fetchDataFromAPI(key: "");
                              },
                              child: Scrollbar(
                                controller: _allController,
                                interactive: true,
                                child: ListView.separated(
                                  // physics: BouncingScrollPhysics(),
                                  padding: const EdgeInsets.only(
                                      top: 20,
                                      left: 7.5,
                                      right: 7.5,
                                      bottom: 20),
                                  shrinkWrap: true,
                                  controller: _allController,
                                  // itemCount: yarnAllItems.length,
                                  itemCount: controller.yarnData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // yarnItem allData = yarnAllItems[index];
                                    return Slidable(
                                      endActionPane: ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8)),
                                            backgroundColor: Colors.green,
                                            icon: CupertinoIcons.pencil,
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            label: "Edit",
                                            spacing: 10,
                                            onPressed: (context) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditYarn(
                                                            yarnAllItemsData:
                                                                controller
                                                                        .yarnData[
                                                                    index],
                                                            // yarnLowTwistItemsData: yarnLowTwistItems[index],
                                                            yarnCategoryData:
                                                                yarncategorycontroll
                                                                        .getData[
                                                                    index],
                                                          )));
                                            },
                                          ),
                                          SlidableAction(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                            backgroundColor: Colors.red,
                                            icon: CupertinoIcons.delete,
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            label: "Delete",
                                            spacing: 10,
                                            onPressed: (context) {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      title: Text(
                                                        "Alert",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.red),
                                                      ),
                                                      content: Text(
                                                        "Do you want to Delete this Yarn?",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            // fontWeight: FontWeight.w600,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.6)),
                                                      ),
                                                      actions: <Widget>[
                                                        ElevatedButton(
                                                            style: TextButton.styleFrom(
                                                                elevation: 5,
                                                                surfaceTintColor:
                                                                    Colors.grey,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white70),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(false);
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                        ElevatedButton(
                                                            style: TextButton.styleFrom(
                                                                elevation: 5,
                                                                surfaceTintColor:
                                                                    Colors.red
                                                                        .withOpacity(
                                                                            0.3),
                                                                foregroundColor:
                                                                    Colors.red,
                                                                backgroundColor:
                                                                    Colors.red),
                                                            onPressed:
                                                                () async {
                                                              await deleteYarnIndexData(
                                                                      categoryId:
                                                                          controller.yarnData[index]?.id.toString() ??
                                                                              "")
                                                                  .then(
                                                                      (value) {
                                                                if (value
                                                                        .success !=
                                                                    false) {
                                                                  controller
                                                                      .yarnData
                                                                      .clear();
                                                                  controller
                                                                      .fetchDataFromAPI(
                                                                          key:
                                                                              '');
                                                                }
                                                                FlutterToast
                                                                    .showCustomToast(
                                                                        value
                                                                            .message);
                                                                print(value);
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print(error);
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white70),
                                                            )),
                                                      ],
                                                    );
                                                  });
                                            },
                                          ),
                                        ],
                                      ),
                                      child: Card(
                                        elevation: 2.5,
                                        color: Colors.white,
                                        margin: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: defaultCardRadius),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: Text(
                                                        // yarnAllItems[index]['title'],
                                                        controller
                                                                .yarnData[index]
                                                                ?.yarnName
                                                                .toString() ??
                                                            "",
                                                        textScaleFactor: 1.25,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Text(
                                                        // yarnAllItems[index]['rate'],
                                                        "${controller.yarnData[index]?.yarnRate}",
                                                        textScaleFactor: 1.25,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          // fontWeight: FontWeight.w500,

                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                // "(Denier : ${denierItems[index]})",
                                                "${controller.yarnData[index]?.yarnCategory.toString()} (Denier : ${controller.yarnData[index]!.yarnDenier.toString()})",
                                                textScaleFactor: 1,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                ),
                              ),
                            )
                      : Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.black,
                          ),
                        ),
                )),
              ],
            ),
          ),
          // bottomNavigationBar: getFooter(),
        ),
      ),
    );
  }
}
