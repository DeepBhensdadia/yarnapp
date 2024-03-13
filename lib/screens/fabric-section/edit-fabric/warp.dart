import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/getxcontrollers/febriceditcontroller.dart';
import 'package:yarn_modified/widgets/customdropdown.dart';
import '../../../const/const.dart';
import '../../../model/getresultmodelresponse.dart';
import '../../../widgets/common_fields.dart';

class EditWarpCategory extends StatefulWidget {
  final PageController page;
  final GetResultModel? general;
  const EditWarpCategory({super.key, required this.page, this.general});

  @override
  State<EditWarpCategory> createState() => _EditWarpCategoryState();
}

class _EditWarpCategoryState extends State<EditWarpCategory>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();
  FebricEditController feb = Get.put(FebricEditController());

  void _scrollBy10Pixels() {
    _scrollController.animateTo(
      _scrollController.offset + 10.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        controller: _scrollController,
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
                padding: EdgeInsets.all(5),
                children: feb.wrapModel
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
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "WARP - ${element.key + 1}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      Obx(() => CustomDropdownyarn(
                                            // key: UniqueKey(),
                                            initialValue: element
                                                .value.selectedYarnID.value,
                                            // initialValue: widget
                                            //     .general
                                            //     ?.weftlist?[element.key]
                                            //     .yarnId,
                                            hint: "--Select Yarn--",
                                            yarn: feb.yarnData,
                                            onSelection: (val) {
                                              feb.editedt = true;
                                              element.value.selectedYarnID
                                                  .value = val!;
                                              element.value.focusNode.requestFocus();
                                            },
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonDecimalTextField(
                                        focusnode: element.value.focusNode,
                                          onchange: (p0) {
                                            feb.editedt = true;
                                          },
                                          validatorfield: (p0) {
                                            if (p0!.isEmpty) {
                                              return "Enter Ends (Taar)";
                                            } else if (double.parse(p0) < 1.0) {
                                              return "Ends (Taar) should be greater than 0";
                                            }
                                            return null;
                                          },
                                          controller: element.value.controller,
                                          labelText: 'Enter Ends (Taar)',
                                          keyboardType: TextInputType.number,
                                          hintText: 'Enter Ends (Taar)',
                                          InputAction: TextInputAction.next),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonDecimalTextField(
                                          onchange: (p0) {
                                            feb.editedt = true;
                                          },
                                          // validatorfield: (p0) {
                                          //   if (p0!.isEmpty) {
                                          //     return "Enter Ends (Taar)";
                                          //   } else if (double.parse(p0) < 1.0) {
                                          //     return "Ends (Taar) should be greater than 0";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: element.value.controller2,
                                          labelText: 'Enter TPM Cost per kg (optional)',
                                          keyboardType: TextInputType.number,
                                          hintText: 'Enter TPM Cost per kg (optional)',
                                          InputAction: TextInputAction.next),
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
                child: Column(
                  children: [
//                     Container(
// padding: EdgeInsets.symmetric(horizontal: 10),
//                       width: double.infinity,
//                       child: ElevatedButton(
//                           onPressed: () {
//                               FocusScope.of(context).requestFocus(FocusNode());
//                           },
//                           style: ButtonStyle(
//                               shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8))),
//                               elevation: MaterialStateProperty.all(0),
//                               backgroundColor:
//                                   MaterialStateProperty.all(MyTheme.appBarColor)),
//                           child: Text('Keyboard Down')),
//                     ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 50),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Get.find<FebricEditController>().isWeftDone = true;
                              // feb.changedData();
                              widget.page.jumpToPage(2);
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent)),
                          child: Text('NEXT')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
