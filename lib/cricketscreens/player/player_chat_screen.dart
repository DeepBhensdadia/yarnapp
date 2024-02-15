import 'package:flutter/material.dart';

import '../../constcolor.dart';

class PlayerChattingScreen extends StatefulWidget {
  const PlayerChattingScreen({super.key});

  @override
  State<PlayerChattingScreen> createState() => _PlayerChattingScreenState();
}

class _PlayerChattingScreenState extends State<PlayerChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kthemecolor,
        title: Text("Player Name"),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            // Get.to(PlayerChattingScreen());
          }, icon: Icon(Icons.message,color: Colors.white,)),
        ],
      ),
    );
  }
}
