import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as gets;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/febricslistcontroller.dart';
import 'package:yarn_modified/getxcontrollers/getresultscontroller.dart';
import 'package:yarn_modified/model/deletion-model.dart';
import 'package:yarn_modified/services/app_url.dart';

import '../services/all_api_services.dart';
// import 'package:get/get.dart';

class UploadPhoto extends GetxController {
  Future<void> uploadphotoapi(
      {required File photo, required String fabricid}) async {
    try {
      Get.context!.loaderOverlay.show();

      var apiUrl = URLs.Base_url + "uploadPhoto";

      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        'id': fabricid,
        'photo':
            await MultipartFile.fromFile(photo.path, filename: 'image.jpg'),
      });

      Response response = await dio.post(
        apiUrl,
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );
      // DeletionModel  data12 = deletionModelFromJson(response.data);
      if (response.statusCode == 200) {
        // FlutterToast.showCustomToast(data12.message);
        Get.back();
        Get.put(GetResultController()).getresultcall(id: fabricid);
        Get.put(FebricListControllers()).getfebrics();
        Get.context!.loaderOverlay.hide();
      } else {
        Get.context!.loaderOverlay.hide();
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      print('Error uploading image: $e');
    }
  }

  Future<void> deletephotoapi({required String fabricid}) async {
    Get.context!.loaderOverlay.show();
    await deleteFabricimage(id: fabricid)
        .then((value) {
      Get.back();
      Get.put(GetResultController()).getresultcall(id: fabricid);
      Get.put(FebricListControllers()).getfebrics();
      Get.context!.loaderOverlay.hide();
update();
    })
        .onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
}
