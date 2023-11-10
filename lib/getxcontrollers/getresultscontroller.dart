import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/getresultmodelresponse.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class GetResultController extends GetxController {
  late GetResultModel result;
  bool call = false;
  int resultcheck = 0;
  getresultcall({required String id}) async {
    resultcheck = 0;
    call = false;
    await getResultapi(id: id).then((value) {
      resultcheck = 1;
      call = true;
      result = value;
      update();
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      resultcheck = 2;
      Get.context!.loaderOverlay.hide();
      print("error...$error");
    });
  }
}
