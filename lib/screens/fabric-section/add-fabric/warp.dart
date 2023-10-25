import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/getxcontrollers/febricaddcontroller.dart';
import 'package:yarn_modified/widgets/customdropdown.dart';
import '../../../const/const.dart';
import '../../../widgets/common_fields.dart';

class AddWarpCategory extends StatefulWidget {
  final PageController page;

  const AddWarpCategory({super.key, required this.page});

  @override
  State<AddWarpCategory> createState() => _AddWarpCategoryState();
}

class _AddWarpCategoryState extends State<AddWarpCategory> {
  ScrollController _controller2 = ScrollController();
  FebricAddController feb = Get.put(FebricAddController());

  @override
  void initState() {
    super.initState();
    if (feb.wrapmodel == false) {
      feb.wrapModel.clear();
      feb.fillModel();
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                                      CustomDropdownyarn(
                                        hint: "--Select Yarn--",
                                        yarn: feb.yarnData,
                                        onSelection: (val) {
                                          setState(() {
                                            element.value.selectedYarnID = val!;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonDecimalTextField(
                                          validatorfield: (p0) {
                                            if (p0!.isEmpty) {
                                              return "enter ends(taar)";
                                            }
                                            return null;
                                          },
                                          controller: element.value.controller,
                                          labelText: 'Enter Ends (Taar)',
                                          keyboardType: TextInputType.number,
                                          hintText: 'Enter Ends (Taar)',
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
                child: Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 25, bottom: 50),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          feb.changedData();
                          widget.page.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
