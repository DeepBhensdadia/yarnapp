import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/themes.dart';
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
      backgroundColor: MyTheme.scaffoldColor,

      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text("Tournaments"),
      ),
      body:  Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: GetBuilder<TournamentController>(
          builder: (controller) => controller.tournamentbool == false
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: controller.getData.length,
                        itemBuilder: (context, index) {
                          Tournamentdetails data = controller.getData[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Card(
                              elevation: 5,
                              margin: EdgeInsets.symmetric(horizontal: 15,),
                              child: ListTile(
                                visualDensity: VisualDensity.compact,
                                onTap: () {
                                  Get.to(TournamentTabs());
                                },
                                // visualDensity: VisualDensity.compact,
                                // dense: true,
                                leading: CircleAvatar(radius: 30),
                                title: Text(data.tournamentName ?? ''),
                                subtitle:
                                Text(data.tournamenttype?.name ?? ''),
                                trailing:  PopupMenuButton(

                                  // offset: Offset(0, 50), // Adjust the offset as needed
                                  icon: Icon(Icons.more_vert_outlined,),
                                  onSelected: (value) {
                                    // Handle the selected menu item
                                    // You can use the 'value' parameter to determine which item was selected
                                  },
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                      value: 'item1',
                                      child: Text('Edit'),
                                    ),
                                    PopupMenuItem(
                                      value: 'item2',
                                      child: Text('Delete'),
                                    ),
                                    // Add more menu items as needed
                                  ],
                                  // iconSize: 20,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
SizedBox(height: 15,)
                    ],
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
      ),
    );
  }
}
