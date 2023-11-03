import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/getxcontrollers/febricslistcontroller.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../model/get-yarn-category-model.dart';
import '../../model/get-yarn-index-model.dart';
import '../../services/all_api_services.dart';
import '../../static_json/category-json.dart';
import '../../static_json/fabric-json.dart';
import '../fabric-section/add-fabric/add-fabric-root.dart';
import '../fabric-section/edit-fabric/edit-fabric-root.dart';
import 'fabric-detail-screen.dart';
import 'image-open-screen.dart';

class FabricScreenRoot extends StatefulWidget {
  const FabricScreenRoot({super.key});

  @override
  State<FabricScreenRoot> createState() => _FabricScreenRootState();
}

class _FabricScreenRootState extends State<FabricScreenRoot> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _allController = ScrollController();
  int activeTab = 0;

  FebricListControllers febricsController = Get.put(FebricListControllers());
  FebricCategoryController febricscategory =
      Get.put(FebricCategoryController());

  @override
  void initState() {
    febricscategory.fetchDataFromAPI();
    febricsController.getfebrics();
    // TODO: implement initState
    super.initState();
  }

  List count = ["4000.00", "10.00", "2.00", "5000.00", "100.00"];
  List count2 = ["2.00", "1400.00", "200.00", "5.00", "1000.00"];
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
              'Fabric Cost',
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
                  ],
                ),
              ),
            ),
            actions: [
              Theme(
                data: ThemeData(
                  canvasColor: Colors.black,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 7, bottom: 5),
                  padding: const EdgeInsets.only(right: 10),
                  child: Tooltip(
                      message: "Categories",
                      textStyle: TextStyle(color: Colors.black),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: GetBuilder<FebricCategoryController>(
                        builder: (controller) => Container(
                          height: double.infinity,
                          child: MultiSelectDialogField(
                            // dialogHeight: MediaQuery.of(context).size.height,
                            chipDisplay: MultiSelectChipDisplay.none(),
                            items: List.generate(
                                controller.getData.length,
                                (index) => MultiSelectItem(
                                    controller.getData[index]!.id,
                                    "${controller.getData[index]!.fabricCategory}")),
                            title: Text(
                              "Fabric Categories",
                              style: TextStyle(color: MyTheme.appBarColor),
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
                                febricsController.getfebrics(
                                    category: value.toString());
                              } else {
                                febricsController.getfebrics(key: "");
                              }
                              // _selectedAnimals2;
                            },
                          ),
                        ),
                      )),
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
                                    febricsController.getfebrics(
                                        key: "", price: "desc");
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
                                    febricsController.getfebrics(
                                        key: "", price: "asc");
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
                                    febricsController.getfebrics(
                                        key: "", atoz: true);
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
                                    febricsController.getfebrics(
                                        key: "", date: "desc");
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
                margin: const EdgeInsets.only(right: 5),
                child: IconButton(
                    splashRadius: 25,
                    tooltip: "Add Febric",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFabricRoot()));
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
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 15,
                            ),
                            controller: searchController,
                            onChanged: (text) {
                              febricsController.getfebrics(
                                key: text,
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
                                          searchController.clear();
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                      )
                                    : null,
                                hintText: "Search Fabric Cost...",
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 8, right: 8),
                        child: Container(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Per Meter',
                                  textScaleFactor: 1.15,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: GetBuilder<FebricListControllers>(
                  builder: (controller) => controller.febriclistbool == false
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          color: Colors.white,
                          onRefresh: () async {
                            await febricsController.getfebrics();
                          },
                          child: Scrollbar(
                            controller: _allController,
                            child: ListView.separated(
                              // physics: BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  top: 0, left: 10, right: 10, bottom: 20),
                              shrinkWrap: true,
                              controller: _allController,

                              itemCount: controller
                                      .febriclist.fabricCostList?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                FabricCostList? febric = controller
                                    .febriclist.fabricCostList?[index];
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
                                        padding:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        label: "Edit",
                                        spacing: 10,
                                        onPressed: (context) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditFabricRoot(
                                                          febricdata: febric)));
                                        },
                                      ),
                                      SlidableAction(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        backgroundColor: Colors.red,
                                        icon: CupertinoIcons.delete,
                                        padding:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        label: "Delete",
                                        spacing: 10,
                                        onPressed: (context) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
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
                                                    "Do you want to Delete this Fabric?",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        // fontWeight: FontWeight.w600,
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                                elevation: 5,
                                                                surfaceTintColor:
                                                                    Colors.grey,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white70),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(false);
                                                        },
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                    ElevatedButton(
                                                        style: TextButton.styleFrom(
                                                            elevation: 5,
                                                            surfaceTintColor:
                                                                Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.3),
                                                            foregroundColor:
                                                                Colors.red,
                                                            backgroundColor:
                                                                Colors.red),
                                                        onPressed: () {},
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FabricDetailScreen(
                                                      data: controller
                                                              .febriclist
                                                              .fabricCostList![
                                                          index])));
                                    },
                                    child: Card(
                                      elevation: 2.5,
                                      color: Colors.white,
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: defaultCardRadius),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 3,
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        radius: 27,
                                                        foregroundImage: AssetImage(
                                                            "images/avatar.png"),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Flexible(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "${febric?.fabricName.toString()}" ??
                                                                  "",
                                                              textScaleFactor:
                                                                  1.25,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                // fontWeight:
                                                                //     FontWeight
                                                                //         .w400
                                                              )),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                              febric?.categoryName ??
                                                                  "",
                                                              textScaleFactor:
                                                                  1.1,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5.0),
                                                  child: Text(
                                                      febric?.finalPpi
                                                              .toDouble()
                                                              .toStringAsFixed(
                                                                  2) ??
                                                          "",
                                                      textScaleFactor: 1.25,
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      )),
                                                ),
                                              ),
                                            ]),
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
