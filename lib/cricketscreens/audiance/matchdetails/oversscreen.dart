import 'package:flutter/material.dart';

import '../../../constcolor.dart';

class OversScreen extends StatefulWidget {
  const OversScreen({super.key});

  @override
  State<OversScreen> createState() => _OversScreenState();
}

class _OversScreenState extends State<OversScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.vertical,
        itemCount: 20,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 20),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

              onTap: () {
              },
              leading: Column(
                children: [
                  Text("Ov ${index + 1}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${index + 5} runs",
                    style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "Padmakar Surve to Virat Mehsaniya, Sikandar to Deep Paatil not Patel",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              subtitle: Row(
                children: List.generate(
                    6,
                        (index) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkBlue,
                        ),
                        child: Center(
                          child: index == 0
                              ? Text(
                            "w",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                              : Text(
                            "${index + 3}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 0.75,
          );
        },
      ),
    );
  }
}
