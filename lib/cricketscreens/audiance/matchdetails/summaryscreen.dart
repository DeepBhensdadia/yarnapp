import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constcolor.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text("Batsman",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("R",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("B",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("4s",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("6s",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("SR",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                    padding: const EdgeInsets.only(
                        left: 16, top: 4.0, bottom: 4.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Ben Stokes",
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("135",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("219",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("11",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("8",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("61.64",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.only(
                        left: 16, top: 4.0, bottom: 4.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Ben Stokes",
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("121",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("119",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("15",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("18",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("75.64",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    )),
                const Divider(),
                Container(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, left: 16, right: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text("Bowler",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("O",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("M",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("R",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("W",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("ER",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Pat Cummins",
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("24.4",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("5",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("80",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("1",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("3.28",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    )),
                const Divider(),
                Text("Last Wkt: Broad(0 (2))",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )).paddingOnly(left: 16, top: 4)
              ],
            ),
          )
        ],
      ),
    );
  }
}
