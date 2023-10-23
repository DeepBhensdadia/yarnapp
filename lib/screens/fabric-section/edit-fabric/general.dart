import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarn_modified/const/const.dart';
import '../../../const/themes.dart';
import '../../../widgets/common_fields.dart';

class EditGeneralCategory extends StatefulWidget {
  final PageController page;
  const EditGeneralCategory({super.key,
    required this.fabricAllItemsData, required this.page,
    // required velvetData,
    // required georgetteData,
    // required cottonData,
    // required softCottonData,
    // required chiffonData,
    // required crepeCottonData,
    // required satinSilkData,
    // required silkCottonData,
  });

  final fabricAllItemsData;

  @override
  State<EditGeneralCategory> createState() => _EditGeneralCategoryState();
}

class _EditGeneralCategoryState extends State<EditGeneralCategory> {
  ScrollController _controller1 = ScrollController();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberOfWarpYarnController = TextEditingController();
  TextEditingController numberOfWeftYarnController = TextEditingController();
  TextEditingController widthInInchController = TextEditingController();
  TextEditingController costPerFinalController = TextEditingController();
  TextEditingController warpAmountController = TextEditingController();
  TextEditingController weftAmountController = TextEditingController();
  TextEditingController buttaCuttingController = TextEditingController();
  TextEditingController additionalCostController = TextEditingController();
  TextEditingController fabricCategoryController = TextEditingController();
  TextEditingController dialogController = TextEditingController();

  dialogBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Fabric Category',
                            textScaleFactor: 1.35,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          IconButton(
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              tooltip: "Cancel",
                              icon: Icon(
                                CupertinoIcons.xmark_circle,
                                size: 25,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      Divider(
                        height: 15,
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Container(
                        constraints: BoxConstraints(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                        ),
                        child: TextFormField(
                          autocorrect: false,
                          textAlign: TextAlign.start,
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.next,
                          controller: dialogController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                            MediaQuery.of(context).textScaleFactor * 12,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search Fabric',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize:
                              MediaQuery.of(context).textScaleFactor * 12,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Add New Category',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey),
                              overlayColor: MaterialStateProperty.all(
                                  Colors.white.withOpacity(0.1)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scrollbar(
          controller: _controller1,
          child: SingleChildScrollView(
            controller: _controller1,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 2.5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: defaultCardRadius),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonTextFormField(
                            controller: nameController..text = widget.fabricAllItemsData["title"],
                            labelText: 'Edit Fabric Name',
                            keyboardType: TextInputType.text,
                            hintText: 'Edit Fabric Name',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: numberOfWarpYarnController,
                            labelText: 'Edit Number of Warp Yarn',
                            keyboardType: TextInputType.number,
                            hintText: 'Edit Number of Warp Yarn',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: numberOfWeftYarnController,
                            labelText: 'Edit Number of Weft Yarn',
                            keyboardType: TextInputType.number,
                            hintText: 'Edit Number of Weft Yarn',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: widthInInchController,
                            labelText: 'Select Fabric Width in Inch',
                            keyboardType: TextInputType.number,
                            hintText: 'Select Fabric Width in Inch',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: costPerFinalController,
                            labelText: 'Edit Cost of Final PPI',
                            keyboardType: TextInputType.number,
                            hintText: 'Edit Cost of Final PPI',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: warpAmountController,
                            labelText: 'Edit Warp Wastage in % on Warp Amount',
                            keyboardType: TextInputType.number,
                            hintText: 'Edit Warp Wastage in % on Warp Amount',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: weftAmountController,
                            labelText: 'Edit Weft Wastage in % on Weft Amount',
                            keyboardType: TextInputType.number,
                            hintText: 'Edit Weft Wastage in % on Weft Amount',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: buttaCuttingController..text = widget.fabricAllItemsData["ratePerMeter"],
                            labelText: 'Edit Butta Cutting cost Per Metre',
                            keyboardType: TextInputType.number,
                            hintText: 'Edit Butta Cutting cost Per Metre',
                            InputAction: TextInputAction.next),
                        SizedBox(
                          height: 25,
                        ),
                        CommonDecimalTextField(
                            controller: additionalCostController..text = widget.fabricAllItemsData["ratePerPiece"],
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
                            "Edit Fabric Category",
                            textScaleFactor: 1.3,
                            style: TextStyle(fontWeight: FontWeight.w500, color: MyTheme.appBarColor),
                          ),
                        ),
                        SizedBox(height: 5),
                        Theme(
                          data: ThemeData(
                              canvasColor: Colors.white,
                              primaryColor: Colors.grey,
                              accentColor: Colors.grey,
                              hintColor: Colors.grey,
                              colorScheme: ColorScheme.dark()
                          ),
                          child: DropdownButtonFormField<String>(
                            onChanged: (_) {},
                            decoration:
                            InputDecoration(
                              suffixIcon: Icon(Icons.filter_list_rounded),
                              suffixIconColor: Colors.grey,
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
                              ),
                              floatingLabelAlignment:
                              FloatingLabelAlignment.center,
                              hintText: widget.fabricAllItemsData["subtitle"],
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).textScaleFactor * 13,
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.black,
                              fontSize: MediaQuery.of(context).textScaleFactor * 13.5,
                            ),
                            // value: sub_Category_Data.first!.catId,
                            items: <String>['Velvet-9999 Fabric', 'Georgette Fabric', 'Cotton Fabric' ,
                              'Soft-Cotton Fabric' ,'Chiffon Fabric', 'Crepe Cotton Fabric', 'Satin Silk Fabric',
                              'Silk Cotton Fabric'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(
                                  color: Colors.black,
                                    fontSize: MediaQuery.of(context).textScaleFactor * 13.5,
                                ),),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
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
                        // _tabController1
                        //     .animateTo(_currentTabIndex1 = 1);
                        widget.page.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
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
                      child: Text('NEXT')),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
