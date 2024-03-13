import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/helper.dart';
import '../../../const/const.dart';
import '../../../const/themes.dart';
import '../../../constcolor.dart';
import '../../../services/app_url.dart';
import '../../../widgets/tournamenttextfield.dart';
import '../../getx/playercontroller.dart';
import '../../getx/usercontroller.dart';
import '../../model/getteamslistresponse.dart';

class AddPlayerScreen extends StatefulWidget {
  final Teams teamid;
  const AddPlayerScreen({super.key, required this.teamid});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  PlayerController playerController = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "${widget.teamid.teamName}",
          textScaleFactor: 1,
          style: TextStyle(letterSpacing: 0.5, color: MyTheme.appBarTextColor),
        ),
        // centerTitle: true,
        backgroundColor: MyTheme.appBarColor,
        elevation: 5,
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.20),
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.025),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: decration,
        child: SingleChildScrollView(
          child: Column(children: [
            // SizedBox(height: 50,),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).textScaleFactor * 15,
                  ),
                  controller: playerController.searchController,
                  onChanged: (text) {
                    playerController.getplayerDataFromAPI(phonenumber: text);
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 0.1,
                        onPressed: () {
                          playerController.getplayer.clear();
                          playerController.searchController.clear();
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      hintText: "Search Players...",
                      hintStyle: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 13,
                          color: Colors.grey),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5)))),
            ),
            Obx(
              () => playerController.getplayer.isEmpty
                  ? Container(
                      height: screenheight(context, dividedby: 1.5),
                      child:
                          Text("Please search for players to add to the team."),
                    )
                  : ListView.builder(
                      itemCount: playerController.getplayer.length,
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          child: ListTile(
                            visualDensity: VisualDensity.compact,
                            onTap: () {
                              playerController.AddPlayerFromAPI(
                                  teamid: widget.teamid.id.toString(),
                                  playerid: playerController.getplayer[index].id
                                      .toString(),
                                  tournamentid:
                                      widget.teamid.tournamentId.toString());
                            },
                            minVerticalPadding: 0,
                            contentPadding: EdgeInsets.all(8),
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(URLs
                                        .image_url_player +
                                    "${playerController.getplayer[index].logo}")),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${playerController.getplayer[index].playerName}",
                                    textScaleFactor: 1.15,
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "${playerController.getplayer[index].mobileNumber}",
                                    textScaleFactor: 1,
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ]),
        ),
      ),
    );
  }
}
