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
        actions: [PopupMenuButton(

          // offset: Offset(0, 50), // Adjust the offset as needed
          icon: Icon(Icons.more_vert_outlined,),
          onSelected: (value) {
            // Handle the selected menu item
            // You can use the 'value' parameter to determine which item was selected
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: 'item1',
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 'item2',
              child: Text('Delete'),
            ),
            // Add more menu items as needed
          ],
          // iconSize: 20,
          padding: EdgeInsets.zero,
        )],
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
