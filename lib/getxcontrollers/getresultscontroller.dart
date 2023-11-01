import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/getresultmodelresponse.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class GetResultController extends GetxController {
  late GetResultModel result;
  bool call = false;
  getresultcall({required String id}) async {
    call = false;
    await getResultapi(id: id).then((value) {
      call = true;
      result = value;
      update();
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print("error...$error");
    });
  }
}
