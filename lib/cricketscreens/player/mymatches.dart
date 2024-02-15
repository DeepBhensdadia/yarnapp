import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constcolor.dart';

class MyMatches extends StatefulWidget {
  const MyMatches({super.key});

  @override
  State<MyMatches> createState() => _MyMatchesState();
}

class _MyMatchesState extends State<MyMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: kthemecolor, title: Text("Matches"),actions: [
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
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey.withOpacity(0.15)),
              color: Colors.transparent,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tournament Name",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold)),
                          Text("SA20 League",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            // showTooltip(context, 'Hello', iconKey);
                          },
                          child: Icon(
                            CupertinoIcons.speaker_1,
                            color: Colors.grey.shade700,
                            size: 15,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FractionalTranslation(
                                        translation: Offset(-0.2, 0),
                                        child: Image.asset(
                                          "images/textilediary-applogo.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.9),
                                          Colors.white.withOpacity(0.5),
                                        ],
                                        radius: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: -18,
                              top: 8.5,
                              bottom: 8.5,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("images/textilediary-applogo.png"),
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Text(
                          "IND",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("1h 28m",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 2.5,
                        ),
                        Text("09:00 PM",
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "WI",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FractionalTranslation(
                                        translation: Offset(0.2, 0),
                                        child: Image.asset(
                                          "images/textilediary-applogo.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.9),
                                          Colors.white.withOpacity(0.5),
                                        ],
                                        radius: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: -18,
                              top: 8.5,
                              bottom: 8.5,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("images/textilediary-applogo.png"),
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("INDIA",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold)),
                      Text("WEST INDIES",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  thickness: 0.7,
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("ENG needs 1002 runs to win", style: TextStyle(
                          fontSize: 10,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
