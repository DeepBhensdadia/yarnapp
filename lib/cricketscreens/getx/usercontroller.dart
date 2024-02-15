import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:yarn_modified/services/all_api_services.dart';

import '../../services/app_url.dart';
import '../model/usercheckmodel.dart';
import '../player/playerrootscreen.dart';
import '../selection page.dart';
import '../services/api_source.dart';

class UserController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  String formFields =
      jsonEncode({"mobile_number": saveUser()?.mobileNumber.toString()});

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

        if (data.data?.mobileNumber != null) {
          Get.to(PlayerRootApp());
        } else {
          Get.to(SelectionPage());
        }
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
  TextEditingController weight = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController fistpref = TextEditingController();
  TextEditingController bowlingpace = TextEditingController();

  Future<void> AddPlayerFromAPI({File? logo}) async {
    Map<String, dynamic> formFields = {
      "player_name": playername.text,
      "skills": skill.text,
      "nickname": nickname.text,
      "batting_style": battingstyle.text,
      "bowling_style": bowlingstyle.text,
      "status": 1,
      "created_by": saveUser()?.id,
      "mobile_number": saveUser()?.mobileNumber,
      "weight": weight.text,
      "age": age.text,
      "visti_no": 0,
      "email": saveUser()?.email,
      "bob": "12/12/1998",
      "first_preference": fistpref.text,
      "Bowling_pace": bowlingpace.text,
      "wicket_keeper": "yes",
      "cap_experience": "No"
    };
    // if (logo != null) {
    //   formFields['logo'] = await MultipartFile.fromFile(logo.path, filename: 'imageFileName.jpg');
    // }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}create_players",
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
        // Get.back();
      },
      (r) => print(r.message),
    );
  }
}
