import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../widgets/common_fields.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.75),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notifications',
          textScaleFactor: 1,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'All App Notifications',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status1,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status1 = value;
                        status2 = value;
                        status3 = value;
                        status4 = value;
                        status5 = value;
                        status6 = value;
                        status7 = value;
                        if(status1 == true && status2 == true && status3 == true && status4 == true && status5 == true && status6 == true && status7 == true) {
                          Fluttertoast.showToast(
                              msg: "You Will Receive All The Notifications Regarding Our Application.",
                              fontSize: 12,
                              backgroundColor: Colors.blue,textColor: Colors.black);
                        } else {
                          Fluttertoast.showToast(
                              msg: "All The Notifications Are Turned Off You Will Not Receive Any Updates Regarding Our Application.",
                              fontSize: 12,
                              backgroundColor: Colors.white,textColor: Colors.red);
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'Notifications for Indian cotton prices',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status2,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status2 = value;
                        if(status1 == true) {
                          status1 = false;
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'Notifications for Indian Domestic yarn prices',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status3,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status3 = value;
                        if(status1 == true) {
                          status1 = false;
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'Notifications for Indian Export yarn prices',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status4,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status4 = value;
                        if(status1 == true) {
                          status1 = false;
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'Notifications for Bangladeshi Domestic yarn prices',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status5,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status5 = value;
                        if(status1 == true) {
                          status1 = false;
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'Notifications with Sounds',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status6,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status6 = value;
                        if(status1 == true) {
                          status1 = false;
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Card(
                  color: Colors.white.withOpacity(0.25),
                  child: SwitchListTile(
                    title: Text(
                      'Notifications with Vibrations',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: status7,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        status7 = value;
                        if(status1 == true) {
                          status1 = false;
                        }
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // FlutterSwitch(
                //   width: 100.0,
                //   height: 55.0,
                //   toggleSize: 45.0,
                //   value: status,
                //   borderRadius: 30.0,
                //   padding: 2.0,
                //   toggleColor: Colors.black12,
                //   switchBorder: Border.all(
                //     color: Colors.black,
                //     width: 6.0,
                //   ),
                //   toggleBorder: Border.all(
                //     color: Colors.white,
                //     width: 5.0,
                //   ),
                //   activeColor: Colors.green,
                //   inactiveColor: Colors.black38,
                //   onToggle: (val) {
                //     setState(() {
                //       status = val;
                //     });
                //   },
                // ),
                // SizedBox(height: 20.0),
                // FlutterSwitch(
                //   width: 125.0,
                //   height: 55.0,
                //   valueFontSize: 25.0,
                //   toggleSize: 45.0,
                //   value: status,
                //   borderRadius: 30.0,
                //   padding: 8.0,
                //   showOnOff: true,
                //   onToggle: (val) {
                //     setState(() {
                //       status = val;
                //     });
                //   },
                // ),
                // SizedBox(height: 20.0),
                // FlutterSwitch(
                //   activeText: "I am Active",
                //   inactiveText: "I am Inactive",
                //   value: status,
                //   valueFontSize: 16.0,
                //   width: 140,
                //   height: 80,
                //   borderRadius: 30.0,
                //   showOnOff: true,
                //   onToggle: (val) {
                //     setState(() {
                //       status = val;
                //     });
                //   },
                // ),
                // SizedBox(height: 10.0),
                // FlutterSwitch(
                //   width: 100.0,
                //   height: 55.0,
                //   toggleSize: 45.0,
                //   value: status,
                //   borderRadius: 30.0,
                //   padding: 2.0,
                //   activeToggleColor: Colors.purple,
                //   inactiveToggleColor: Colors.black,
                //   activeSwitchBorder: Border.all(
                //     color: Colors.orange,
                //     width: 6.0,
                //   ),
                //   inactiveSwitchBorder: Border.all(
                //     color: Colors.black,
                //     width: 6.0,
                //   ),
                //   activeColor: Colors.deepPurpleAccent,
                //   inactiveColor: Colors.white,
                //   activeIcon: Icon(
                //     Icons.nightlight_round,
                //     color: Colors.white,
                //   ),
                //   inactiveIcon: Icon(
                //     Icons.wb_sunny,
                //     color: Color(0xFFFFDF5D),
                //   ),
                //   onToggle: (val) {
                //     setState(() {
                //       status = val;
                //     });
                //   },
                // ),
                // SizedBox(height: 20.0),
                // FlutterSwitch(
                //   width: 100.0,
                //   height: 55.0,
                //   toggleSize: 45.0,
                //   value: status,
                //   borderRadius: 30.0,
                //   padding: 2.0,
                //   activeToggleColor: Colors.purple,
                //   inactiveToggleColor: Colors.white,
                //   activeSwitchBorder: Border.all(
                //     color: Colors.green,
                //     width: 6.0,
                //   ),
                //   inactiveSwitchBorder: Border.all(
                //     color: Colors.deepPurple,
                //     width: 6.0,
                //   ),
                //   activeColor: Colors.greenAccent,
                //   inactiveColor: Colors.blueAccent,
                //   activeIcon: Image.network(
                //       "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png"),
                //   inactiveIcon: Image.network(
                //       "https://img2.pngio.com/functional-bits-in-flutter-flutter-community-medium-flutter-png-1000_1000.png"),
                //   onToggle: (val) {
                //     setState(() {
                //       status = val;
                //     });
                //   },
                // ),

                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                              "You Will Get All Notifications Regarding Our App That Your Processing Transactions, Booked Orders, and Other All Necessary Notifications will Be Notified To You. Make Sure You Have Turned Notification Button ON."),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
