import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import '../../services/app_url.dart';
import '../admin/match/startmatch/openingplayers.dart';
import '../audiance/matchdetails/infoscreen.dart';
import '../model/battingnextplayerlistresponse.dart';
import '../model/getscroreboarddetails.dart';
import '../model/getteamplayerlist.dart';
import '../model/matchlivedetailsresponse.dart';
import '../services/api_source.dart';

class StartMatchController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  Rx<MatchLive> matchlive = MatchLive().obs;
  RxList<Ball> balls = <Ball>[].obs;
  RxBool isnewover = false.obs;
  RxBool isnewinning = false.obs;

  Future<void> matchInfoDetailFromAPI(
      {required String tournamentid, required String matchid}) async {
    isnewover.value = false;
    isnewinning.value = false;
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      "user_id": saveUser()?.id.toString(),
      "match_id": matchid
    };
    print(formFields);
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}matchinfo/$tournamentid",
    );
    response.fold(
      (l) {
        MatchLiveDetails match = matchLiveDetailsFromJson(l.toString());
        matchlive.value = match.data ?? MatchLive();
        balls.value = match.balls ?? [];
        isnewover.value = match.isNewOver ?? false;
        isnewinning.value = match.isNewInning ?? false;
        if (playeradd != 0) confirmposition();
        teamname();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxString batteam = "".obs;
  RxString ballteam = "".obs;

  RxInt playeradd = 0.obs;

  confirmposition() {
    battingteamPlayerListFromAPI(
        teamid: matchlive.value.bettingTeamId.toString());
    bowlingteamPlayerListFromAPI(
        teamid: matchlive.value.bowlingTeamId.toString());
    teamname();
  }

  teamname() {
    batteam.value = matchlive.value.team1?.id == matchlive.value.bettingTeamId
        ? matchlive.value.team1?.shortName ?? ''
        : matchlive.value.team2?.shortName ?? '';
    ballteam.value = matchlive.value.team1?.id == matchlive.value.bowlingTeamId
        ? matchlive.value.team1?.shortName ?? ''
        : matchlive.value.team2?.shortName ?? '';
  }

  Future<void> Firstinningcomplete({
    required String matchid,
    required String tournamentid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'match_id': matchid,
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}finshFristInning",
    );
    response.fold(
      (l) {
        matchInfoDetailFromAPI(tournamentid: tournamentid, matchid: matchid);
        Get.back();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> tossdetailFromAPI(
      {required String wonteamid,
      required String matchid,
      required String tosselect}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      "won_toss_team": wonteamid,
      "toss_elected": tosselect,
      "match_id": matchid
    };
    print(formFields);
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}toss",
    );
    response.fold(
      (l) {
        final responseData = l.data;
        // Get.off(OpeningPlayers());
        playeradd.value = 1;
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<playersresponse> battingteam = <playersresponse>[].obs;

  RxList<playersresponse> bowlingteam = <playersresponse>[].obs;

  Future<void> battingteamPlayerListFromAPI({required String teamid}) async {
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

        battingteam.value = data.date ?? [];
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> bowlingteamPlayerListFromAPI({required String teamid}) async {
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
        bowlingteam.value = data.date ?? [];
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<playerlistnext> battingordernext = <playerlistnext>[].obs;
  Future<void> battingordernextFromAPI({
    required String teamid,
    required String matchid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {'team_id': teamid, 'match_id': matchid};

    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}batsmanList",
    );
    response.fold(
      (l) {
        Battingnextplayerlist data =
            battingnextplayerlistFromJson(l.toString());
        print(jsonEncode(data));

        battingordernext.value = data.data ?? [];
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<playerlistnext> bowlingordernext = <playerlistnext>[].obs;
  Future<void> bowlingordernextFromAPI({
    required String teamid,
    required String matchid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_id': teamid,
      'match_id': matchid,
    };

    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}bowlerList",
    );
    response.fold(
      (l) {
        Battingnextplayerlist data =
            battingnextplayerlistFromJson(l.toString());
        print(jsonEncode(data));

        bowlingordernext.value = data.data ?? [];
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  TextEditingController strike = TextEditingController();
  TextEditingController nonstrike = TextEditingController();
  TextEditingController bowler = TextEditingController();

  Future<void> Playeraddinpeach({
    required String battingteamid,
    required String bowlingteamid,
    required String tournamentid,
    required String matchid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'sticker_player_id': strike.text,
      'nonsticker_player_id': nonstrike.text,
      'bowler_player_id': bowler.text,
      "betting_team_id": battingteamid,
      "bowling_team_id": bowlingteamid,
      'tournament_id': tournamentid,
      'match_id': matchid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}add_match_player",
    );
    response.fold(
      (l) {
        playeradd.value = 0;
        matchInfoDetailFromAPI(tournamentid: tournamentid, matchid: matchid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> nextoverbowleradd({
    required String teamid,
    required String tournamentid,
    required String matchid,
    required String playerid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'player_id': playerid,
      'team_id': teamid,
      'tournament_id': tournamentid,
      'match_id': matchid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}newbowler",
    );
    response.fold(
      (l) {
        // playeradd.value = 0;
        matchInfoDetailFromAPI(tournamentid: tournamentid, matchid: matchid);
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> newbatsmanadd({
    required String teamid,
    required String tournamentid,
    required String matchid,
    required String playerid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'player_id': playerid,
      'team_id': teamid,
      'tournament_id': tournamentid,
      'match_id': matchid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}newbatsman",
    );
    response.fold(
      (l) {
        // playeradd.value = 0;
        matchInfoDetailFromAPI(tournamentid: tournamentid, matchid: matchid);
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> runaddFromAPI({
    required String strikerid,
    required String nonstrikerid,
    required String tournamentid,
    required String matchid,
    required String run,
    required String balltype,
    required String bowlerid,
    required String over,
    required String ballnumber,
    required String outtype,
    required String outbyplayerid,
    required String outplayerid,
    required String bowlingteamid,
    required String battingteamid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'sticker_player_id': strikerid,
      'nonsticker_player_id': nonstrikerid,
      'run': run,
      'ball_type': balltype,
      'bowler_player_id': bowlerid,
      'over_number': over,
      'ball_number': ballnumber,
      'out_type': outtype,
      'out_by_player_id': outbyplayerid,
      'out_player_id': outplayerid,
      'match_ids': matchid,
      "betting_team_id": battingteamid,
      "bowling_team_id": bowlingteamid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}add_match_over",
    );
    response.fold(
      (l) {
        // playeradd.value = 0;
        matchInfoDetailFromAPI(tournamentid: tournamentid, matchid: matchid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Rx<MatchscroreboardDetails> scroreboard = MatchscroreboardDetails().obs;

  RxBool scorebordbool = false.obs;
  Future<void> scorecardFromAPI(
      {required String teamid,
      required String matchid,
      required String touramentid}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'user_id': saveUser()?.id.toString(),
      'match_id': matchid,
      'team_id': teamid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}scorecard/$touramentid",
    );
    response.fold(
      (l) {
        print(jsonEncode(l.toString()));
        MatchscroreboardDetails data =
            matchscroreboardDetailsFromJson(l.toString());
        scroreboard.value = data;
        scorebordbool.value = true;
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }
}
