import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/cricketscreens/getx/matchcontroller.dart';

import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../player/playerprofilescreen.dart';
import 'addplayerscreen.dart';

class PlayersListScreen extends StatefulWidget {
  const PlayersListScreen({super.key});

  @override
  State<PlayersListScreen> createState() => _PlayersListScreenState();
}

class _PlayersListScreenState extends State<PlayersListScreen> {
  MatchController matchController = Get.put(MatchController());

  final List<int> _items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: kthemecolor,
          title: Text("Team Name"),
          actions: [
            PopupMenuButton(
              // offset: Offset(0, 50), // Adjust the offset as needed
              icon: Icon(
                Icons.more_vert_outlined,
              ),
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
            )
          ],
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: decration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ReorderableListView(
                        shrinkWrap: true,
                        onReorder: (int oldIndex, int newIndex) {
                          // setState(() {
                          //   // if (oldIndex < newIndex) {
                          //   //   newIndex -= 1;
                          //   // }
                          //   // final int item = _items.removeAt(oldIndex);
                          //   // _items.insert(newIndex, item);
                          // });
                        },
                        physics: NeverScrollableScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        children: [
                          for (int index = 0; index < _items.length; index += 1)
                            ListTile(
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              minVerticalPadding: 0,
                              key: ValueKey(index),
                              title: Card(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color:
                                                        CupertinoColors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Player ${index + 1}",
                                                  style: TextStyle(
                                                    color:
                                                        CupertinoColors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  index == 0
                                                      ? "Captain"
                                                      : index == 1
                                                          ? "Vice Captain"
                                                          : index == 3
                                                              ? "Bowler"
                                                              : index == 5
                                                                  ? "Bowler"
                                                                  : "Batsman",
                                                  style: TextStyle(
                                                    color: (index == 0 ||
                                                            index == 1)
                                                        ? kthemecolor
                                                        : Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${index == 1 ? "Not Confirm" : "Confirm"}",
                                              style: TextStyle(
                                                color: index == 1
                                                    ? Colors.red
                                                    : Colors.green,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _showBottomSheet(context);
                                              },
                                              icon: Icon(
                                                Icons.more_vert_outlined,
                                                color: CupertinoColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(AddPlayerScreen());
                },
                child: Container(
                  height: 50,
                  color: kthemecolor,
                  child: Center(
                    child: Text(
                      "Add Player",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Deep Bhensdadia',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Column(
                children: List.generate(
                  role.length,
                  (index) => ListTile(
                    visualDensity: VisualDensity.compact,
                    // dense: true,
                    leading: Icon(Icons.music_note),
                    title: Text(role[index]),
                    onTap: () {
                      // Handle the selection
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List role = [
    "Captain",
    "Wicket Keeper",
    "Bowler",
    "Batsman",
    "All rounder",
    "Remove"
  ];
}
