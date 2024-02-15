import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:image_picker/image_picker.dart';
import '../../const/const.dart';
import '../../constcolor.dart';
import '../../helper.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({super.key});

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: kthemecolor,
              title: Text("Player Name"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
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
                                    side: BorderSide(
                                        width: 1.5, color: Colors.grey)),
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
                                                  padding:
                                                      const EdgeInsets.only(
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
                                        image: FileImage(
                                            File(_image!.path).absolute),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50, right: 50),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: FileImage(
                                                              File(_image!.path)
                                                                  .absolute),
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
                              shape: CircleBorder(
                                  side: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Suresh Raina',
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Mumbai',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("PERSONAL INFORMATION",
                    style: primaryTextStyle(
                      color: Cricket_textColorPrimary,
                      size: 16,
                    )).paddingOnly(top: 8, bottom: 8, left: 12),
                Container(
                  decoration: PCboxDecoration(
                      radius: 5.0, bgColor: Cricket_white, showShadow: true),
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Born",
                                  style: primaryTextStyle(
                                    color: Colors.grey,
                                    size: 16,
                                  )).paddingOnly(left: 8, top: 4, bottom: 4),
                              Text("April 03, 2007 (16 years)",
                                      style: primaryTextStyle(
                                        color: Cricket_textColorPrimary,
                                        size: 16,
                                      ))
                                  .paddingOnly(
                                      left: 8, right: 8, top: 4, bottom: 4),
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Nickname",
                                  style: primaryTextStyle(
                                    color: Colors.grey,
                                    size: 16,
                                  )).paddingOnly(left: 8, top: 4, bottom: 4),
                              Text("Sureshya",
                                      style: primaryTextStyle(
                                        color: Cricket_textColorPrimary,
                                        size: 16,
                                      ))
                                  .paddingOnly(
                                      left: 8, right: 8, top: 4, bottom: 4),
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Role",
                                  style: primaryTextStyle(
                                    color: Colors.grey,
                                    size: 16,
                                  )).paddingOnly(left: 8, top: 4, bottom: 4),
                              Text("Bowling Allrounder",
                                      style: primaryTextStyle(
                                        color: Cricket_textColorPrimary,
                                        size: 16,
                                      ))
                                  .paddingOnly(
                                      left: 8, right: 8, top: 4, bottom: 4),
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Batting Style",
                                  style: primaryTextStyle(
                                    color: Colors.grey,
                                    size: 16,
                                  )).paddingOnly(left: 8, top: 4, bottom: 4),
                              Text("Right Handed Bat",
                                      style: primaryTextStyle(
                                        color: Cricket_textColorPrimary,
                                        size: 16,
                                      ))
                                  .paddingOnly(
                                      left: 8, right: 8, top: 4, bottom: 4),
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Bowling Style",
                                  style: primaryTextStyle(
                                    color: Colors.grey,
                                    size: 16,
                                  )).paddingOnly(left: 8, top: 4, bottom: 4),
                              Text("Right-arm legbreak",
                                      style: primaryTextStyle(
                                        color: Cricket_textColorPrimary,
                                        size: 16,
                                      ))
                                  .paddingOnly(
                                      left: 8, right: 8, top: 4, bottom: 4),
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                    ],
                  ),
                ).paddingAll(10),
              ],
            ),
          )),
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
                        side: BorderSide(
                            width: 1.5, color: Colors.grey)),
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
                                padding:
                                const EdgeInsets.only(
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
                      image: FileImage(
                          File(_image!.path).absolute),
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
                                padding:
                                const EdgeInsets.only(
                                    left: 50, right: 50),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(
                                            File(_image!.path)
                                                .absolute),
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
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
