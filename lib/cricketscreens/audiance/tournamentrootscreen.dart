import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/helper.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import '../getx/audiance/tournamentshow.dart';
import '../model/tournamentlist.dart';
import 'aboutscreen.dart';
import 'matchscreenaudiance.dart';
import 'pointstablescreen.dart';
import 'teamlistaudiance.dart';

class TournamentRootAudiance extends StatefulWidget {
  final Tournamentdetails tournamentname;
  const TournamentRootAudiance({super.key, required this.tournamentname});

  @override
  State<TournamentRootAudiance> createState() => _TournamentRootAudianceState();
}

class _TournamentRootAudianceState extends State<TournamentRootAudiance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Get.put(TournamentAudianceController())
        .getpointsFromAPI(tournamentid: widget.tournamentname.id.toString());
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          '${widget.tournamentname.tournamentName}',
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
          Container(
            width: screenwidth(context, dividedby: 1),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            color: Cricket_SkyBlue_Color,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(7.5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TabBar(
                // isScrollable: true,
                controller: _tabController,
                dividerColor: kthemecolor,
                indicatorColor: kthemecolor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: kthemecolor),
                labelColor: kwhite,
                unselectedLabelColor: kthemecolor,
                labelStyle: TextStyle(
                    fontSize: screenwidth(context, dividedby: 31),
                    fontWeight: FontWeight.w500),
                tabs: [
                  Tab(text: 'Matches'),
                  Tab(text: "Teams"),
                  Tab(text: "Points"),
                  Tab(text: "About"),
                ],
              ),
            ),
          ),
          // Container(
          //   height: 45,
          //   child: TabBar(
          //     isScrollable: true,
          //     controller: _tabController,
          //     dividerColor: kthemecolor,
          //     labelColor: Colors.black,
          //     tabs: [
          //       Tab(text: "About"),
          //       Tab(text: 'Matches'),
          //       Tab(text: "Teams"),
          //       Tab(text: "Point Table"),
          //     ],
          //   ),
          // ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                MatchScreenAudiance(),
                TeamListAudiance(),
                PointTableScreen(),
                AboutScreen(),
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
