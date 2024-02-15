import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({super.key});

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  ScrollController scrollController = ScrollController();
  bool isAppBarExpanded = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 0 && !isAppBarExpanded) {
        setState(() {
          isAppBarExpanded = true;
        });
      } else if (scrollController.offset <= 0 && isAppBarExpanded) {
        setState(() {
          isAppBarExpanded = false;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              pinned: true,
              backgroundColor: Colors.blueGrey,
              floating: true,
              expandedHeight: 185,
              title: isAppBarExpanded
                  ? Text(
                      "Player Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(""),
              // Text("",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ],
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.blueGrey,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 88,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 42,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.75),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Player Name",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Surat",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "RHB, Right-arm fast",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // SingleChildScrollView(child: TabBar(
                        //   labelPadding: const EdgeInsets.only(left: 0, right: 0),
                        //   indicatorWeight: 4.0,
                        //   indicatorSize: TabBarIndicatorSize.label,
                        //   indicatorColor: Colors.white,
                        //   labelColor: Colors.white,
                        //   isScrollable: true,
                        //   unselectedLabelColor: Colors.white,
                        //   tabs: [
                        //     Container(padding: const EdgeInsets.all(16.0), child: Text("MATCHES", style: TextStyle(fontSize: 16, color: Colors.white))),
                        //     Container(padding: const EdgeInsets.all(16.0), child: Text("TEAMS", style: TextStyle(fontSize: 16, color: Colors.white))),
                        //     Container(padding: const EdgeInsets.all(16.0), child: Text("AWARDS", style: TextStyle(fontSize: 16, color: Colors.white))),
                        //     Container(padding: const EdgeInsets.all(16.0), child: Text("PROFILE", style: TextStyle(fontSize: 16, color: Colors.white)))
                        //   ],
                        // )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  // SizedBox(height: 45,),
                  Container(
                    color: Colors.blueGrey,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 0, right: 0),
                      indicatorWeight: 4.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("MATCHES",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))),
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("TEAMS",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))),
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("AWARDS",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))),
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("PROFILE",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)))
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Center(
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.all(15),
                            child: Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.creditcard,
                                    color: Colors.black,
                                    size: 100,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Player has not played any matches yet.",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.blueGrey,
                                child: ListTile(
                                  onTap: () {},
                                  minVerticalPadding: 15,
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.white),
                                        shape: BoxShape.circle),
                                  ),
                                  title: Text(
                                    "Team Name ${index + 1}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Since 14 Feb, 2024",
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        thickness: 0.8,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Played: ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.75)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Won: ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.75)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Lost: ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.75)),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        Center(
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.all(15),
                            child: Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.wine_bar_rounded,
                                    color: Colors.black,
                                    size: 100,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Player has not won any awards yet.",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                            child: Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "LOCATION",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Surat",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "PLAYING ROLE",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "----",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BATTING STYLE",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "RHB (Right Handed Barbaros)",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BOWLING STYLE",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "----",
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
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Addphoto extends StatefulWidget {
  const Addphoto({super.key});

  @override
  State<Addphoto> createState() => _AddphotoState();
}

class _AddphotoState extends State<Addphoto> {
  File? _image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 190, maxHeight: 190),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Material(
                    elevation: 0,
                    shape: CircleBorder(
                        side: BorderSide(width: 1.5, color: Colors.grey)),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: _image == null
                        ? Ink.image(
                            image: AssetImage("images/profile.png"),
                            fit: BoxFit.contain,
                            width: 220,
                            height: 220,
                            child: InkWell(
                              radius: 0,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/profile.png"),
                                              fit: BoxFit.contain),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Ink.image(
                            image: FileImage(File(_image!.path).absolute),
                            fit: BoxFit.fill,
                            width: 220,
                            height: 220,
                            child: InkWell(
                              radius: 0,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: FileImage(
                                                  File(_image!.path).absolute),
                                              fit: BoxFit.fill),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
              ),
            ),
            Positioned(
              bottom: 10,
              right: -40,
              left: 70,
              child: Tooltip(
                message: 'Pick Image',
                child: RawMaterialButton(
                  onPressed: () {
                    getImage();
                  },
                  elevation: 2,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                  padding: EdgeInsets.all(7.5),
                  shape: CircleBorder(side: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
