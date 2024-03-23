import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/cricketscreens/model/tournamentdetailresponse.dart';

import '../../../services/app_url.dart';
// import '../../model/getteamplayerlist.dart';
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

  RxList<Tournament> getdetailstourna = <Tournament>[].obs;
  RxList<Matchinfo> getmatchinfo = <Matchinfo>[].obs;
  RxList<TeamAudiance> getteaminfo = <TeamAudiance>[].obs;
  RxBool gettournadetai = false.obs;

  Future<void> getaudiTournamentDetails({required String id}) async {
    gettournadetai.value = false;
    // Get.context!.loaderOverlay.show();
    final response = await webService.getRequest(
      url: "${URLs.Base_url}tournament_details/$id",
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
        update();
        // Get.context!.loaderOverlay.hide();
      },
      (r) {
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
}
