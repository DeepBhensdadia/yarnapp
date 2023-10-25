import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
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

  @override
  void initState() {
    febricsController.getfebrics();
    // TODO: implement initState
    super.initState();
  }
List count  = [
  "4000.00","10.00","2.00","5000.00","100.00"
];
  List count2  = [
  "2.00","1400.00","200.00","5.00","1000.00"
];
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
                    child: Container(
                      height: double.infinity,
                      // child: MultiSelectDialogField(
                      //   // dialogHeight: MediaQuery.of(context).size.height,
                      //   chipDisplay: MultiSelectChipDisplay.none(),
                      //   items: List.generate(
                      //       yarnCatData.length,
                      //           (index) => MultiSelectItem(
                      //           index, "${yarnCatData[index]!.yarnCategory}")),
                      //   title: Text("Fabric Categories", style: TextStyle(color: MyTheme.appBarColor),),
                      //   selectedColor: Colors.blue,
                      //   buttonIcon: Icon(
                      //     Icons.category_outlined,
                      //     color: Colors.white,
                      //     size: 21,
                      // ),
                      //   buttonText: Text(
                      //     "",
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: Colors.transparent,
                      //     borderRadius: BorderRadius.all(Radius.circular(40)),
                      //
                      //   ),
                      //
                      //   onConfirm: (_) {
                      //     // _selectedAnimals2;
                      //   },
                      // ),
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
                                  },
                                  title: Text(
                                    "Sort By Price (High To Low)",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    CupertinoIcons.money_dollar,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    "Sort By Price (Low To high)",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Icon(
                                    CupertinoIcons.money_dollar,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
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
                              setState(() {});
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text('Name',
                                    textScaleFactor: 1.15,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.teal.shade800,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        // width: 70,
                                        child: Text('Meter',
                                            textScaleFactor: 1.15,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.teal.shade800,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    VerticalDivider(
                                      thickness: 1,
                                      color: Colors.grey.shade500,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 70,
                                        child: Text('Piece',
                                            textScaleFactor: 1.15,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.teal.shade800,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                            await fabricAllItems;
                          },
                          child: Scrollbar(
                            controller: _allController,
                            child: ListView.separated(
                              // physics: BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  top: 0, left: 7.5, right: 7.5, bottom: 20),
                              shrinkWrap: true,
                              controller: _allController,
                              itemCount: 5,
                              // itemCount: controller
                              //         .febriclist.fabricCostList?.length ??
                              //     0,
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
                                                          fabricAllItemsData:
                                                              fabricAllItems[
                                                                  index])));
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
                                                  backgroundColor: Colors.white,
                                                  title: Text(
                                                    "Remove",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                  content: Text(
                                                    "Are you sure you would like to remove fabric information ?",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                        style: TextButton.styleFrom(
                                                            surfaceTintColor:
                                                                Colors.grey,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent),
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
                                                    TextButton(
                                                        style: TextButton.styleFrom(
                                                            surfaceTintColor:
                                                                Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.3),
                                                            foregroundColor:
                                                                Colors.red,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent),
                                                        onPressed: () {
                                                          setState(() {
                                                            fabricAllItems
                                                                .removeAt(
                                                                    index);
                                                            FlutterToast
                                                                .showCustomToast(
                                                                    "${fabricAllItems[index]['title']}) Deleted Successfully");
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false);
                                                          });
                                                        },
                                                        child: Text(
                                                          "Remove",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.red),
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
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10,right: 10),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.grey,
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
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          "${febric?.fabricName.toString()} patel bhenb" ??
                                                              "",
                                                          textScaleFactor: 1.2,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                          febric?.categoryName ??
                                                              "",
                                                          textScaleFactor: 0.9,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 10.0,top: 10,bottom: 10),
                                            child: Container(
                                              height: 40,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        // '${febric?.finalPpi?.toDouble().toStringAsFixed(2)}',
                                                        count[index],
                                                        textScaleFactor: 1.15,
                                                        textAlign: TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .brown,
                                                            fontWeight:
                                                                FontWeight.w500)),
                                                  ),
                                                  VerticalDivider(
                                                    endIndent: 0,
                                                    indent: 0,
                                                    thickness: 1,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        // '${febric?.warpWastage?.toDouble().toStringAsFixed(2)}',
                                                        count2[index],
                                                        textScaleFactor: 1.15,
                                                        textAlign: TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .brown,
                                                            fontWeight:
                                                                FontWeight.w500)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
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

/*Widget getFooter() {
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.appBarColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
      ),
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10,left: 100,right: 100),
        child: Tooltip(
          message: "Add Fabric",
          textStyle: TextStyle(color: Colors.white),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  foregroundColor:
                  MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddFabricRoot()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Add Fabric"),
                ],
              )),
        ),
      ),
    );
  }*/

// Widget getHeader() {
//   return ScrollConfiguration(
//     behavior: MyBehavior(),
//     child: SingleChildScrollView(
//       controller: _allController,
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: List.generate(headerFabricItems.length, (index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 activeTab = index;
//               });
//             },
//             child: Container(
//               padding: EdgeInsets.all(5),
//               margin: EdgeInsets.only(left: 5,right: 5),
//               decoration: BoxDecoration(
//                   color: activeTab == index
//                       ? Colors.white
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(7.5),
//                   border: Border.all(
//                     color: activeTab == index
//                         ? Colors.grey
//                         : Colors.transparent,
//                   )
//               ),
//               child: Tooltip(
//                 padding: EdgeInsets.all(5),
//                 message: headerFabricItems[index]['text'],
//                 textStyle: TextStyle(
//                     color: Colors.white),decoration: BoxDecoration(color: Colors.black,
//                   borderRadius: BorderRadius.circular(7.5)),
//                 child: Text(headerFabricItems[index]['text'], textScaleFactor: 0.95,style: TextStyle(
//                     color: activeTab == index
//                       ? Colors.black
//                       : Colors.black.withOpacity(0.4),
//                     fontWeight: activeTab == index
//                       ? FontWeight.w600
//                       : FontWeight.w500),
//                 ),),
//               ),
//             );
//         }),
//       ),
//     ),
//   );
// }

/*  // Old Design Modification
*
*
*
* */
