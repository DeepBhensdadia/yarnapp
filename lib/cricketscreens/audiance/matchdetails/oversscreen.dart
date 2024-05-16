import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/helper.dart';

import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../getx/startmatchcontroller.dart';
import '../../model/ballbyballresponse.dart';

class OversScreen extends StatefulWidget {
  const OversScreen({super.key});

  @override
  State<OversScreen> createState() => _OversScreenState();
}

class _OversScreenState extends State<OversScreen>
    with SingleTickerProviderStateMixin {
  StartMatchController startmatch = Get.put(StartMatchController());
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    startmatch.Overswiserun(
        matchid: startmatch.matchlive.value.id.toString(),
        touramentid:
            startmatch.matchlive.value.tournament?.id.toString() ?? "");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => startmatch.overbool.isFalse
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            color: Colors.white,
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  labelPadding: EdgeInsets.symmetric(vertical: 5),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyTheme.appBarColor),
                  labelColor: kwhite,
                  unselectedLabelColor: MyTheme.appBarColor,
                  onTap: (value) {},
                  tabs: [
                    Text(
                      startmatch.team1data.value.team?.shortName ?? "",
                    ),
                    Text(
                      startmatch.team2data.value.team?.shortName ?? "",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: startmatch.team1overs.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 20),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: screenwidth(context, dividedby: 1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                            "${startmatch.team1overs[index].overName}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${startmatch.team1overs[index].totalRun.toString()} Runs",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          startmatch.team1overs[index].overRuns
                                                  .toString() +
                                              "-" +
                                              startmatch
                                                  .team1overs[index].overWickets
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${startmatch.team1overs[index].bowler?.playerName ??""} ${startmatch.team1overs[index].isPowerPlay == 1 ? "( P )" : ""}",
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Wrap(
                                            runSpacing: 5,
                                            spacing: 5,
                                            direction: Axis.horizontal,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(
                                                startmatch.team1overs[index]
                                                        .balls?.length ??
                                                    0, (indexball) {
                                              Ballovers? ball = startmatch
                                                  .team1overs[index]
                                                  .balls?[indexball];
                                              return Container(
                                                width: screenwidth(context,
                                                    dividedby: 13),
                                                height: screenwidth(context,
                                                    dividedby: 13),
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ball?.outType == null
                                                      ? ball?.ballType ==
                                                              "normal"
                                                          ? ball?.run == 6
                                                              ? Colors.green
                                                              : ball?.run == 4
                                                                  ? Colors.blue
                                                                  : Colors
                                                                      .black45
                                                          : Colors.orange
                                                      : Colors.red,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    ball?.balltag ?? "",
                                                    style: TextStyle(
                                                        fontSize: ball?.balltag
                                                                    ?.length ==
                                                                1
                                                            ? screenwidth(
                                                                context,
                                                                dividedby: 30)
                                                            : screenwidth(
                                                                context,
                                                                dividedby: 35),
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.grey.withOpacity(0.5),
                            thickness: 0.75,
                            height: 30,
                          );
                        },
                      ),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: startmatch.team2overs.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 20),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: screenwidth(context, dividedby: 1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                            "${startmatch.team2overs[index].overName}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${startmatch.team2overs[index].totalRun.toString()} Runs",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          startmatch.team2overs[index].overRuns
                                                  .toString() +
                                              "-" +
                                              startmatch
                                                  .team2overs[index].overWickets
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${startmatch.team2overs[index].bowler?.playerName ?? ""}  ${startmatch.team2overs[index].isPowerPlay == 1 ? "( P )" : ""}",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Wrap(
                                            runSpacing: 5,
                                            spacing: 5,
                                            direction: Axis.horizontal,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(
                                                startmatch.team2overs[index]
                                                        .balls?.length ??
                                                    0, (indexball) {
                                              Ballovers? ball = startmatch
                                                  .team2overs[index]
                                                  .balls?[indexball];
                                              return Container(
                                                width: screenwidth(context,
                                                    dividedby: 13),
                                                height: screenwidth(context,
                                                    dividedby: 13),
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ball?.outType == null
                                                      ? ball?.ballType ==
                                                              "normal"
                                                          ? ball?.run == 6
                                                              ? Colors.green
                                                              : ball?.run == 4
                                                                  ? Colors.blue
                                                                  : Colors
                                                                      .black45
                                                          : Colors.orange
                                                      : Colors.red,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    ball?.balltag ?? "",
                                                    style: TextStyle(
                                                        fontSize: ball?.balltag
                                                                    ?.length ==
                                                                1
                                                            ? screenwidth(
                                                                context,
                                                                dividedby: 30)
                                                            : screenwidth(
                                                                context,
                                                                dividedby: 35),
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.grey.withOpacity(0.5),
                            thickness: 0.75,
                            height: 30,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
