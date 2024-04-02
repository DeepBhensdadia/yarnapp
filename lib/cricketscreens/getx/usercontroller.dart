import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';

import 'package:yarn_modified/services/all_api_services.dart';

import '../../const/const.dart';
import '../../model/getplayerdropdown.dart';
import '../../model/getplayerinfo.dart';
import '../../services/app_url.dart';
import '../admin/player/playerprofileadmin.dart';
import '../model/getteamplayerlist.dart';
import '../model/searchplayerresponse.dart';
import '../model/updateresponse.dart';
import '../model/usercheckmodel.dart';
import '../player/addplayerdetails.dart';
import '../player/playerprofilescreen.dart';
import '../player/tournamentscreen.dart';
import '../selection page.dart';
import '../services/api_source.dart';

class UserController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  String formFields =
      jsonEncode({"mobile_number": saveUser()?.mobileNumber.toString()});

  Rx<PlayerDetails> playerdata = PlayerDetails().obs;
  RxList<Matchinfo> matches = <Matchinfo>[].obs;
  RxList<Teamdetails> teams = <Teamdetails>[].obs;

  getuserconrollerCall() async {
    Get.context!.loaderOverlay.show();

    final response = await webService.postStringRequest(
      formData: formFields,
      url: "${URLs.Base_url}user_check",
    );
    response.fold(
      (l) {
        Usercheckmodel data = usercheckmodelFromJson(l.toString());
        Get.context!.loaderOverlay.hide();

        if (data.data?.mobileNumber == null) {
          Get.to(AddPlayerDetails());
        } else {
          getplayerinfoplayer(data.data?.id.toString());
        }
      },
      (r) {
        Get.context!.loaderOverlay.hide();

        print(r.message);
      },
    );
  }

  getplayerinfo(id) async {
    Get.context!.loaderOverlay.show();

    final response = await webService.getRequest(
      url: "${URLs.Base_url}player?player_id=$id",
    );
    response.fold(
      (l) {
        Getplayerinfo data = getplayerinfoFromJson(l.toString());
        if (data.data != null) {
          playerdata.value = data.data!;
          matches.value = data.matchs?.first ?? [];
          teams.value = data.teams ?? [];
          Get.to(PlayerProfileAdmin(data: data.data));
        }

        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();

        print(r.message);
      },
    );
  }

  getplayerinfoplayer(id) async {
    Get.context!.loaderOverlay.show();

    final response = await webService.getRequest(
      url: "${URLs.Base_url}player?player_id=$id",
    );
    response.fold(
      (l) {
        Getplayerinfo data = getplayerinfoFromJson(l.toString());
        if (data.data?.mobileNumber != null) {
          playerdata.value = data.data!;
          matches.value = data.matchs?.first ?? [];
          teams.value = data.teams ?? [];
          Get.to(PlayerProfileScreen());
        }

        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();

        print(r.message);
      },
    );
  }

  RxList<String> battingStyleList1 = <String>[].obs;
  RxList<String> bowlingStyleList1 = <String>[].obs;
  RxList<String> cricketerRoles1 = <String>[].obs;
  RxList<String> bowlingPaceList1 = <String>[].obs;

  getplayerdropdown() async {
    Get.context!.loaderOverlay.show();

    final response = await webService.getRequest(
      url: "${URLs.Base_url}playerdropdowndetails",
    );
    response.fold(
      (l) {
        Getplayerdropdown data = getplayerdropdownFromJson(l.toString());

        battingStyleList1.value = data.battingStyleList ?? [];
        bowlingStyleList1.value = data.bowlingStyleList ?? [];
        cricketerRoles1.value = data.cricketerRoles ?? [];
        bowlingPaceList1.value = data.bowlingPaceList ?? [];

        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();

        print(r.message);
      },
    );
  }

  TextEditingController playername = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController battingstyle = TextEditingController();
  TextEditingController bowlingstyle = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController city = TextEditingController();
  RxBool wicketkeeping = true.obs;

  Future<void> AddPlayerFromAPI({File? logo}) async {
    String birthdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(dob.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      "player_name": playername.text,
      "skills": skill.text,
      "nickname": nickname.text,
      "batting_style": battingstyle.text,
      "bowling_style": bowlingstyle.text,
      "city": city.text,
      "status": 1,
      "created_by": saveUser()?.id,
      "mobile_number": saveUser()?.mobileNumber,
      "visti_no": 0,
      "email": saveUser()?.email,
      "bob": birthdateformat(),
      "wicket_keeper": wicketkeeping.value == true ? "Yes" : "No",
    };
    if (logo != null) {
      formFields['logo'] = await MultipartFile.fromFile(logo.path,
          filename: 'imageFileName.jpg');
    }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}create_players",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        Get.back();
        getuserconrollerCall();
        // var data = getTournamentlistFromJson(l.toString());
        // print(jsonEncode(data));
        // getTournamentDataFromAPI();
        // name.clear();
        // location.clear();
        // adress.clear();
        // description.clear();
        // tournamnettype.clear();
        // Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();

        print(r.message);
      },
    );
  }

  Future<void> EditPlayerFromAPI({File? logo, required String id}) async {
    String birthdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(dob.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      "player_name": playername.text,
      "skills": skill.text,
      "nickname": nickname.text,
      "batting_style": battingstyle.text,
      "bowling_style": bowlingstyle.text,
      "status": 1,
      "city": city.text,
      "created_by": saveUser()?.id,
      "mobile_number": saveUser()?.mobileNumber,
      "visti_no": 0,
      "email": saveUser()?.email,
      "bob": birthdateformat(),
      "wicket_keeper": wicketkeeping.value == true ? "Yes" : "No",
    };
    if (logo != null) {
      formFields['logo'] = await MultipartFile.fromFile(logo.path,
          filename: 'imageFileName.jpg');
    }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}update_players/$id",
    );
    response.fold(
      (l) {
        // var data = getTournamentlistFromJson(l.toString());
        // print(jsonEncode(data));
        // getTournamentDataFromAPI();
        // name.clear();
        // location.clear();
        // adress.clear();
        // description.clear();
        // tournamnettype.clear();
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        getplayerinfoplayer(id);
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();

        print(r.message);
      },
    );
  }
}
