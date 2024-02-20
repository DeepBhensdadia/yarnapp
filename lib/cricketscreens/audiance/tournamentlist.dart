import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/audiance/tournamentrootscreen.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import 'matchscreenaudiance.dart';

class TournamentAudiance extends StatefulWidget {
  const TournamentAudiance({super.key});

  @override
  State<TournamentAudiance> createState() => _TournamentAudianceState();
}

class _TournamentAudianceState extends State<TournamentAudiance>
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
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          backgroundColor: kthemecolor,
          title: Text("Tournaments"),
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
                  Tab(text: 'All'),
                  Tab(text: "Following"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: decration,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ListTile(
                            onTap: () {
                              Get.to(TournamentRootAudiance());
                            },
                            // visualDensity: VisualDensity.compact,
                            // dense: true,
                            leading: CircleAvatar(radius: 30),
                            title: Text("Indian Premier League"),
                            subtitle: Text("Indian Premier League"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: decration,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ListTile(
                            onTap: () {
                              Get.to(TournamentRootAudiance());
                            },
                            // visualDensity: VisualDensity.compact,
                            // dense: true,
                            leading: CircleAvatar(radius: 30),
                            title: Text("Indian Premier League"),
                            subtitle: Text("Indian Premier League"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
