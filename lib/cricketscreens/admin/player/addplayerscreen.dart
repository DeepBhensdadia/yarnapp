import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../getx/usercontroller.dart';
import '../../player/playerprofilescreen.dart';


class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({super.key});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,

        appBar: AppBar(
            backgroundColor: kthemecolor,
            title: Text("Add Player"),
            actions: [
           IconButton(onPressed: () {
             
           }, icon: Icon(Icons.add_card))
            ]),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: decration,
          child: SingleChildScrollView(
            child: Column(children: [
              // SizedBox(height: 50,),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                      MediaQuery.of(context).textScaleFactor * 15,
                    ),
                    // controller: yarnlist.searchController,
                    onChanged: (text) {
                      // yarnlist.fetchDataFromAPI(
                      //   key: text,
                      //   category: yarnhbj.toString(),
                      // );
                    },
                    decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                          size: 30,
                        ),
                        suffixIcon:
                             IconButton(
                          splashRadius: 0.1,
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                        hintText: "Search Players...",
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
            ]),
          ),
        ),
      ),
    );
  }
}
