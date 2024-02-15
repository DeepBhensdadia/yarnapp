import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/player/addplayerdetails.dart';
import 'admin/adminrootscreen.dart';
import 'admin/tournament/tornamenttab.dart';
import 'admin/tournament/tournamentpage.dart';
import 'player/playerrootscreen.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Get.to(TournamentTabs());
              },
              title: Text("As a Organizer"),
            ),  ListTile(
              onTap: () {
                Get.to(TournamentPage());
              },
              title: Text("Create tournament"),
            ),
            ListTile(
              onTap: () {
                Get.to(AddPlayerDetails());
              },
              title: Text("As a Player"),
            ),
          ],
        ),
      ),
    );
  }
}
