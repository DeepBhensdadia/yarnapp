import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class FebricListControllers extends GetxController{

  late GetFebricsModel febriclist;
  bool febriclistbool = false;
  getfebrics() async {
    // Get.context!.loaderOverlay.show();
     febriclistbool = false;
    await febricindexlist().then((value) {
    febriclist = value;
    febriclistbool = true;
    update();
    // Get.context!.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      // Get.context!.loaderOverlay.hide();

      print("error...$error");
  });

  }
}