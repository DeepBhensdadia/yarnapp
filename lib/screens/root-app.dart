import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/screens/profile-section/profile-screen.dart';
import '../getxcontrollers/getdetailscheckcontroller.dart';
import 'home-screen.dart';
import 'main-fabric root/fabric-screen-root.dart';
import 'main-yarn-root/yarn-screen-root.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  bool isLoading = false;
  CupertinoTabController tabController = CupertinoTabController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      activeTab = index;
    });
  }

  List<Widget> data = [
    const HomeScreen(),
    const YarnScreenRoot(),
    const FabricScreenRoot(),
    const ProfileScreen()
  ];

  Future<bool> _onBackPress(BuildContext context) async {
    if (activeTab != 0) {
      setState(() {
        activeTab = 0;
      });
    } else if (activeTab == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                "Exit",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              content: Text(
                "Are you sure you want to exit from the application?",
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5)),
              ),
              actions: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white70),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white70),
                    ),
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
              ],
            );
          });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onBackPress(context);
      },
      child: Stack(
        children: [
          Scaffold(
            extendBody: true,
            backgroundColor: Color(0xffeeeeee),
            resizeToAvoidBottomInset: false,
            body: activeTab == 0
                ? const HomeScreen()
                : activeTab == 1
                    ? const YarnScreenRoot()
                    : activeTab == 2
                        ? const FabricScreenRoot()
                        : activeTab == 3
                            ? const ProfileScreen()
                            : Container(),
            bottomNavigationBar: SizedBox(
              height: 60,
              child: BottomNavigationBar(
                iconSize: 25,
                selectedItemColor: Colors.black,
                selectedIconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey,
                currentIndex: activeTab,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      label: "Home",
                      tooltip: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.list_bullet),
                      label: "Yarn",
                      tooltip: "Yarn"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.square_grid_2x2),
                      label: "Fabric",
                      tooltip: "Fabric"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.profile_circled),
                      label: "Profile",
                      tooltip: "Profile"),
                ],
              ),
            ),
          ),
          isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 3,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

//=============================Rough================================

// Widget getBody() {
//   return
//     CupertinoTabScaffold(
//       controller: tabController,
//       backgroundColor: Colors.black,
//       tabBar: CupertinoTabBar(
//         currentIndex: activeTab,
//         height: 60,
//         backgroundColor: Colors.white,
//         activeColor: Colors.black,
//         inactiveColor: Colors.grey,
//         iconSize: 23,
//         onTap: (index) {
//           activeTab = index;
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               CupertinoIcons.home
//             ),
//             label: "Home",
//             tooltip: "Home"
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(
//                   CupertinoIcons.home
//               ),
//               label: "Home",
//               tooltip: "Home"
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(
//           builder: (context) {
//             return data[index];
//           },
//         );
//       },
//     );
// }
//
// Widget getFooter() {
//   return Container(
//     constraints: BoxConstraints(
//         maxHeight: 60
//     ),
//     decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 0,
//             spreadRadius: 0.0,
//             offset: Offset(0, 0),
//           )
//         ],
//         color: Colors.white,
//         // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
//     ),
//     child: Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(bottomBarItems.length, (index) {
//           return Tooltip(
//             message: bottomBarItems[index]['text'],
//             textStyle: TextStyle(color: Colors.white),
//             decoration: BoxDecoration(
//                 color: Colors.black, borderRadius: BorderRadius.circular(10)),
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   activeTab = index;
//                 });
//               },
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Icon(
//                     bottomBarItems[index]['icon'],
//                     color: activeTab == index
//                         ? Colors.black
//                         : Colors.black.withOpacity(0.5),
//                     size: activeTab == index
//                         ? 22.5
//                         : 20,
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     bottomBarItems[index]['text'],
//                     style: TextStyle(
//                         fontSize: activeTab == index
//                             ? 11.5
//                             : 10,
//                         color: activeTab == index
//                             ? Colors.black
//                             : Colors.black.withOpacity(0.5),
//                     fontWeight: activeTab == index
//                         ? FontWeight.w800
//                         : FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     ),
//   );
// }
