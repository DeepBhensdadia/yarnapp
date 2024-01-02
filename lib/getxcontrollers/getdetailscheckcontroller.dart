import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/packagecontroller.dart';
import 'package:yarn_modified/model/getdetailscheckmodel.dart';
import 'package:yarn_modified/screens/auth-section/login-screen.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';

class GetDetailsCheck extends GetxController {
  PackageController packagelist = Get.put(PackageController());


  Getdetailscheckresponse? getdetails;
  RxBool exprired = false.obs;

  getdetailscheckcall({required String id}) async {
    await getDetailsChecktapi(deviceid: id).then((value) {
    getdetails = value;
      if (value.name!.isEmpty) {
        FlutterToast.showCustomToast(value.message ?? "");
        SharedPref.deleteAll();
        Get.deleteAll(force: true);
        Get.offAll(LoginScreen());
      }
      if(value.isExpired == 0)
        exprired.value = value.isExpired == 0 ? true : false;
      // else if (value.isExpired == 0) {
      //   FlutterToast.showCustomToast(value.message ?? "");
      //   // SharedPref.deleteAll();
      //   // Get.deleteAll(force: true);
      //   packagelist.PackagelistgetAPI2();
      // }
    }).onError((error, stackTrace) {
      print("error...$error");
    });
  }

  void getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      String deviceId = androidInfo.androidId;
      print('Device ID: $deviceId');
      getdetailscheckcall(id: deviceId);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      String deviceId = iosInfo.identifierForVendor;
      print('Device ID: $deviceId');
      getdetailscheckcall(id: deviceId);
    }
  }

}
