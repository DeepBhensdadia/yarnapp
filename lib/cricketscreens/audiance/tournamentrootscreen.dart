import 'package:flutter/material.dart';

import '../../constcolor.dart';
import 'aboutscreen.dart';
import 'matchscreenaudiance.dart';
import 'pointstablescreen.dart';
import 'teamlistaudiance.dart';

class TournamentRootAudiance extends StatefulWidget {
  const TournamentRootAudiance({super.key});

  @override
  State<TournamentRootAudiance> createState() => _TournamentRootAudianceState();
}

class _TournamentRootAudianceState extends State<TournamentRootAudiance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text('Indian Premier League'),
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              dividerColor: kthemecolor,
              labelColor: Colors.black,
              tabs: [
                Tab(text: "About"),
                Tab(text: 'Matches'),
                Tab(text: "Teams"),
                Tab(text: "Point Table"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                AboutScreen(),
                MatchScreenAudiance(),
                TeamListAudiance(),
                PointTableScreen(),
              ],
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
