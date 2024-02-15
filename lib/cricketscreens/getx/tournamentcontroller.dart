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
import '../model/gettournamenttype.dart';
import '../model/tournamentlist.dart';
import '../services/cricket_api.dart';

class TournamentController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  List<Datum> gettype = [];
  RxBool tournamenttypebool = false.obs;

  Future<void> getTournamenttypeDataFromAPI() async {
    // febricbool = false;
    await gettournamenttypelist().then((value) {
      gettype = value.data ?? [];
      tournamenttypebool.value = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  List<Tournamentdetails> getData = [];
  bool tournamentbool = false;

  Future<void> getTournamentDataFromAPI() async {
    // febricbool = false;
    await gettournamentlistapi().then((value) {
      getData = value.data ?? [];
      tournamentbool = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController tournamnettype = TextEditingController();


  Future<void> AddTournamentFromAPI({File? logo}) async {
    Map<String, dynamic> formFields = {
      'tournament_name': name.text,
      'location': location.text,
      'address': adress.text,
      'tournament_type_id': tournamnettype.text,
      'description': description.text
    };
    // if (logo != null) {
    //   formFields['logo'] = await MultipartFile.fromFile(logo.path, filename: 'imageFileName.jpg');
    // }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}create_tournament",
    );
    response.fold(
      (l) {
        var data = getTournamentlistFromJson(l.toString());
        print(jsonEncode(data));
        getTournamentDataFromAPI();
        name.clear();
        location.clear();
        adress.clear();
        description.clear();
        tournamnettype.clear();
        Get.back();
      },
      (r) => print(r.message),
    );
  }
}
