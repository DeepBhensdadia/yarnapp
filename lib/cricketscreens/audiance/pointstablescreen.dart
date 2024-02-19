import 'package:flutter/material.dart';
import 'package:yarn_modified/helper.dart';

import '../../const/const.dart';
import '../../const/themes.dart';
import '../../constcolor.dart';

class PointTableScreen extends StatefulWidget {
  const PointTableScreen({super.key});

  @override
  State<PointTableScreen> createState() => _PointTableScreenState();
}

class _PointTableScreenState extends State<PointTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 10, top: 16, bottom: 16),
                width: screenwidth(context, dividedby: 1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Text('Team',
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text("P",
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text("W",
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text("L",
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text("NR",
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            ))),
                    Expanded(
                        flex: 2,
                        child: Text("Pts",
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text("NRR",
                            style: TextStyle(
                              color: Cricket_Primary,
                              fontSize: 12,
                            )))
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    color:
                        (index.isEven ? Cricket_white : Colors.grey.shade200),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: <Widget>[
                              Image.asset("images/textilediary-applogo.png",
                                  width: 25, height: 25, fit: BoxFit.cover),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("India",
                                      style: TextStyle(
                                          color: Cricket_textColorPrimary,
                                          fontSize: 12)))
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("10",
                                  style: primaryTextStyle(
                                      color: Cricket_textColorPrimary,
                                      size: 12)),
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("8",
                                  style: primaryTextStyle(
                                      color: Cricket_textColorPrimary,
                                      size: 12)),
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("2",
                                  style: primaryTextStyle(
                                      color: Cricket_textColorPrimary,
                                      size: 12)),
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("0",
                                  style: primaryTextStyle(
                                      color: Cricket_textColorPrimary,
                                      size: 12)),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("0",
                                  style: primaryTextStyle(
                                      color: Cricket_textColorPrimary,
                                      size: 12)),
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("16",
                                  style: primaryTextStyle(
                                      color: Cricket_textColorPrimary,
                                      size: 12,
                                      weight: FontWeight.bold)),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
