import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/cricketscreens/audiance/matchdetails/scoreboardscreen.dart';
import 'package:yarn_modified/cricketscreens/audiance/matchdetails/summaryscreen.dart';
import 'package:yarn_modified/helper.dart';
import '../../../constcolor.dart';
import 'infoscreen.dart';
import 'oversscreen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
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
     backgroundColor:  MyTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text('Ind Vs Aus'),
      ),
      body: Column(
        children: [
          Container(
            color: kwhite,
            height: 45,
            child: TabBar(
              // isScrollable: true,
              controller: _tabController,


              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Info'),
                Tab(text: "Scorecard"),
                Tab(text: "Overs"),
              ],
            ),
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
                  InfoScreen(),
                  ScoreBoardScreen(),
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
    _tabController.dispose();
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
