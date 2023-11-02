import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/yarncategorydata.dart';
import '../../const/const.dart';
import '../../model/get-yarn-category-model.dart';
import '../../services/all_api_services.dart';
import 'add-yarn-category.dart';
import 'edit-yarn-category.dart';

class YarnCategoryScreen extends StatefulWidget {
  const YarnCategoryScreen({super.key});

  @override
  State<YarnCategoryScreen> createState() => _YarnCategoryScreenState();
}

class _YarnCategoryScreenState extends State<YarnCategoryScreen> {
  TextEditingController editDialogController = TextEditingController();
  TextEditingController floatingDialogController = TextEditingController();
  final ScrollController _allController = ScrollController();

  @override
  void dispose() {
    floatingDialogController.dispose();
    editDialogController.dispose();
    super.dispose();
  }

  YarnCategoryController yarncategorycontroller =
      Get.put(YarnCategoryController());

  @override
  void initState() {
    super.initState();
    yarncategorycontroller.fetchDataFromAPI();
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
                Colors.white.withOpacity(0.85),
              ])),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  'Yarn Category',
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
                      ])),
                ),
                actions: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                      message: "Add Yarn Category",
                      textStyle: TextStyle(color: Colors.black),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddYarnCategory()));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 15),
                            color: Colors.transparent,
                            child: Icon(Icons.add_rounded)),
                      ),
                    ),
                  ),
                ],
              ),
              body: GetBuilder<YarnCategoryController>(
                builder: (controller) => controller.yarncategorybool == true
                    ? RefreshIndicator(
                        color: Colors.white,
                        onRefresh: () async {
                          await controller.fetchDataFromAPI();
                        },
                        child: Scrollbar(
                          controller: _allController,
                          interactive: true,
                          child: ListView.separated(
                            // physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                                top: 20, left: 15, right: 15, bottom: 20),
                            controller: _allController,
                            // itemCount: yarnCategoryItems.length,
                            itemCount: controller.getData.length,
                            itemBuilder: (BuildContext context, int index) {
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
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      label: "Edit",
                                      spacing: 10,
                                      onPressed: (context) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditYarnCategory(
                                                        yarnCategoryData:
                                                            controller.getData[
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
                                        // if(yarnLowTwistItems[index] == 0 || yarnLowTwistItems[index] > 0) {
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
                                                  "Do you want to Delete this Yarn Category?",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black
                                                          .withOpacity(0.6)),
                                                ),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                      style:
                                                          TextButton.styleFrom(
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
                                                              Colors.red
                                                                  .withOpacity(
                                                                      0.3),
                                                          foregroundColor:
                                                              Colors.red,
                                                          backgroundColor:
                                                              Colors.red),
                                                      onPressed: () async {
                                                        await deleteYarnCategoryData(
                                                                categoryId: controller
                                                                        .getData[
                                                                            index]
                                                                        ?.id
                                                                        .toString() ??
                                                                    "")
                                                            .then((value) {
                                                          if (value.success !=
                                                              false) {
                                                            controller.getData
                                                                .clear();
                                                            controller
                                                                .fetchDataFromAPI();
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
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white70),
                                                      )),
                                                ],
                                              );
                                            });
                                        // }
                                      },
                                    ),
                                  ],
                                ),
                                child: Card(
                                  elevation: 2.5,
                                  color: Colors.white,
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: categoryCardRadius),
                                  child: ListTile(
                                    title: Text(
                                      // yarnCategoryItems[index]['text'],
                                      controller.getData[index]!.yarnCategory,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onTap: () {},
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
                        ))
                    : Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.black,
                        ),
                      ),
              )),
        ));
  }
}

/* //Modification UI
* Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          children: List.generate(
                            yarnCategoryItems.length,
                            (index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      yarnCategoryItems[index]['text'],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            splashRadius: 20,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditYarnCategory(
                                                              yarnCategoryData:
                                                                  yarnCategoryItems[
                                                                      index])));
                                            },
                                            icon: Icon(
                                              CupertinoIcons.pencil_circle,
                                              color: Colors.black,
                                            )),
                                        IconButton(
                                            splashRadius: 20,
                                            onPressed: () {
                                              setState(() {
                                                yarnCategoryItems.removeAt(index);
                                                FlutterToast.showCustomToast(
                                                    "(${yarnCategoryItems[index]['text']}) Deleted Successfully");
                                                // print(yarnCategoryItems);
                                              });
                                            },
                                            icon: Icon(
                                              CupertinoIcons.delete,
                                              color: Colors.black,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    endIndent: 10,
                                    indent: 10,
                                    thickness: 1.5,
                                    height: 0,
                                    color: Colors.grey.withOpacity(0.25),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
* */
