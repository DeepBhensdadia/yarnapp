import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class FebricListControllers extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<FabricCostList> febriclist = <FabricCostList>[];
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
    }
    if (category != "[]" && category.isNotEmpty) {
      params += "&category=" + category;
    }
    if (atoz == true) {
      params += "&atoz=asc";
    } else if (date.isNotEmpty) {
      params += "&dateSort=" + date;
    } else if (price.isNotEmpty) {
      params += "&priceSort=" + price;
    }
    // Get.context!.loaderOverlay.show();
    // febriclistbool = false;
    await febricindexlist(para: params).then((value) {
      febriclist = value.fabricCostList ?? [];
      febriclistbool = true;
      update();
      // Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // Get.context!.loaderOverlay.hide();

      print("error...$error");
    });
  }
}
