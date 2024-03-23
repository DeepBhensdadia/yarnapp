import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';
import '../admin/matchesscreen.dart';
import '../admin/player/playerprofileadmin.dart';
import '../audiance/tournamentrootscreen.dart';

class TournamentScreenPlayer extends StatefulWidget {
  const TournamentScreenPlayer({super.key});

  @override
  State<TournamentScreenPlayer> createState() => _TournamentScreenPlayerState();
}

class _TournamentScreenPlayerState extends State<TournamentScreenPlayer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text("Tournaments"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(PlayerProfileAdmin());
              },
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            child: TabBar(
              controller: _tabController,
              dividerColor: kthemecolor,
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'My'),
                Tab(text: "Following"),
                Tab(text: "All"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                MyTournament(),
                FollowingTournament(),
                AllTournament()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyTournament extends StatefulWidget {
  const MyTournament({super.key});

  @override
  State<MyTournament> createState() => _MyTournamentState();
}

class _MyTournamentState extends State<MyTournament> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: decration,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              onTap: () {
                // Get.to(TournamentRootAudiance());
              },
              // visualDensity: VisualDensity.compact,
              // dense: true,
              leading: CircleAvatar(radius: 30),
              title: Text("Indian Premier League"),
              subtitle: Text("Indian Premier League"),
            ),
          ),
        )
      ]),
    );
  }
}

class FollowingTournament extends StatefulWidget {
  const FollowingTournament({super.key});

  @override
  State<FollowingTournament> createState() => _FollowingTournamentState();
}

class _FollowingTournamentState extends State<FollowingTournament> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: decration,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              onTap: () {
                // Get.to(TournamentRootAudiance());
              },
              // visualDensity: VisualDensity.compact,
              // dense: true,
              leading: CircleAvatar(radius: 30),
              title: Text("Indian Premier League"),
              subtitle: Text("Indian Premier League"),
            ),
          ),
        )
      ]),
    );
  }
}

class AllTournament extends StatefulWidget {
  const AllTournament({super.key});

  @override
  State<AllTournament> createState() => _AllTournamentState();
}

class _AllTournamentState extends State<AllTournament> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: decration,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              onTap: () {
                // Get.to(TournamentRootAudiance());
              },
              // visualDensity: VisualDensity.compact,
              // dense: true,
              leading: CircleAvatar(radius: 30),
              title: Text("Indian Premier League"),
              subtitle: Text("Indian Premier League"),
            ),
          ),
        )
      ]),
    );
  }
}
