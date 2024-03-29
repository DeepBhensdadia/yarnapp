import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/getxcontrollers/febricslistcontroller.dart';
import 'package:yarn_modified/getxcontrollers/getdetailscheckcontroller.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/screens/main-fabric%20root/photoscreen.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/services/app_url.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../fabric-section/add-fabric/add-fabric-root.dart';
import '../fabric-section/edit-fabric/edit-fabric-root.dart';
import 'fabric-detail-screen.dart';

class FabricScreenRoot extends StatefulWidget {
  const FabricScreenRoot({super.key});

  @override
  State<FabricScreenRoot> createState() => _FabricScreenRootState();
}

class _FabricScreenRootState extends State<FabricScreenRoot> {
  final ScrollController _allController = ScrollController();
  int activeTab = 0;

  FebricListControllers febricsController = Get.put(FebricListControllers());
  GetDetailsCheck getdetailsController = Get.put(GetDetailsCheck());
  FebricCategoryController febricscategory =
      Get.put(FebricCategoryController());

  @override
  void initState() {
    febricsController.searchController
        .clear();
    final stopwatch = Stopwatch()..start();
    febricsController.getfebrics();
    print('doSomething() executed in ${stopwatch.elapsed}');
    febricscategory.fetchDataFromAPI();
    // TODO: implement initState
    super.initState();
  }

  List fabricsselected = [];
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
                style: TextStyle(
                    letterSpacing: 0.5, color: MyTheme.appBarTextColor),
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
                GetBuilder<FebricListControllers>(
                  builder: (controller) => Row(
                    children: [
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
                                      febricsController.searchController
                                          .clear();
                                      if (value.isNotEmpty) {
                                        fabricsselected.clear();
                                        fabricsselected = value;
                                        febricsController.getfebrics(
                                            category: value.toString());
                                      } else {
                                        fabricsselected.clear();
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
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                          'Sort by :',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            febricsController.searchController
                                                .clear();
                                            Navigator.pop(context);
                                            febricsController.getfebrics(
                                                key: "",
                                                category:
                                                    fabricsselected.toString(),
                                                price: "desc");
                                          },
                                          title: Text(
                                            "Sort by Price (High to Low)",
                                            textScaleFactor: 1.2,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          leading: Icon(
                                            Icons.currency_rupee,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            febricsController.searchController
                                                .clear();

                                            Navigator.pop(context);
                                            febricsController.getfebrics(
                                                key: "",
                                                category:
                                                    fabricsselected.toString(),
                                                price: "asc");
                                          },
                                          title: Text(
                                            "Sort by Price (Low to High)",
                                            textScaleFactor: 1.2,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          leading: Icon(
                                            Icons.currency_rupee,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            febricsController.searchController
                                                .clear();

                                            Navigator.pop(context);
                                            febricsController.getfebrics(
                                                key: "",
                                                category:
                                                    fabricsselected.toString(),
                                                atoz: true);
                                          },
                                          title: Text(
                                            "Sort by A to Z",
                                            textScaleFactor: 1.2,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          leading: Icon(
                                            Icons.abc,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            febricsController.searchController
                                                .clear();

                                            Navigator.pop(context);
                                            febricsController.getfebrics(
                                                key: "",
                                                category:
                                                    fabricsselected.toString(),
                                                date: "desc");
                                          },
                                          title: Text(
                                            "Sort by Date",
                                            style:
                                                TextStyle(color: Colors.black),
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: IconButton(
                      splashRadius: 25,
                      tooltip: "Add Febric",
                      onPressed: () {
                        if (getdetailsController.exprired.isFalse) {
                          Get.to(AddFabricRoot());
                        } else {
                          FlutterToast.showCustomToast(URLs.expiredtoast);
                        }
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(5),
              child: GetBuilder<FebricListControllers>(
                builder: (controller) => controller.febriclistbool == false
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 3,
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 7.5),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.grey)),
                                  child: TextField(
                                      cursorColor: Colors.black,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                            15,
                                      ),
                                      controller:
                                          febricsController.searchController,
                                      onChanged: (text) {
                                        if (text != "") {
                                          febricsController.getfebrics(
                                            category:
                                                fabricsselected.toString(),
                                            key: text,
                                          );
                                        } else {
                                          febricsController.getfebrics(
                                            category:
                                                fabricsselected.toString(),
                                          );
                                        }
                                      },
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: Colors.grey.shade600,
                                            size: 30,
                                          ),
                                          suffixIcon: febricsController
                                                  .searchController
                                                  .text
                                                  .isNotEmpty
                                              ? IconButton(
                                                  splashRadius: 0.1,
                                                  onPressed: () {
                                                    febricsController
                                                        .searchController
                                                        .clear();
                                                    febricsController
                                                        .getfebrics(
                                                      category: fabricsselected
                                                          .toString(),
                                                    );
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
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent),
                                              borderRadius: BorderRadius.circular(5)),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(5)))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 8, right: 8),
                                  child: Container(
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('Per Metre',
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
                          controller.febriclist.isEmpty
                              ? Expanded(
                                  child: Center(
                                    child: Text(
                                      "No Data Found",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: RefreshIndicator(
                                  color: Colors.blue,
                                  onRefresh: () async {
                                    await febricsController.getfebrics(
                                      category: fabricsselected.toString(),
                                    );
                                  },
                                  child: ListView.builder(
                                    primary: false,
                                    addAutomaticKeepAlives: false,
                                    addRepaintBoundaries: false,
                                    // physics: BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                        top: 0,
                                        left: 10,
                                        right: 10,
                                        bottom: 20),
                                    shrinkWrap: true,
                                    controller: _allController,

                                    itemCount:
                                        controller.febriclist.length ?? 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      FabricCostList? febric =
                                          controller.febriclist[index];
                                      return Padding(
                                        padding:
                                             EdgeInsets.only(bottom: (index + 1 != controller.febriclist.length) ? 10 :50),
                                        child: Slidable(
                                          // key: UniqueKey(),
                                          endActionPane: ActionPane(
                                            motion: ScrollMotion(),

                                            // closeThreshold: 1,
                                            children: [
                                              SlidableAction(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                                backgroundColor: Colors.green,
                                                icon: CupertinoIcons.pencil,
                                                padding: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                label: "Edit",
                                                spacing: 10,
                                                onPressed: (context) {
                                                  if (getdetailsController
                                                      .exprired.isFalse) {
                                                    Get.to(EditFabricRoot(
                                                        febricdata: febric));
                                                  } else {
                                                    FlutterToast
                                                        .showCustomToast(
                                                            URLs.expiredtoast);
                                                  }
                                                },
                                              ),
                                              SlidableAction(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8)),
                                                backgroundColor: Colors.red,
                                                icon: CupertinoIcons.delete,
                                                padding: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                label: "Delete",
                                                spacing: 10,
                                                onPressed: (context) {
                                                  if (getdetailsController
                                                      .exprired.isFalse) {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .shade200,
                                                            title: Text(
                                                              "Alert",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            content: Text(
                                                              "Do you want to Delete this Fabric?",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  // fontWeight: FontWeight.w600,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.6)),
                                                            ),
                                                            actions: <Widget>[
                                                              ElevatedButton(
                                                                  style: TextButton.styleFrom(
                                                                      elevation:
                                                                          5,
                                                                      surfaceTintColor:
                                                                          Colors
                                                                              .grey,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white70),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            false);
                                                                  },
                                                                  child: Text(
                                                                    "Cancel",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black),
                                                                  )),
                                                              ElevatedButton(
                                                                  style: TextButton.styleFrom(
                                                                      elevation:
                                                                          5,
                                                                      surfaceTintColor: Colors
                                                                          .red
                                                                          .withOpacity(
                                                                              0.3),
                                                                      foregroundColor:
                                                                          Colors
                                                                              .red,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red),
                                                                  onPressed:
                                                                      () async {
                                                                    await deleteFabricData(
                                                                            categoryId: controller.febriclist[index].id.toString() ??
                                                                                "")
                                                                        .then(
                                                                            (value) {
                                                                      if (value
                                                                              .success !=
                                                                          false) {
                                                                        controller
                                                                            .febriclist
                                                                            .clear();
                                                                        controller
                                                                            .getfebrics();
                                                                      }
                                                                      FlutterToast
                                                                          .showCustomToast(
                                                                              value.message);
                                                                      print(
                                                                          value);
                                                                    }).onError((error,
                                                                            stackTrace) {
                                                                      print(
                                                                          error);
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                    "Delete",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white70),
                                                                  )),
                                                            ],
                                                          );
                                                        });
                                                  } else {
                                                    FlutterToast
                                                        .showCustomToast(
                                                            URLs.expiredtoast);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              if (getdetailsController
                                                  .exprired.isFalse) {
                                                Get.to(FabricDetailScreen(
                                                    data: controller
                                                        .febriclist[index]));
                                              } else {
                                                FlutterToast.showCustomToast(
                                                    URLs.expiredtoast);
                                              }
                                            },
                                            child: Card(
                                              // elevation: 2.5,
                                              color: Colors.white,
                                              margin: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      defaultCardRadius),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        flex: 3,
                                                        child: Row(
                                                          children: [
                                                            Flexible(
                                                                flex: 1,
                                                                child:
                                                                    PhotoScreen(
                                                                  dobbn: 27,
                                                                  image: URLs
                                                                          .image_url +
                                                                      "assets/fabric/${febric.photo}",
                                                                  fabricid: febric
                                                                      .id
                                                                      .toString(),
                                                                )
                                                                //     CircleAvatar(
                                                                //   backgroundColor:
                                                                //       Colors.grey,
                                                                //   radius: 27,
                                                                //   foregroundImage:
                                                                //       NetworkImage(
                                                                //           URLs.image_url +
                                                                //               "assets/fabric/${febric.photo}"),
                                                                // ),
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
                                                                      "${febric.fabricName.toString()}" ??
                                                                          "",
                                                                      textScaleFactor:
                                                                          1.25,
                                                                      style:
                                                                          TextStyle(
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
                                                                      febric.categoryName ??
                                                                          "",
                                                                      textScaleFactor:
                                                                          1.1,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.grey)),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      5.0),
                                                          child: Text(
                                                              febric.fabricCost
                                                                      ?.toDouble()
                                                                      .toStringAsFixed(
                                                                          2) ??
                                                                  "",
                                                              textScaleFactor:
                                                                  1.25,
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )

                                  //     GetBuilder<FebricListControllers>(
                                  //   builder: (controller) => controller.febriclistbool == false
                                  //       ? Center(
                                  //           child: CircularProgressIndicator(),
                                  //         )
                                  //       : ,
                                  // )
                                  ),
                          // SizedBox(
                          //   height: 50,
                          // )
                        ],
                      ),
              ),
              // bottomNavigationBar: getFooter(),
            ),
          ),
        ));
  }
}
