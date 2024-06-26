import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/cricketscreens/audiance/matchdetails/scoreboardscreen.dart';
import 'package:yarn_modified/cricketscreens/audiance/matchdetails/summaryscreen.dart';
import 'package:yarn_modified/cricketscreens/model/matchlivedetailssuperoverresponse.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';
import 'package:yarn_modified/helper.dart';
import '../../../constcolor.dart';
import '../../getx/screenshotcontroller.dart';
import '../../getx/startmatchcontroller.dart';
import 'infoscreen.dart';
import 'oversscreen.dart';

class DetailsScreen extends StatefulWidget {
  final int isadmin;
  final Matchinfo? match;
  final bool? fromsuperover;

  final int? superover;
  const DetailsScreen({super.key, this.isadmin = 0, this.match, this.fromsuperover,  this.superover});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  StartMatchController startmatch = Get.put(StartMatchController());
  Timer? _timer;

  void startTimer() {
    const duration = Duration(seconds: 5);
    _timer = Timer.periodic(duration, (Timer timer) {
      switch (tabindex) {
        case 0:
          startmatch.matchInfoDetailFromAPI(
              tournamentid: widget.match?.tournament?.id.toString() ?? "",
              matchid: widget.match?.id.toString() ?? "");
          break;
        case 1:
          startmatch.indextab.value == 0
              ? startmatch.scorecardFromAPI(
                  teamid: widget.match?.team1?.id.toString() ?? "",
                  matchid: widget.match?.id.toString() ?? "",
                  touramentid: widget.match?.tournament?.id.toString() ?? "")
              : startmatch.scorecard2FromAPI(
                  teamid: widget.match?.team2?.id.toString() ?? "",
                  matchid: widget.match?.id.toString() ?? "",
                  touramentid: widget.match?.tournament?.id.toString() ?? "");
          break;
        case 2:
          startmatch.Overswiserun(
              matchid: startmatch.matchlive.value.id.toString(),
              touramentid:
                  startmatch.matchlive.value.tournament?.id.toString() ?? "");
          break;
      }
    });
  }

  screenshotcontrol screenshot = Get.put(screenshotcontrol());
  @override
  void initState() {
    super.initState();
    startmatch.superoversis.value = "";
    startmatch.matchInfoDetailFromAPI(
        tournamentid: widget.match?.tournamentId.toString() ?? "",
        matchid: widget.match?.id.toString() ?? "");
    _tabController = TabController(length: 3, vsync: this);
    Wakelock.enable();
    if (widget.isadmin != 1) if (widget.match?.matchStatus?.id == 1)
      startTimer();
  }

  int tabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          '${widget.match?.team1?.shortName} vs ${widget.match?.team2?.shortName} ${widget.superover != null ?  "SO ${widget.superover}" : ""}',
          textScaleFactor: 1,
          style: TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
        ),
        actions: [
          // Obx(() =>
          // startmatch.isloading.isTrue
          //     ? Center(
          //         child: CircularProgressIndicator(
          //         color: Colors.white,
          //       ))
          //     :
          // )
          IconButton(
              onPressed: () {
                switch (tabindex) {
                  case 0:
                    screenshot.takeScreenshotandShare(0);
                    break;
                  case 1:
                    screenshot.takeScreenshotandShare(1);
                    break;
                  case 2:
                    break;
                }
              },
              icon: Icon(Icons.share)),
          IconButton(
              onPressed: () {
                switch (tabindex) {
                  case 0:
                    startmatch.matchInfoDetailFromAPI(
                        tournamentid:
                            widget.match?.tournament?.id.toString() ?? "",
                        matchid: widget.match?.id.toString() ?? "");
                    break;
                  case 1:
                    startmatch.indextab.value == 0
                        ? startmatch.scorecardFromAPI(
                            teamid: widget.match?.team1?.id.toString() ?? "",
                            matchid: widget.match?.id.toString() ??"",
                            touramentid:
                                widget.match?.tournament?.id.toString() ?? "")
                        : startmatch.scorecard2FromAPI(
                            teamid: widget.match?.team2?.id.toString() ?? "",
                            matchid: widget.match?.id.toString() ?? "",
                            touramentid:
                                widget.match?.tournament?.id.toString() ?? "");
                    break;
                  case 2:
                    startmatch.Overswiserun(
                        matchid: startmatch.matchlive.value.id.toString(),
                        touramentid: startmatch.matchlive.value.tournament?.id
                                .toString() ??
                            "");
                    break;
                }
              },
              icon: Icon(Icons.refresh)),
        ],
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
                onTap: (value) {
                  setState(() {
                    tabindex = value;
                  });
                  print(tabindex);
                },
                labelStyle:
                    TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(text: 'Info'),
                  Tab(text: "Scorecard"),
                  Tab(text: "Overs"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              color: MyTheme.scaffoldColor,
              height: double.maxFinite,
              width: double.maxFinite,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  InfoScreen(isadmin: widget.isadmin, match: widget.match),
                  ScoreBoardScreen(match: widget.match),
                  OversScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController.dispose();
    Wakelock.disable();
    super.dispose();
  }
}

Widget buildTeamWidget(String team, bool isLeading, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          // PCCricketPlayerInfoScreen().launch(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Icon(
                  CupertinoIcons.person,
                  color: Cricket_Primary,
                  size: 20,
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Batter/Bowler\nAllrounder",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

showBottomSheetDialogForBall(context, ballIndex) async {
  showModalBottomSheet(
    backgroundColor: Cricket_white,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: screenwidth(context, dividedby: 1),
            decoration: BoxDecoration(
              color: Cricket_Primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Over ${ballIndex}",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    // finish(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            reverse: true,
            scrollDirection: Axis.vertical,
            itemCount: 6,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 10, top: 10),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {},
                leading: Column(
                  children: [
                    Text("${ballIndex}.${index + 1}"),
                    SizedBox(
                      height: 5,
                    ),
                    if (index == 2 || index == 4)
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade800,
                        ),
                        child: Center(
                            child: Text(
                          "w",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Ravindra Jadeja, Suresh Raina, Padmakar Surve to Virat Mehsaniya, Sikandar to Deep Paatil not Patel 2(0), 3(2)",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 0.75,
              );
            },
          ),
        ],
      );
    },
  );
}
