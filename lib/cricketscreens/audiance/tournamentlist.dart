import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/audiance/tournamentrootscreen.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../helper.dart';
import '../../services/app_url.dart';
import '../getx/audiance/tournamentshow.dart';
import '../model/tournamentlist.dart';
import '../photoscreen.dart';

class TournamentAudiance extends StatefulWidget {
  const TournamentAudiance({super.key});

  @override
  State<TournamentAudiance> createState() => _TournamentAudianceState();
}

class _TournamentAudianceState extends State<TournamentAudiance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());
  @override
  void initState() {
    super.initState();
    tournamentAudiance.getaudiTournamentFromAPI();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Tournaments',
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
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: GetBuilder<TournamentAudianceController>(
          builder: (controller) => controller.gettourna == false
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    controller.gettournament.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text('No Data Found...'),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: controller.gettournament.length,
                                    itemBuilder: (context, index) {
                                      Tournamentdetails data =
                                          controller.gettournament[index];
                                      return Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Card(
                                          elevation: 5,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: ListTile(
                                            // horizontalTitleGap: 5,
                                            contentPadding: EdgeInsets.only(
                                                top: 8, bottom: 8, left: 8),
                                            visualDensity:
                                                VisualDensity.compact,
                                            onTap: () {
                                              tournamentAudiance
                                                  .getaudiTournamentDetails(
                                                      id: data.id.toString(),
                                                      status: "live");

                                              Get.to(TournamentRootAudiance(
                                                  tournamentname: data));
                                            },
                                            // visualDensity: VisualDensity.compact,
                                            // dense: true,

                                            title: Row(
                                              children: [
                                                PhotoScreencric(
                                                  image:
                                                      URLs.image_url_tournament +
                                                          "${data.logo}",
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  width: screenwidth(context,
                                                      dividedby: 1.5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          // maxLines: 2,
                                                          data.tournamentName ??
                                                              '',
                                                          textScaleFactor: 1.15,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          )),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(data.location ?? '',
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          '${data.startdateformat()}  to  ${data.enddateformat()}',
                                                          textScaleFactor: 0.9,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  screenwidth(
                                                                      context,
                                                                      dividedby:
                                                                          25),
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}
