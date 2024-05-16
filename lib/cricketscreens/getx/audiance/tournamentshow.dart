import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';
import 'package:yarn_modified/services/all_api_services.dart';

import '../../../model/teamwinloseresponse.dart';
import '../../../services/app_url.dart';
// import '../../model/getteamplayerlist.dart';
import '../../model/getpointsresponse.dart';
import '../../model/getteamplayerlist.dart';
import '../../model/gettournamenttype.dart';
import '../../model/tournamentlist.dart';
import '../../services/api_source.dart';

class TournamentAudianceController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  RxList<Tournamentdetails> gettournament = <Tournamentdetails>[].obs;
  RxBool gettourna = false.obs;

  Future<void> getaudiTournamentFromAPI() async {
    // Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url: "${URLs.Base_url}index_all_tournament",
    );
    response.fold(
      (l) {
        GetTournamentlist data = getTournamentlistFromJson(l.toString());
        print(jsonEncode(data));
        gettournament.value = data.data ?? [];
        gettourna.value = true;
        update();
        // Get.context!.loaderOverlay.hide();
      },
      (r) {
        // Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<Matchwinlose> teammatches = <Matchwinlose>[].obs;
  RxBool getwinlose = false.obs;


  Future<void> getteamwinlose({ required String tournamentid,required String teamid}) async {
    // Get.context!.loaderOverlay.show();
    getwinlose.value = false;
    final response = await webService.getRequest(
      url: "${URLs.Base_url}winloss/$tournamentid?team_id=$teamid",
    );
    response.fold(
      (l) {
        Teamwinloseresponse data = teamwinloseresponseFromJson(l.toString());
        print(jsonEncode(data));
        teammatches.value = data.match ?? [];
        getwinlose.value = true;
        // Get.context!.loaderOverlay.hide();
      },
      (r) {
        // Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<Tournament> getdetailstourna = <Tournament>[].obs;
  RxList<Matchinfo> getmatchinfo = <Matchinfo>[].obs;
  RxList<TeamAudiance> getteaminfo = <TeamAudiance>[].obs;
  RxBool gettournadetai = false.obs;
  RxBool isloading = false.obs;

  Future<void> getaudiTournamentDetails({required String id,required String status}) async {
    gettournadetai.value = false;
    isloading.value = true;
    // Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url: "${URLs.Base_url}tournament_details/$id?match_status=$status",
    );
    response.fold(
      (l) {
        TournamentDetailresponse data =
            tournamentDetailresponseFromJson(l.toString());
        print(jsonEncode(data));
        getmatchinfo.value = data.matchinfo ?? [];
        getteaminfo.value = data.team ?? [];
        getdetailstourna.value = data.tournament ?? [];
        gettournadetai.value = true;
        isloading.value = false;
        update();
        // Get.context!.loaderOverlay.hide();
      },
      (r) {
        isloading.value = false;

        // Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<playersresponse> getplayerlist = <playersresponse>[].obs;
  RxList<playersresponse> getextralist = <playersresponse>[].obs;
  RxBool playerbool = false.obs;
  Future<void> GetPlayerListFromAPI({required String teamid}) async {
    playerbool.value = false;
    // Get.context!.loaderOverlay.show();
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
        getplayerlist.value = data.date ?? [];
        getextralist.value = data.extra ?? [];
        playerbool.value = true;
        // Get.context!.loaderOverlay.hide();
      },
      (r) {
        // Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<Teampoints> getpointsA = <Teampoints>[].obs;
  RxList<Teampoints> getpointsB = <Teampoints>[].obs;
  RxList<Teampoints> getpointsC = <Teampoints>[].obs;
  RxList<Teampoints> getpointsD = <Teampoints>[].obs;
  RxBool getpoint = false.obs;

  Future<void> getpointsFromAPI({required String tournamentid}) async {
    // Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url:
          "${URLs.Base_url}groupbyteam/$tournamentid?user_id=${saveUser()?.id}",
    );
    response.fold(
      (l) {
        Getpointslist data = getpointslistFromJson(l.toString());
        print(jsonEncode(data));
        getpointsA.value = data.teamA ?? [];
        getpointsB.value = data.teamB ?? [];
        getpointsC.value = data.teamC ?? [];
        getpointsD.value = data.teamD ?? [];
        getpoint.value = true;
        // Get.context!.loaderOverlay.hide();
      },
      (r) {
        // Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }
}
