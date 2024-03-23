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
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:yarn_modified/cricketscreens/services/api_source.dart';

import '../../const/const.dart';
import '../../services/all_api_services.dart';
import '../../services/app_url.dart';
import '../model/gettournamenttype.dart';
import '../model/tournamentlist.dart';
import '../model/updateresponse.dart';
import '../services/cricket_api.dart';

class TournamentController extends GetxController {
  WebService webService = WebService(dio: Dio(), connectivity: Connectivity());

  List<Datum> gettype = [];
  RxBool tournamenttypebool = false.obs;

  Future<void> getTournamenttypeDataFromAPI() async {
    Get.context!.loaderOverlay.show();

    // febricbool = false;
    await gettournamenttypelist().then((value) {
      gettype = value.data ?? [];
      tournamenttypebool.value = true;
      update();
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

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
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController Organizedname = TextEditingController();
  TextEditingController balltype = TextEditingController();
  TextEditingController crickettype = TextEditingController();

  Future<void> AddTournamentFromAPI({File? logo, ints}) async {
    String startmatchdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(startdate.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    print(startmatchdateformat());
    String endmatchdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(enddate.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    print(endmatchdateformat());

    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'tournament_name': name.text,
      'location': location.text,
      'address': adress.text,
      'created_by': saveUser()?.id,
      'description': description.text,
      'strat_date': startmatchdateformat(),
      'end_date': endmatchdateformat(),
      "organization_name": Organizedname.text,
      "ball_type": balltype.text,
      "cricket_type": crickettype.text,
      'status': ints
    };

    if (logo != null) {
      formFields['logo'] = await MultipartFile.fromFile(logo.path,
          filename: 'imageFileName.jpg');
    }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}create_tournament",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        print(jsonEncode(data));
        getTournamentDataFromAPI();
        name.clear();
        location.clear();
        adress.clear();
        description.clear();
        Organizedname.clear();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> EditTournamentFromAPI(
      {File? logo, required String id, ints}) async {
    String startmatchdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(startdate.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    print(startmatchdateformat());
    String endmatchdateformat() {
      DateTime originalDate = DateFormat("dd-MM-yyyy").parse(enddate.text);
      return DateFormat("yyyy-MM-dd").format(originalDate);
    }

    print(endmatchdateformat());
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {
      'tournament_name': name.text,
      'location': location.text,
      'address': adress.text,
      'created_by': saveUser()?.id,
      'description': description.text,
      "organization_name": Organizedname.text,
      'strat_date': startmatchdateformat(),
      'end_date': endmatchdateformat(),
      "ball_type": balltype.text,
      "cricket_type": crickettype.text,
      'status': ints
    };
    if (logo != null) {
      formFields['logo'] = await MultipartFile.fromFile(logo.path,
          filename: 'imageFileName.jpg');
    }
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}update_tournament/$id",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        // print(jsonEncode(data));
        getTournamentDataFromAPI();
        name.clear();
        location.clear();
        adress.clear();
        description.clear();
        Organizedname.clear();
        Get.back();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }

  Future<void> DeleteTournamentFromAPI({required String id}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> formFields = {'tournament_id': id, 'is_delete': '0'};
    List<MapEntry<String, dynamic>> formDataList = formFields.entries.toList();
    FormData formData = FormData.fromMap(Map.fromEntries(formDataList));

    final response = await webService.postFormRequest(
      formData: formData,
      url: "${URLs.Base_url}tournament_delete",
    );
    response.fold(
      (l) {
        Updateresponse data = updateresponseFromJson(l.toString());
        FlutterToast.showCustomToast(data.message ?? '');
        Get.back();
        // print(jsonEncode(data));
        getTournamentDataFromAPI();
        Get.context!.loaderOverlay.hide();
      },
      (r) {
        Get.context!.loaderOverlay.hide();
        print(r.message);
      },
    );
  }
}
