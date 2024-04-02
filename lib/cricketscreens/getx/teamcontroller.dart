import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:yarn_modified/cricketscreens/services/api_source.dart';
import 'package:yarn_modified/services/all_api_services.dart';

import '../../const/const.dart';
import '../../services/app_url.dart';
import '../model/getteamslistresponse.dart';
import '../model/gettournamenttype.dart';
import '../model/grouplistresponse.dart';
import '../model/tournamentlist.dart';
import '../model/updateresponse.dart';
import '../services/cricket_api.dart';

class TeamController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  RxList<Teams> getteams = <Teams>[].obs;
  RxBool tournamenttypebool = false.obs;

  Future<void> getTeamDataFromAPI({required String id}) async {
    if (getteams.isEmpty) tournamenttypebool.value = false;

    Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url: "${URLs.Base_url}index_team/$id?user_id=${saveUser()?.id}",
    );
    response.fold(
      (l) {
        var data = getteamslistFromJson(l.toString());
        print(jsonEncode(data));
        getteams.value = data.data ?? [];
        tournamenttypebool.value = true;
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<String> getgroups = <String>[].obs;
  Future<void> getgroupDataAPI() async {
    Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url: "${URLs.Base_url}group_list",
    );
    response.fold(
      (l) {
        Grouplistdata data = grouplistdataFromJson(l.toString());
        print(jsonEncode(data));
        getgroups.value = data.data ?? [];
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  TextEditingController teamname = TextEditingController();
  TextEditingController shortname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController group = TextEditingController();
  RxBool status = true.obs;

  Future<void> AddTeamFromAPI(
      {File? logo, required String tournamentid}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_name': teamname.text,
      'created_by': saveUser()?.id,
      'short_name': shortname.text,
      'tournament_id': tournamentid,
      "team_owner": ownername.text,
      "group_id": group.text,
      'status': status.value ? "1" : "0"
    };
    if (logo != null) {
      formFields['logo'] = await MultipartFile.fromFile(logo.path,
          filename: 'imageFileName.jpg');
    }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}create_team",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        // var data = getTournamentlistFromJson(l.toString());
        print(jsonEncode(data));
        getTeamDataFromAPI(id: tournamentid);
        shortname.clear();
        teamname.clear();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> EditTeamFromAPI(
      {File? logo, required String tournamentid, required String id}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_name': teamname.text,
      'created_by': saveUser()?.id,
      'short_name': shortname.text,
      'tournament_id': tournamentid,
      "team_owner": ownername.text,
      "group_id": group.text,
      'status': status.value ? "1" : "0"
    };
    if (logo != null) {
      formFields['logo'] = await MultipartFile.fromFile(logo.path,
          filename: 'imageFileName.jpg');
    }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}update_team/$id",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        print(jsonEncode(data));
        getTeamDataFromAPI(id: tournamentid);

        shortname.clear();
        teamname.clear();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> DeleteTeamFromAPI(
      {required String id, required String tournamentid}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {'team_id': id, 'is_delete': '0'};
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}team_delete",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        Get.back();
        // print(jsonEncode(data));
        getTeamDataFromAPI(id: tournamentid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }
}
