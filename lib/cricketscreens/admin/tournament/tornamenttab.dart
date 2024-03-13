import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/helper.dart';
import '../../../const/themes.dart';
import '../../../services/app_url.dart';
import '../../model/tournamentlist.dart';
import '../match/matchschedualscreen.dart';
import '../teams/teamscreen.dart';

class TournamentTabs extends StatefulWidget {
  final Tournamentdetails teamid;
  const TournamentTabs({super.key, required this.teamid});
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
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.teamid.tournamentName ?? "",
          textScaleFactor: 1,
          style: TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
        ),
        // centerTitle: true,
        backgroundColor: MyTheme.appBarColor,
        elevation: 5,
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.20),
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.025),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            color: Cricket_SkyBlue_Color,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(7.5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TabBar(
                controller: _tabController,
                dividerColor: kthemecolor,
                indicatorColor: kthemecolor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: kthemecolor),
                labelColor: kwhite,
                unselectedLabelColor: kthemecolor,
                labelStyle:
                    TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(text: 'Teams'),
                  Tab(text: "Matches"),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                TeamScreen(tournamentid: widget.teamid),
                matchlScreen(tournamentid: widget.teamid)
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
