import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/screens/root-app.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  registerlogin() async {
    Get.context!.loaderOverlay.show();
    String params = jsonEncode({
      "name": nameController.text,
      "email": emailController.text,
      "mobile_number": mobileController.text
    });
    await Registration(parameter: params).then((value) {
      if (value.success != false) {
        SharedPref.save(
            value: jsonEncode(value.data?.toJson()),
            prefKey: PrefKey.loginDetails);
        Get.offAll(RootApp());
      }
      Get.context!.loaderOverlay.hide();

      FlutterToast.showCustomToast(value.message ?? "");
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print("errror....$error");
    });
  }
}
