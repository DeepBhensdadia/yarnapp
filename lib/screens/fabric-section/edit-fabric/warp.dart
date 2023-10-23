import 'package:flutter/material.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../widgets/common_fields.dart';

class EditWarpCategory extends StatefulWidget {
  final PageController page;
  const EditWarpCategory({super.key, required this.page});

  @override
  State<EditWarpCategory> createState() => _EditWarpCategoryState();
}

class _EditWarpCategoryState extends State<EditWarpCategory> {
  TextEditingController endsTarController1 = TextEditingController();
  TextEditingController endsTarController2 = TextEditingController();
  ScrollController _controller2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scrollbar(
          controller: _controller2,
          child: SingleChildScrollView(
            controller: _controller2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
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
                          vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                            ),
                            child: Center(child: Text("WARP-1",style: TextStyle(color: Colors.black),),),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    "Select Yarn",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: MyTheme.appBarColor),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 40,
                                  child: Theme(
                                    data: ThemeData(
                                        canvasColor: Colors.white,
                                        primaryColor: Colors.grey,
                                        accentColor: Colors.grey,
                                        hintColor: Colors.grey,
                                        colorScheme: ColorScheme.dark()),
                                    child: DropdownButtonFormField<String>(
                                      onChanged: (_) {},
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
                                        hintText: '--Select Category--',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                          MediaQuery.of(context).textScaleFactor *
                                              12,
                                        ),
                                      ),
                                      style: const TextStyle(color: Colors.black),
                                      // value: sub_Category_Data.first!.catId,
                                      items: <String>[
                                        'Velvet-9999 Fabric',
                                        'Georgette Fabric',
                                        'Cotton Fabric',
                                        'Soft-Cotton Fabric',
                                        'Chiffon Fabric',
                                        'Crepe Cotton Fabric',
                                        'Satin Silk Fabric',
                                        'Silk Cotton Fabric'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                                  12,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                CommonTextFormField(
                                    controller: endsTarController1,
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
                  ),
                  SizedBox(height: 20,),
                  Card(
                    elevation: 2.5,
                    color: Colors.white,
                    shape:
                    RoundedRectangleBorder(borderRadius: defaultCardRadius),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                            ),
                            child: Center(child: Text("WARP-2",style: TextStyle(color: Colors.black),),),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    "Select Yarn",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: MyTheme.appBarColor),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 40,
                                  child: Theme(
                                    data: ThemeData(
                                        canvasColor: Colors.white,
                                        primaryColor: Colors.grey,
                                        accentColor: Colors.grey,
                                        hintColor: Colors.grey,
                                        colorScheme: ColorScheme.dark()),
                                    child: DropdownButtonFormField<String>(
                                      onChanged: (_) {},
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
                                        hintText: '--Select Category--',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                          MediaQuery.of(context).textScaleFactor *
                                              12,
                                        ),
                                      ),
                                      style: const TextStyle(color: Colors.black),
                                      // value: sub_Category_Data.first!.catId,
                                      items: <String>[
                                        'Velvet-9999 Fabric',
                                        'Georgette Fabric',
                                        'Cotton Fabric',
                                        'Soft-Cotton Fabric',
                                        'Chiffon Fabric',
                                        'Crepe Cotton Fabric',
                                        'Satin Silk Fabric',
                                        'Silk Cotton Fabric'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                                  12,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                CommonTextFormField(
                                    controller: endsTarController1,
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
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // _tabController1
                            //     .animateTo(_currentTabIndex1 = 2);
                            widget.page.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.ease);
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
        ),
      ),
    );
  }
}
