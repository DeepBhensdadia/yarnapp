import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import '../../services/app_url.dart';
import '../model/ballbyballresponse.dart';
import '../model/battingnextplayerlistresponse.dart';
import '../model/getscroreboarddetails.dart';
import '../model/getteamplayerlist.dart';
import '../model/matchlivedetailsresponse.dart';
import '../model/playerofthematchlist.dart';
import '../services/api_source.dart';
import 'matchcontroller.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
// import 'package:screenshot/screenshot.dart';

class StartMatchController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  Rx<MatchLive> matchlive = MatchLive().obs;
  RxList<Ball> balls = <Ball>[].obs;
  RxBool isnewover = false.obs;
  RxBool isnewinning = false.obs;
  RxBool isbowler = false.obs;
  RxBool isstrikebatsman = false.obs;
  RxBool isnonstrikebatsman = false.obs;
  RxBool isloading = false.obs;
  RxString overrun = "0".obs;
  RxInt outplayer = 0.obs;
  RxString partnershiprun = "0".obs;
  RxString partnershipball = "0".obs;
  RxString requirerunrate = "0.00".obs;
  RxString target = "0".obs;
  RxString requirestatus = "".obs;

  Future<void> matchInfoDetailFromAPI(
      {required String tournamentid, required String matchid}) async {
    isnewover.value = false;
    isnewinning.value = false;
    if (isloading.isFalse) Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      // "user_id": saveUser()?.id.toString(),
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
        overrun.value = match.overruns.toString() ?? "0";
        partnershiprun.value = match.partnershipRun.toString();
        partnershipball.value = match.partnershipBall.toString();
        requirerunrate.value = match.requiredRunrate.toString();
        target.value = match.targetRun.toString();
        outplayer.value = match.outPlayerId ?? 0;
        requirestatus.value = match.requiredStatus.toString();
        isloading.value = true;
        isnewinning.value = match.isNewInning ?? false;
        isbowler.value = match.isBowlerChangeable ?? false;
        isstrikebatsman.value = match.isStrikerChangeable ?? false;
        isnonstrikebatsman.value = match.isNonstrikerChangeable ?? false;
        isnewover.value =
            match.isNewOver == true && match.isbowlerassigned == false
                ? true
                : false;

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
      url: "${URLs.Base_url}finish_first_inning",
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

  RxBool Endmatch = false.obs;
  Future<void> matchcomplete({
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
      url: "${URLs.Base_url}finish_second_inning",
    );
    response.fold(
      (l) {
        matchInfoDetailFromAPI(tournamentid: tournamentid, matchid: matchid)
            .then((value) {
          Get.back();
          Endmatch.value = true;
        });

        // Get.back();
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
      url: "${URLs.Base_url}inning_toss",
    );
    response.fold(
      (l) {
        final responseData = l.data;
        // Get.off(OpeningPlayers());
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

  RxList<playerlist> Allplayerlist = <playerlist>[].obs;
  Future<void> AllPlayersListFromAPI({
    required String teamid1,
    required String teamid2,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'team_1': teamid1,
      'team_2': teamid2,
    };

    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}both_team_player",
    );
    response.fold(
      (l) {
        Playerofthematchlist data = playerofthematchlistFromJson(l.toString());
        print(jsonEncode(data));

        Allplayerlist.value = data.date ?? [];
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

  Future<void> replacebowleradd({
    required String tournamentid,
    required String matchid,
    required String playerid,
    required String oldplayerid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'new_player_id': playerid,
      'team_id': matchlive.value.bowlingTeamId.toString(),
      'old_player_id': oldplayerid,
      'match_id': matchid
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}edit_new_bowler",
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
    required bool isstrike,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'player_id': playerid,
      'team_id': teamid,
      'tournament_id': tournamentid,
      'match_id': matchid,
      'is_on_strike': isstrike == false ? 0 : 1
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

  Future<void> replacebatsmanadd({
    required String tournamentid,
    required String matchid,
    required String playerid,
    required String oldplayerid,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'new_player_id': playerid,
      'old_player_id': oldplayerid,
      // 'team_id': teamid,
      // 'tournament_id': tournamentid,
      'match_id': matchid,
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}edit_new_bats_man",
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
    required String noballtype,
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
      'no_ball_type': noballtype,
      'out_by_player_id': outbyplayerid,
      'out_player_id': outplayerid,
      'match_ids': matchid,
      "betting_team_id": battingteamid,
      "bowling_team_id": bowlingteamid,
      "team_id": battingteamid
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
  Rx<MatchscroreboardDetails> scroreboard2 = MatchscroreboardDetails().obs;

  RxInt indextab = 0.obs;
  RxBool scorebordbool = false.obs;
  Future<void> scorecardFromAPI(
      {required String teamid,
      required String matchid,
      required String touramentid}) async {
    if (isloading.isFalse) Get.context!.loaderOverlay.show();

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
        isloading.value = true;
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        isloading.value = false;
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxBool scorebordbool2 = false.obs;
  Future<void> scorecard2FromAPI(
      {required String teamid,
      required String matchid,
      required String touramentid}) async {
    if (isloading.isFalse) Get.context!.loaderOverlay.show();
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
        scroreboard2.value = data;
        scorebordbool2.value = true;
        isloading.value = true;
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        isloading.value = false;
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  RxList<Overs> team1overs = <Overs>[].obs;
  RxList<Overs> team2overs = <Overs>[].obs;
  Rx<BallTeam> team1data = BallTeam().obs;
  Rx<BallTeam> team2data = BallTeam().obs;
  RxBool overbool = false.obs;
  Future<void> Overswiserun(
      {required String matchid, required String touramentid}) async {
    if (isloading.isFalse) Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'user_id': saveUser()?.id.toString(),
      'match_id': matchid,
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}ballbyball/$touramentid",
    );
    response.fold(
      (l) {
        print(jsonEncode(l.toString()));
        Ballbyballresponse data = ballbyballresponseFromJson(l.toString());
        team1data.value = data.team1 ?? BallTeam();
        team2data.value = data.team2 ?? BallTeam();
        team1overs.value = data.team1?.overs ?? [];
        team2overs.value = data.team2?.overs ?? [];
        overbool.value = true;
        isloading.value = true;
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        isloading.value = false;
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  TextEditingController remark = TextEditingController();

  Future<void> DeclareResult({
    required String matchid,
    required String touramentid,
    required String winningteamid,
    required String result,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'match_id': matchid,
      'team_id': winningteamid,
      'notes': remark.text,
      'status': '5',
      'result': result
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}declare_result",
    );
    response.fold(
      (l) {
        print(jsonEncode(l.toString()));
        matchInfoDetailFromAPI(tournamentid: touramentid, matchid: matchid);
        Get.find<MatchController>().getmatchlistCall(id: touramentid);
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

  Future<void> changestrike({
    required String matchid,
    required String touramentid,
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
      url: "${URLs.Base_url}strick_change",
    );
    response.fold(
      (l) {
        print(jsonEncode(l.toString()));
        matchInfoDetailFromAPI(tournamentid: touramentid, matchid: matchid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> matchundoo({
    required String matchid,
    required String touramentid,
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
      url: "${URLs.Base_url}undobutton",
    );
    response.fold(
      (l) {
        print(jsonEncode(l.toString()));
        matchInfoDetailFromAPI(tournamentid: touramentid, matchid: matchid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> playerofthematchapi({
    required String matchid,
    required String touramentid,
    required String playerofthematch,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'match_id': matchid,
      'player_id': playerofthematch
    };
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));
    print(formData);
    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}declare_player_of_the_match",
    );
    response.fold(
      (l) {
        print(jsonEncode(l.toString()));
        matchInfoDetailFromAPI(tournamentid: touramentid, matchid: matchid);
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }
}
