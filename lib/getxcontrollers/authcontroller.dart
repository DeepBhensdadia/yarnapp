import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
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
  TextEditingController businessnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId; // Using Android ID as an example
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo
          .identifierForVendor; // Using Identifier for Vendor as an example
    }
    return '';
  }

  registerlogin() async {
    String deviceId = await getDeviceId();
    Get.context!.loaderOverlay.show();
    String params = jsonEncode({
      "name": nameController.text,
      "email": emailController.text,
      "mobile_number": mobileController.text,
      "company_name": businessnameController.text,
      "city": locationController.text,
      "device_id": deviceId,
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
