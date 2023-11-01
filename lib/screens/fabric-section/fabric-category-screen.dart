import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric-category.dart';
import 'package:yarn_modified/screens/fabric-section/edit-fabric-category.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../model/get-fabric-category-model.dart';
import '../../services/all_api_services.dart';

class FabricCategoryScreen extends StatefulWidget {
  const FabricCategoryScreen({super.key});

  @override
  State<FabricCategoryScreen> createState() => _FabricCategoryScreenState();
}

class _FabricCategoryScreenState extends State<FabricCategoryScreen> {
  TextEditingController editDialogController = TextEditingController();
  TextEditingController floatingDialogController = TextEditingController();
  final ScrollController _allController = ScrollController();

  SlidableController? slidableController;
  bool slideOn = true;

  FebricCategoryController febricCategoryController =
      Get.put(FebricCategoryController());

  @override
  void initState() {
    super.initState();
    febricCategoryController.fetchDataFromAPI();
  }

  @override
  void dispose() {
    floatingDialogController.dispose();
    editDialogController.dispose();
    super.dispose();
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
                'Fabric Category',
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
                    message: "Add Fabric Category",
                    textStyle: TextStyle(color: Colors.black),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFabricCategory()));
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
            body: GetBuilder<FebricCategoryController>(
              builder: (controller) => controller.febricbool == true
                  ? RefreshIndicator(
                      color: Colors.white,
                      onRefresh: () async {
                        await controller.fetchDataFromAPI();
                      },
                      child: Scrollbar(
                        controller: _allController,
                        child: ListView.separated(
                          // physics: BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15, bottom: 20),
                          shrinkWrap: true,
                          controller: _allController,
                          // itemCount: fabricCategoryItems.length,
                          itemCount: controller.getData.length,
                          itemBuilder: (BuildContext context, int index) {
                            // fabricItem allData = yarnAllItems[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    autoClose: true,
                                    backgroundColor: Colors.green,
                                    icon: CupertinoIcons.pencil,
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    label: "Edit",
                                    spacing: 10,
                                    onPressed: (context) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditFabricCategory(
                                                      fabricCategoryData:
                                                          controller.getData[
                                                              index])));
                                    },
                                  ),
                                  SlidableAction(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                    autoClose: true,
                                    backgroundColor: Colors.red,
                                    icon: CupertinoIcons.delete,
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    label: "Delete",
                                    spacing: 10,
                                    onPressed: (context) {
                                      // if(yarnLowTwistItems[index] == 0 || yarnLowTwistItems[index] > 0) {
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
                                                            Colors.transparent),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    )),
                                                TextButton(
                                                    style: TextButton.styleFrom(
                                                        surfaceTintColor: Colors
                                                            .red
                                                            .withOpacity(0.3),
                                                        foregroundColor:
                                                            Colors.red,
                                                        backgroundColor:
                                                            Colors.transparent),
                                                    onPressed: () async {
                                                      await deleteFabricCategoryData(
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
                                                          setState(() {

                                                          });
                                                        }
                                                        FlutterToast
                                                            .showCustomToast(
                                                                value.message);
                                                        print(value);
                                                      }).onError((error,
                                                              stackTrace) {
                                                        print(error);
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.red),
                                                    )),
                                              ],
                                            );
                                          });
                                      // }
                                    },
                                  ),
                                ],
                              ),
                              child: SlidableAutoCloseBehavior(
                                closeWhenOpened: true,
                                child: Card(
                                  elevation: 2.5,
                                  color: Colors.white,
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: defaultCardRadius),
                                  child: ListTile(
                                    title: Text(
                                      // fabricCategoryItems[index]['text'],
                                      controller.getData[index]!.fabricCategory,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
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
      ),
    );
  }
}

/*
*  Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          children: List.generate(fabricCategoryItems.length, (index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(fabricCategoryItems[index]['text'],style: TextStyle(color: Colors.black),),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(splashRadius: 20,onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditFabricCategory(
                                              fabricCategoryData: fabricCategoryItems[index]
                                          )));
                                        }, icon: Icon(CupertinoIcons.pencil_circle,color: Colors.black,)),
                                        IconButton(splashRadius: 20,onPressed: () {
                                          setState(() {
                                            fabricCategoryItems.removeAt(index);
                                            FlutterToast.showCustomToast("(${fabricCategoryItems[index]['text']}) Deleted Successfully");
                                            print(fabricCategoryItems);
                                          });
                                        }, icon: Icon(CupertinoIcons.delete,color: Colors.black,))
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
