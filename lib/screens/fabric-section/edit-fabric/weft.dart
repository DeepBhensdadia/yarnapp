import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/febriceditcontroller.dart';
import 'package:yarn_modified/widgets/customdropdown.dart';
import '../../../model/getresultmodelresponse.dart';
import '../../../widgets/common_fields.dart';

class EditWeftCategory extends StatefulWidget {
  final PageController page;
  const EditWeftCategory({super.key, required this.page, this.general});
  final GetResultModel? general;

  @override
  State<EditWeftCategory> createState() => _EditWeftCategoryState();
}

class _EditWeftCategoryState extends State<EditWeftCategory>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController? _tabController;

  FebricEditController feb = Get.put(FebricEditController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              padding: EdgeInsets.only(bottom: 10),
              controller: _tabController,
              physics: BouncingScrollPhysics(),
              indicatorColor: Colors.white,
              labelColor: MyTheme.appBarColor,
              unselectedLabelColor: Colors.black,
              splashBorderRadius: BorderRadius.circular(15),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              tabs: [
                Tooltip(
                  message: 'BASIC',
                  child: Tab(child: Text('BASIC', textScaleFactor: 0.95)),
                ),
                Tooltip(
                  message: 'ADVANCE',
                  child: Tab(
                      child: Text(
                    'ADVANCE',
                    textScaleFactor: 0.95,
                  )),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 5),
                              children: feb.weftModel
                                  .asMap()
                                  .entries
                                  .map((element) => Card(
                                        key: element.value.key,
                                        elevation: 2.5,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(bottom: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: defaultCardRadius),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "WEFT - ${element.key + 1}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 25),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Column(
                                                  children: [
                                                    CustomDropdownyarn(
                                                      initialValue: widget
                                                          .general
                                                          ?.weftlist?[
                                                              element.key]
                                                          .yarnId,
                                                      hint: "--Select Yarn--",
                                                      yarn: feb.yarnData,
                                                      onSelection: (val) {
                                                        setState(() {
                                                          element.value
                                                                  .selectedYarnID =
                                                              val!;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CommonDecimalTextField(
                                                        validatorfield: (p0) {
                                                          if (p0!.isEmpty) {
                                                            return "enter ppi";
                                                          }
                                                          return null;
                                                        },
                                                        controller: element
                                                            .value
                                                            .ppiController,
                                                        labelText: 'Enter PPI ',
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        hintText: 'Enter PPI ',
                                                        InputAction:
                                                            TextInputAction
                                                                .next),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 25, bottom: 50),
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Get.find<FebricEditController>()
                                            .isResultDone = true;
                                        feb.goToResult(
                                            widget.general?.general?.id);
                                        widget.page.jumpToPage(3);
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent)),
                                    child: Text('Get Result')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container()
                    // SingleChildScrollView(
                    //   physics: BouncingScrollPhysics(),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       ListView(
                    //         physics: BouncingScrollPhysics(),
                    //         shrinkWrap: true,
                    //         padding: EdgeInsets.only(top: 5),
                    //         children: feb.weftModel
                    //             .asMap()
                    //             .entries
                    //             .map((element) => Card(
                    //                   key: element.value.key,
                    //                   elevation: 2.5,
                    //                   color: Colors.white,
                    //                   margin: EdgeInsets.only(bottom: 20),
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius: defaultCardRadius),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.symmetric(
                    //                         vertical: 20),
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.center,
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         Container(
                    //                           width: double.infinity,
                    //                           height: 35,
                    //                           decoration: BoxDecoration(
                    //                             color: Colors.black
                    //                                 .withOpacity(0.1),
                    //                           ),
                    //                           child: Center(
                    //                             child: Text(
                    //                               "WEFT - ${element.key + 1}",
                    //                               style: TextStyle(
                    //                                   color: Colors.black),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         SizedBox(height: 20),
                    //                         Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   horizontal: 15),
                    //                           child: Column(
                    //                             children: [
                    //                               CustomDropdownyarn(
                    //                                 hint: "--Select Yarn--",
                    //                                 yarn: feb.yarnData,
                    //                                 onSelection: (val) {
                    //                                   setState(() {
                    //                                     element.value
                    //                                             .selectedYarnID =
                    //                                         val!;
                    //                                   });
                    //                                 },
                    //                               ),
                    //                               SizedBox(
                    //                                 height: 20,
                    //                               ),
                    //                               CommonDecimalTextField(
                    //                                   controller: element.value
                    //                                       .repeatController,
                    //                                   labelText:
                    //                                       'Enter Repeat ',
                    //                                   keyboardType:
                    //                                       TextInputType.number,
                    //                                   hintText: 'Enter Repeat ',
                    //                                   InputAction:
                    //                                       TextInputAction.next),
                    //                               SizedBox(
                    //                                 height: 20,
                    //                               ),
                    //                               CommonDecimalTextField(
                    //                                   controller: element
                    //                                       .value.ppiController,
                    //                                   labelText: 'Enter PPI ',
                    //                                   keyboardType:
                    //                                       TextInputType.number,
                    //                                   hintText: 'Enter PPI ',
                    //                                   InputAction:
                    //                                       TextInputAction.next),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ))
                    //             .toList(),
                    //       ),
                    //       Center(
                    //         child: Container(
                    //           padding: EdgeInsets.only(
                    //               left: 5, right: 5, top: 25, bottom: 50),
                    //           width: double.infinity,
                    //           child: ElevatedButton(
                    //               onPressed: () {
                    //                 // feb.changedDataweft();
                    //                 // feb.Addfebrickaro(widget);
                    //               },
                    //               style: ButtonStyle(
                    //                   shape: MaterialStateProperty.all(
                    //                       RoundedRectangleBorder(
                    //                           borderRadius:
                    //                               BorderRadius.circular(8))),
                    //                   elevation: MaterialStateProperty.all(0),
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(
                    //                           Colors.blueAccent)),
                    //               child: Text('NEXT')),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
