import 'package:flutter/material.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/screens/fabric-section/fabric-category-screen.dart';
import 'package:yarn_modified/screens/yarn-section/yarn-category-screen.dart';
import 'package:yarn_modified/widgets/common_fields.dart';
import 'main-fabric root/fabric-screen-root.dart';
import 'main-yarn-root/yarn-screen-root.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.scaffoldColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.transparent,
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    color: MyTheme.appBarColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xff1EAFDF),
                          Color(0xff1EAFDF),
                          Color(0xff107698),
                          Color(0xff107698),
                          Color(0xff107698),
                          Color(0xff107698),
                        ]
                    )
                ),
            ),
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: 125,
                                  width: 150,
                                  child: Image.asset("images/RR_Textiles-r.png"))),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Center(child: Text("WELCOME, RAHUL",textAlign: TextAlign.center,textScaleFactor: 1.9,style: TextStyle(color: MyTheme.scaffoldColor,fontWeight: FontWeight.bold),))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: homeCardRadius),
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text("YARN",textScaleFactor: 1.5,style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 10,),
                            ListTile(
                              dense: true,
                              title: Text("YARN CATEGORY",textScaleFactor: 1.3,style: TextStyle(color: MyTheme.appBarColor),),
                              trailing: Icon(Icons.keyboard_arrow_right_rounded,color: MyTheme.appBarColor,),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => YarnCategoryScreen()));
                              },
                            ),
                            ListTile(
                              dense: true,
                              title: Text("YARN RATE",textScaleFactor: 1.3,style: TextStyle(color: MyTheme.appBarColor),),
                              trailing: Icon(Icons.keyboard_arrow_right_rounded,color: MyTheme.appBarColor,),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => YarnScreenRoot()));
                              },
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: homeCardRadius),
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text("FABRIC",textScaleFactor: 1.5,style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 10,),
                            ListTile(
                              dense: true,
                              title: Text("FABRIC CATEGORY",textScaleFactor: 1.3,style: TextStyle(color: MyTheme.appBarColor),),
                              trailing: Icon(Icons.keyboard_arrow_right_rounded,color: MyTheme.appBarColor,),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FabricCategoryScreen()));
                              },
                            ),
                            ListTile(
                              dense: true,
                              title: Text("FABRIC COST",textScaleFactor: 1.3,style: TextStyle(color: MyTheme.appBarColor),),
                              trailing: Icon(Icons.keyboard_arrow_right_rounded,color: MyTheme.appBarColor,),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FabricScreenRoot()));
                              },
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
