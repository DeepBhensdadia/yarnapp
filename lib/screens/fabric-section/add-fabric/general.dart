import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import 'package:yarn_modified/model/get-yarn-category-model.dart';
import 'package:yarn_modified/screens/fabric-section/add-fabric-category.dart';
import 'package:yarn_modified/getxcontrollers/febricaddcontroller.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../services/all_api_services.dart';
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

class _AddGeneralCategoryState extends State<AddGeneralCategory> {
  ScrollController _controller1 = ScrollController();
  FebricAddController feb = Get.put(FebricAddController());

  String dropDownHint = "--Select Category--";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          controller: _controller1,
          physics: BouncingScrollPhysics(),
          child: GetBuilder<FebricAddController>(
            builder: (controller) => Column(
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
                          CommonDecimalTextField(
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter number of wrap yarn";
                                }
                                return null;
                              },
                              controller: feb.numberOfWarpYarnController,
                              labelText: 'Enter Number of Warp Yarn',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Number of Warp Yarn',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter number of weft yarn";
                                }
                                return null;
                              },
                              controller: feb.numberOfWeftYarnController,
                              labelText: 'Enter Number of Weft Yarn',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Number of Weft Yarn',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
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
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter butta cutting cost pr meter";
                                }
                                return null;
                              },
                              controller: feb.buttaCuttingController,
                              labelText: 'Enter Butta Cutting cost Per Metre',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Butta Cutting cost Per Metre',
                              InputAction: TextInputAction.next),
                          SizedBox(
                            height: 25,
                          ),
                          CommonDecimalTextField(
                              validatorfield: (p0) {
                                if (p0!.isEmpty) {
                                  return "enter any addittional cost per meter";
                                }
                                return null;
                              },
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
                          controller.categorybool == false
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
                                    child: DropdownButtonFormField<String>(
                                      hint: Text("--Select Category--",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  13)),
                                      onChanged: (value) {
                                        controller.fabricCategoryController
                                            .text = value ?? "";
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.transparent,
                                      ),
                                      decoration: InputDecoration(
                                        enabled: true,
                                        isDense: true,
                                        suffix: Tooltip(
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
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              width: 0.25),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              width: 0.25),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              width: 0.25),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              width: 0.25),
                                        ),
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hintText: dropDownHint,
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: MediaQuery.of(context)
                                                    .textScaleFactor *
                                                13),
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                            13.5,
                                      ),
                                      // value: sub_Category_Data.first!.catId,
                                      items: controller.yarncategoryData
                                          .map((e) => DropdownMenuItem<String>(
                                              value: e!.id.toString(),
                                              child: Text(
                                                  e.fabricCategory.toString())))
                                          .toList(),
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
                          widget.page.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease);
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
}
