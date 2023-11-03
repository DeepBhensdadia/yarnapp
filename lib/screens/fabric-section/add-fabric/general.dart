import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/getxcontrollers/febriccategory.dart';
import 'package:yarn_modified/helper.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric-category.dart';
import 'package:yarn_modified/getxcontrollers/febricaddcontroller.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../widgets/common_fields.dart';

class AddGeneralCategory extends StatefulWidget {
  final PageController page;
  AddGeneralCategory({
    super.key,
    required this.page,
  });

  @override
  State<AddGeneralCategory> createState() => _AddGeneralCategoryState();
}

class _AddGeneralCategoryState extends State<AddGeneralCategory>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller1 = ScrollController();
  FebricAddController feb = Get.put(FebricAddController());

  String dropDownHint = "--Select Category--";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List count = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  @override
  void initState() {
    feb.currenttab = 0;
    // feb.buttaCuttingController.text = "0";
    // feb.additionalCostController.text = "0";
    feb.fabricCategoryController.text = "0";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          controller: _controller1,
          physics: BouncingScrollPhysics(),
          child: GetBuilder<FebricCategoryController>(
            builder: (v) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 2.5,
                  color: Colors.white,
                  shape:
                      RoundedRectangleBorder(borderRadius: defaultCardRadius),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonTextFormField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter Febric name";
                                }
                                return null;
                              },
                              controller: feb.nameController,
                              labelText: 'Enter Fabric Name',
                              keyboardType: TextInputType.text,
                              hintText: 'Enter Fabric Name',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Select Number of Warp Yarn",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: Theme(
                              data: ThemeData(
                                  canvasColor: Colors.white,
                                  primaryColor: Colors.grey,
                                  accentColor: Colors.grey,
                                  hintColor: Colors.grey,
                                  colorScheme: ColorScheme.dark()),
                              child: AbsorbPointer(
                                absorbing: feb.isWrapDone,
                                child: DropdownButtonFormField<String>(
                                  onChanged: (value) {
                                    feb.editedt = true;

                                    feb.numberOfWarpYarnController.text =
                                        value ?? "";
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.transparent,
                                  ),
                                  decoration: InputDecoration(
                                    enabled: true,
                                    isDense: true,
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            13.5,
                                  ),
                                  // value: sub_Category_Data.first!.catId,
                                  items: count
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e, child: Text(e)))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Select Number of Weft Yarn",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: Theme(
                              data: ThemeData(
                                  canvasColor: Colors.white,
                                  primaryColor: Colors.grey,
                                  accentColor: Colors.grey,
                                  hintColor: Colors.grey,
                                  colorScheme: ColorScheme.dark()),
                              child: AbsorbPointer(
                                absorbing: feb.isWrapDone,
                                child: DropdownButtonFormField<String>(
                                  onChanged: (value) {
                                    feb.editedt = true;
                                    feb.numberOfWeftYarnController.text =
                                        value ?? "";
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.transparent,
                                  ),
                                  decoration: InputDecoration(
                                    // enabled: false,
                                    isDense: true,
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 0.25),
                                    ),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            13.5,
                                  ),
                                  // value: sub_Category_Data.first!.catId,
                                  items: count
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e, child: Text(e)))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter width in inch";
                                }
                                return null;
                              },
                              controller: feb.widthInInchController,
                              labelText: 'Select Fabric Width in Inch',
                              keyboardType: TextInputType.number,
                              hintText: 'Select Fabric Width in Inch',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter cost of final ppi";
                                }
                                return null;
                              },
                              controller: feb.costPerFinalController,
                              labelText: 'Enter Cost of Final PPI',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Cost of Final PPI',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter wrap wesrage % onn warap amount";
                                }
                                return null;
                              },
                              controller: feb.warpAmountController,
                              labelText:
                                  'Enter Warp Wastage in % on Warp Amount',
                              keyboardType: TextInputType.number,
                              hintText:
                                  'Enter Warp Wastage in % on Warp Amount',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter weft wastage in % on weft amount";
                                }
                                return null;
                              },
                              controller: feb.weftAmountController,
                              labelText:
                                  'Enter Weft Wastage in % on Weft Amount',
                              keyboardType: TextInputType.number,
                              hintText:
                                  'Enter Weft Wastage in % on Weft Amount',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter butta cutting cost pr meter";
                                }
                                return null;
                              },
                              // ontaps: () => feb.buttaCuttingController.clear(),
                              controller: feb.buttaCuttingController,
                              labelText: 'Enter Butta Cutting cost Per Metre',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Butta Cutting cost Per Metre',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              onchange: (p0) {
                                p0.isNotEmpty
                                    ? feb.editedt = true
                                    : feb.editedt = false;
                              },
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter any addittional cost per meter";
                                }
                                return null;
                              },
                              // ontaps: () => feb.additionalCostController.clear(),
                              controller: feb.additionalCostController,
                              labelText: 'Enter Any Additional cost Per Metre',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Any Additional cost Per Metre',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Select Fabric Category",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appBarColor),
                            ),
                          ),
                          SizedBox(height: 10),
                          v.febricbool == false
                              ? SizedBox.shrink()
                              : Container(
                                  height: 40,
                                  child: Theme(
                                    data: ThemeData(
                                        canvasColor: Colors.white,
                                        primaryColor: Colors.grey,
                                        accentColor: Colors.grey,
                                        hintColor: Colors.grey,
                                        colorScheme: ColorScheme.dark()),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child:
                                              DropdownButtonFormField<String>(
                                            menuMaxHeight: screenheight(context,
                                                dividedby: 1.5),
                                            onChanged: (value) {
                                              feb.editedt = true;
                                              feb.fabricCategoryController
                                                  .text = value ?? "";
                                            },
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.transparent,
                                            ),
                                            decoration: InputDecoration(
                                              enabled: true,
                                              isDense: true,
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.25),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.25),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.25),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.25),
                                              ),
                                              floatingLabelAlignment:
                                                  FloatingLabelAlignment.center,
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  13.5,
                                            ),
                                            value: feb
                                                .fabricCategoryController.text,
                                            items: v.getData
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        value: e!.id.toString(),
                                                        child: Text(e
                                                            .fabricCategory
                                                            .toString())))
                                                .toList(),
                                          ),
                                        ),
                                        Tooltip(
                                          message: "Add Fabric Category",
                                          textStyle:
                                              TextStyle(color: Colors.black),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: IconButton(
                                            iconSize: 20,
                                            color: Colors.grey,
                                            padding: EdgeInsets.zero,
                                            splashRadius: 20,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddFabricCategory()));
                                            },
                                            icon: Icon(Icons.add_rounded),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.find<FebricAddController>().isWrapDone = true;
                          widget.page.jumpToPage(1);
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent)),
                      child: Text('NEXT')),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
