import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constcolor.dart';
import '../admin/matchesscreen.dart';

class TournamentScreenPlayer extends StatefulWidget {
  const TournamentScreenPlayer({super.key});

  @override
  State<TournamentScreenPlayer> createState() => _TournamentScreenPlayerState();
}

class _TournamentScreenPlayerState extends State<TournamentScreenPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar:
          AppBar(backgroundColor: kthemecolor, title: Text("Tournaments"), actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(Icons.add),
        )
      ]),
      body: Column(children: [
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              onTap: () {
                // Get.to(matchlScreen());
              },
              // visualDensity: VisualDensity.compact,
              // dense: true,
              leading: CircleAvatar(radius: 30),
              title: Text("Indian Premier League"),
              subtitle: Text("Indian Premier League"),
            ),
          ),
        )
      ]),
    );
  }
}
