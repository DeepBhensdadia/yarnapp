import 'package:flutter/material.dart';
import 'package:yarn_modified/constcolor.dart';
import '../match/matchschedualscreen.dart';
import '../teams/teamscreen.dart';

class TournamentTabs extends StatefulWidget {
  @override
  _TournamentTabsState createState() => _TournamentTabsState();
}

class _TournamentTabsState extends State<TournamentTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text('Tournament Name'),
        actions: [IconButton(onPressed: () {
          
        }, icon: Icon(Icons.edit))],
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
                Tab(text: 'Team'),
                Tab(text: "Match"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [ TeamScreen(),matchlScreen()],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
