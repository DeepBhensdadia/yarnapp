import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 200,
          width: double.infinity,
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(15),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Summary",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "India",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "201/5 (10.0 Overs)",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Text("Vs"),
                      Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pakistan",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "198/10 (8.5 Overs)",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          // height: 200,
          width: double.infinity,
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Match Info",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textlines(text1: "Tournament", text2: "Gn League"),
                  textlines(text1: "Match Type", text2: "Oneday Match"),
                  textlines(text1: "Overs", text2: "50 Overs"),
                  textlines(text1: "Date & Time", text2: "14-March-24 7:00 PM"),
                  textlines(text1: "Venue", text2: "Sardar Patel, Surat"),
                  textlines(text1: "Toss", text2: "TeamB opt to bat"),
                  textlines(text1: "Ball Type", text2: "Tennis"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  textlines({
    required String text1,
    required String text2,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                text1,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
          Text(":  "),
          Expanded(
              flex: 2,
              child: Text(
                text2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }
}
