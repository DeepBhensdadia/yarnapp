import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';

class UpdateUserController extends GetxController {
  updatemobilenumberpost({required String mobilenumber}) {
    Get.context!.loaderOverlay.show();
    String para = jsonEncode(
        {"id": saveUser()?.id.toString() ?? "", "mobile_number": mobilenumber});

    UpdatePhonenumber(parameter: para).then((value) {
      if (value.success != false) {
        SharedPref.deleteSpecific(prefKey: PrefKey.loginDetails);
        SharedPref.save(
            value: jsonEncode(value.toJson()), prefKey: PrefKey.loginDetails);
        Get.back();
        Get.back();
        Get.back();
      }
      Fluttertoast.showToast(msg: value.message ?? "");
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print("object....$error");
    });
  }

  updateuserpost({
    required String name,
    required String email,
    required String companyname,
    required String city,
  }) {
    Get.context!.loaderOverlay.show();
    String para = jsonEncode({
      "id": "${saveUser()?.id.toString()}",
      "name": name,
      "email": email,
      "company_name": companyname,
      "city": city
    });

    Updateuserprofile(parameter: para).then((value) {
      if (value.success != false) {
        SharedPref.deleteSpecific(prefKey: PrefKey.loginDetails);
        SharedPref.save(
            value: jsonEncode(value.toJson()), prefKey: PrefKey.loginDetails);
        Get.back();
      }
      Fluttertoast.showToast(msg: value.message ?? "");
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print("object....$error");
    });
  }
}
