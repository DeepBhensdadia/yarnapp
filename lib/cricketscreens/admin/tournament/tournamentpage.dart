import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constcolor.dart';
import '../../getx/tournamentcontroller.dart';
import '../../model/tournamentlist.dart';

import 'tornamenttab.dart';
import 'addtournament.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key});

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  TournamentController tournamentController = Get.put(TournamentController());
  @override
  void initState() {
    tournamentController.getTournamentDataFromAPI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text("Tournaments"),
      ),
      body:  GetBuilder<TournamentController>(
        builder: (controller) => controller.tournamentbool == false
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.getData.length,
                  itemBuilder: (context, index) {
                    Tournamentdetails data = controller.getData[index];
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListTile(
                          onTap: () {
                            Get.to(TournamentTabs());
                          },
                          // visualDensity: VisualDensity.compact,
                          // dense: true,
                          leading: CircleAvatar(radius: 30),
                          title: Text(data.tournamentName ?? ''),
                          subtitle:
                          Text(data.tournamenttype?.name ?? ''),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(addtournament());
              },
              child: Container(
                height: 50,
                color: kthemecolor,
                child: Center(
                  child: Text(
                    "Add Tournament",
                    style: TextStyle(
                        color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
