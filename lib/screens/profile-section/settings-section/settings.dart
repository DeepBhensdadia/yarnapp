import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../const/const.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.75),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,title: Text('Settings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ListTile(
                shape: RoundedRectangleBorder( //<-- SEE HERE
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                minLeadingWidth: 10,
                leading: Icon(Icons.support_agent_rounded),
                title: Text("Help & Support"),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () async {
                  launch("https://yarnpkg.com/getting-started/qa");
                  if(launch == true) {
                    FlutterToast.showCustomToast("Launching URL In Browser...");
                  }
                  else {
                    FlutterToast.showCustomToast("URL Launch Error !!!");
                  }
                  // String url =
                  // "https://yarnpkg.com/getting-started/qa";
                  // var urllaunchable = await canLaunch(
                  //     url); //canLaunch is from url_launcher package
                  // if (urllaunchable) {
                  //   await launch(
                  //       url); //launch is from url_launcher package to launch URL
                  //   FlutterToast.showCustomToast("Launching URL In Browser...");
                  // } else {
                  //   FlutterToast.showCustomToast("URL Launch Error !!!");
                  // }
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ListTile(
                shape: RoundedRectangleBorder( //<-- SEE HERE
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                minLeadingWidth: 10,
                leading: Icon(Icons.newspaper_rounded),
                title: Text("Terms & Conditions"),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () async {
                  launch("https://www.yarn.com.au/pages/terms-conditions#:~:text=In%20no%20event%20shall%20Yarn,authorized%20representative%20has%20been%20notified");
                  if(launch == true) {
                    FlutterToast.showCustomToast("Launching URL In Browser...");
                  }
                  else {
                    FlutterToast.showCustomToast("URL Launch Error !!!");
                  }
                  // String url =
                  //     "https://www.yarn.com.au/pages/terms-conditions#:~:text=In%20no%20event%20shall%20Yarn,authorized%20representative%20has%20been%20notified";
                  // var urllaunchable = await canLaunch(
                  //     url); //canLaunch is from url_launcher package
                  // if (urllaunchable) {
                  //   await launch(
                  //       url); //launch is from url_launcher package to launch URL
                  //   FlutterToast.showCustomToast("Launching URL In Browser...");
                  // } else {
                  //   FlutterToast.showCustomToast("URL Launch Error !!!");
                  // }
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ListTile(
                shape: RoundedRectangleBorder( //<-- SEE HERE
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                minLeadingWidth: 10,
                leading: Icon(Icons.privacy_tip_rounded),
                title: Text("Privacy Policy"),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () async {
                  launch("https://www.yarncopy.co.uk/privacypolicy#:~:text=We'll%20keep%20the%20personal,until%20you%20tell%20us%20otherwise.&text=You%20can%20ask%20for%20an,contact%20you%20in%20the%20future.");
                  if(launch == true) {
                    FlutterToast.showCustomToast("Launching URL In Browser...");
                  }
                  else {
                    FlutterToast.showCustomToast("URL Launch Error !!!");
                  }
                  // String url =
                  //     "https://www.yarncopy.co.uk/privacypolicy#:~:text=We'll%20keep%20the%20personal,until%20you%20tell%20us%20otherwise.&text=You%20can%20ask%20for%20an,contact%20you%20in%20the%20future.";
                  // var urllaunchable = await canLaunch(
                  //     url); //canLaunch is from url_launcher package
                  // if (urllaunchable) {
                  //   await launch(
                  //       url); //launch is from url_launcher package to launch URL
                  //   FlutterToast.showCustomToast("Launching URL In Browser...");
                  // } else {
                  //   FlutterToast.showCustomToast("URL Launch Error !!!");
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
