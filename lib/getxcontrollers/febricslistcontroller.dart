import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class FebricListControllers extends GetxController {
  late GetFebricsModel febriclist;
  bool febriclistbool = false;
  getfebrics(
      {String key = "",
      bool atoz = false,
      String price = "",
      String date = "",
      String category = ""}) async {
    var params = "";

    if (key.isNotEmpty) {
      params += "&search=" + key;
    } else if (price.isNotEmpty) {
      params += "&priceSort=" + price;
    } else if (date.isNotEmpty) {
      params += "&dateSort=" + date;
    } else if (category.isNotEmpty) {
      params += "&category=" + category;
    } else if (atoz == true) {
      params += "&atoz=asc";
    }
    // Get.context!.loaderOverlay.show();
    febriclistbool = false;
    await febricindexlist(para: params).then((value) {
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
