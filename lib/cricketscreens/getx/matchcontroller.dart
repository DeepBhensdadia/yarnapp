import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:yarn_modified/cricketscreens/services/api_source.dart';

import '../../const/const.dart';
import '../../services/all_api_services.dart';
import '../../services/app_url.dart';

import '../model/matchlistmode.dart';
import '../model/tournamentdetailresponse.dart';
import '../model/updateresponse.dart';

class MatchController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  RxInt isadmin = 0.obs;
  RxBool machloading = false.obs;
  RxList<Matchinfo> matchllist = <Matchinfo>[].obs;

  getmatchlistCall({required String id}) async {
    Get.context!.loaderOverlay.show();
    // charChaCall.value = false;
    if (matchllist.isEmpty) machloading.value = false;

    // EasyLoading.show();

    final response = await webService.getRequest(
      url: "${URLs.Base_url}index_match_info/$id?user_id=${saveUser()?.id}",
    );
    response.fold(
      (l) {
        Matchlistmodel data = matchlistmodelFromJson(l.toString());
        matchllist.value = data.data ?? [];
        Get.context!.loaderOverlay.hide();

        machloading.value = true;
        // update();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  TextEditingController team1 = TextEditingController();
  TextEditingController team2 = TextEditingController();
  TextEditingController Location = TextEditingController();
  TextEditingController upmire = TextEditingController();
  TextEditingController matchdate = TextEditingController();
  TextEditingController matchtime = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController matchtype = TextEditingController();
  TextEditingController overs = TextEditingController();
  Future<void> AddmatchFromAPI({required String tournamentid}) async {
    String matchdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(matchdate.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'created_by': saveUser()?.id,
      'tournament_id': tournamentid,
      'team_1': team1.text,
      'team_2': team2.text,
      'match_date': matchdateformat(),
      'umpires': upmire.text,
      'match_time': matchtime.text,
      'venue': Location.text,
      'match_type': matchtype.text,
      'description': description.text,
      'overseas': overs.text
    };
    print(formFields);
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}create_match_info",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        log(jsonEncode(l.toString()));
        getmatchlistCall(id: tournamentid);
        team1.clear();
        team2.clear();
        Location.clear();
        upmire.clear();
        matchdate.clear();
        matchtime.clear();
        description.clear();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> EditmatchFromAPI(
      {required String tournamentid, required String id}) async {
    String matchdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(matchdate.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'created_by': saveUser()?.id,
      'tournament_id': tournamentid,
      'team_1': team1.text,
      'team_2': team2.text,
      'match_date': matchdateformat(),
      'umpires': upmire.text,
      'match_time': matchtime.text,
      'venue': Location.text,
      'match_type': matchtype.text,
      'description': description.text,
      'overseas': overs.text
    };
    print(formFields);
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}update_match_info/$id",
    );
    response.fold(
      (l) {
        log(jsonEncode(l.toString()));
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        getmatchlistCall(id: tournamentid);
        team1.clear();
        team2.clear();
        Location.clear();
        upmire.clear();
        matchdate.clear();
        matchtime.clear();
        description.clear();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> DeletematchFromAPI(
      {required String id, required String tournamentid}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {'match_id': id, 'is_delete': '0'};
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}match_delete",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        Get.back();
        // print(jsonEncode(data));
        getmatchlistCall(id: tournamentid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }
}
