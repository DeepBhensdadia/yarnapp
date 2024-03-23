import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yarn_modified/cricketscreens/getx/audiance/tournamentshow.dart';
import 'package:yarn_modified/helper.dart';

import '../../const/themes.dart';
import '../../constcolor.dart';
import '../../services/app_url.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TournamentAudianceController tournamentAudiance =
      Get.put(TournamentAudianceController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => tournamentAudiance.gettournadetai.isFalse
        ? Center(
            child: CircularProgressIndicator(),
          )
        : tournamentAudiance.getdetailstourna.isEmpty
            ? Center(
                child: Text('No Data Found...'),
              )
            : Container(
                color: MyTheme.scaffoldColor,
                height: double.maxFinite,
                width: double.maxFinite,
                child: Container(
                  decoration: decration,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    // resizeToAvoidBottomInset: false,
                    body: SingleChildScrollView(
                      child: Container(
                        // height: 500,
                        width: screenwidth(context, dividedby: 1),
                        margin: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // SizedBox(height: 10,),
                            Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                       padding: EdgeInsets.all(8),
                                      width: screenwidth(context,dividedby: 1),
                                      // height: 30,
                                      decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))),
                                      child:  Text(
                                        "Tournament Details",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(5),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "${URLs.image_url_tournament}" +
                                                                    "${tournamentAudiance.getdetailstourna[0].logo}"))),
                                                  )

                                                  // ElevatedButton(
                                                  //   style: ButtonStyle(
                                                  //       backgroundColor:
                                                  //           MaterialStateProperty
                                                  //               .resolveWith((states) =>
                                                  //                   MyTheme.appBarColor)),
                                                  //   onPressed: () {},
                                                  //   child: Container(
                                                  //     height: 50,
                                                  //     child: Center(
                                                  //       child: Row(
                                                  //         children: [
                                                  //           Icon(Icons.add),
                                                  //           Text("Follow")
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                tournamentAudiance.getdetailstourna[0]
                                                        .tournamentName ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade400,
                                            height: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${tournamentAudiance.getdetailstourna[0].startdateformat()}  to  ${tournamentAudiance.getdetailstourna[0].enddateformat()}',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade400,
                                            height: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "City",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                tournamentAudiance
                                                        .getdetailstourna[0].location ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade400,
                                            height: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Cricket Type",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                tournamentAudiance.getdetailstourna[0]
                                                        .cricketType ??
                                                    "----------",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade400,
                                            height: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Ball Type",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                tournamentAudiance.getdetailstourna[0]
                                                        .ballType ??
                                                    "----------",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade400,
                                            height: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Organized by",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                tournamentAudiance.getdetailstourna[0]
                                                        .organizationName ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
