import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarn_modified/cricketscreens/player/playerprofilescreen.dart';
import 'package:yarn_modified/cricketscreens/player/tournamentscreen.dart';
import 'package:yarn_modified/helper.dart';
import '../../screens/profile-section/profile-screen.dart';
import 'mymatches.dart';

class PlayerRootApp extends StatefulWidget {
  const PlayerRootApp({super.key});

  @override
  State<PlayerRootApp> createState() => _PlayerRootAppState();
}

class _PlayerRootAppState extends State<PlayerRootApp> {
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
    MyMatches(),
    TournamentScreenPlayer(),
    PlayerProfileScreen(),
    // const HomeScreen(),
    // const YarnScreenRoot(),
    // const FabricScreenRoot(),
    // const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          backgroundColor: Color(0xffeeeeee),
          resizeToAvoidBottomInset: false,
          body: data[activeTab],
          bottomNavigationBar: SizedBox(
            height: screenheight(context, dividedby: 15),
            child: BottomNavigationBar(
              iconSize: screenheight(context, dividedby: 35),
              selectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenheight(context, dividedby: 80)),
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
                    label: "Tournaments",
                    tooltip: "Tournaments"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled),
                    label: "Profile",
                    tooltip: "Profile"),
                // BottomNavigationBarItem(
                //     icon: Icon(CupertinoIcons.profile_circled),
                //     label: "Profile",
                //     tooltip: "Profile"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
