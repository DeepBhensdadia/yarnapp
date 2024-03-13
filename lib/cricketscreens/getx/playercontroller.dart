import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../const/const.dart';
import '../../services/all_api_services.dart';
import '../../services/app_url.dart';
import '../model/getplayerrolelist.dart';
import '../model/getteamplayerlist.dart';
import '../model/searchplayerresponse.dart';
import '../model/updateresponse.dart';
import '../services/api_source.dart';

class PlayerController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  RxList<PlayerDetails> getplayer = <PlayerDetails>[].obs;

  TextEditingController searchController = TextEditingController();

  Future<void> getplayerDataFromAPI({required String phonenumber}) async {
    // Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url:
          "${URLs.Base_url}playersrc?search=${phonenumber}&user_id=${saveUser()?.id}",
    );
    response.fold(
      (l) {
        var data = getplayerlistFromJson(l.toString());
        print(jsonEncode(data));
        getplayer.value = data.data ?? [];
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<playersresponse> getplayerlist = <playersresponse>[].obs;
  RxList<playersresponse> getextralist = <playersresponse>[].obs;
  RxList<String> playerids = <String>[].obs;
  RxBool playerbool = false.obs;

  Future<void> GetPlayerListFromAPI({required String teamid}) async {
    if (getplayerlist.isEmpty) playerbool.value = false;
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_id': teamid,
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}team_wise_player",
    );
    response.fold(
      (l) {
        var data = getteamplayerlistFromJson(l.toString());
        print(jsonEncode(data));
        playerids.clear();
        getplayerlist.value = data.date ?? [];
        getplayerlist.forEach(
            (element) => playerids.add(element.playerId.toString() ?? ""));
        getextralist.value = data.extra ?? [];
        playerbool.value = true;
        print(playerids.toString());
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> AddPlayerFromAPI(
      {required String teamid,
      required String playerid,
      required String tournamentid}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_id': teamid,
      'player_id': playerid,
      'tournament_id': tournamentid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}add_player",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        GetPlayerListFromAPI(teamid: teamid);
        // Get.back();
        getplayer.clear();
        searchController.clear();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<Positions> getplayerrolelist = <Positions>[].obs;
  RxBool positionbool = false.obs;
  Future<void> getplayerroleFromAPI() async {
    // Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url: "${URLs.Base_url}playerRole",
    );
    response.fold(
      (l) {
        var data = getplayerrolelistFromJson(l.toString());
        print(jsonEncode(data));
        getplayerrolelist.value = data.data ?? [];
        positionbool.value = true;
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> playerroleAdd({
    required String plyerid,
    required String Position,
    required String teamid,
  }) async {
    Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url:
          "${URLs.Base_url}editRole/$plyerid?position=$Position&team_id=$teamid",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        GetPlayerListFromAPI(teamid: teamid);
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> ChangePlayerPosition(
      {required String teamid, required List<String> ordersequence}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_id': teamid,
      'order_by': ordersequence
    };
    final response = await webService.postStringRequest(
      formData: jsonEncode(formFields),
      url: "${URLs.Base_url}order_sequence",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        GetPlayerListFromAPI(teamid: teamid);
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> DeletePlayerFromList({
    required String playerid,
    required String teamid,
  }) async {
    Get.context!.loaderOverlay.show();
    // Map<String, dynamic> formFields = {
    //   'team_id': teamid,
    //   'order_sequence': ordersequence
    // };
    // List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    // FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    // print(formData);
    final response = await webService.getRequest(
      // formData: formData,
      url: "${URLs.Base_url}remove_team_player/$playerid",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        GetPlayerListFromAPI(teamid: teamid);
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
