import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:yarn_modified/cricketscreens/services/api_source.dart';

import '../../services/app_url.dart';

import '../model/matchlistmode.dart';

class MatchController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  // RxBool machloading = false.obs;
  RxList<MatchList> matchllist = <MatchList>[].obs;

  getmatchlistCall() async {

    // charChaCall.value = false;
    // EasyLoading.show();

    final response = await webService.getRequest(
      url: "${URLs.Base_url}index_match_info", );
    response.fold(
          (l) {
            Matchlistmodel data = matchlistmodelFromJson(l.toString());
            matchllist.value = data.data ?? [];
        // machloading.value = true;
        // update();

      },
          (r) => print(r.message),
    );
  }


}
