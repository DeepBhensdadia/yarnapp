import 'package:get/get.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class YarnListController extends GetxController {
  List<yarnIndexDatum?> yarnData = [];
  bool yarnlistbool = false;

  Future<void> fetchDataFromAPI(
      {required String key,
      bool atoz = false,
      String price = "",
      String date = "",
      String category = ""}) async {
    var params = "";

    if (key.isNotEmpty) {
      params += "&search=" + key;
    }
    if (price.isNotEmpty) {
      params += "&priceSort=" + price;
    }
    if (date.isNotEmpty) {
      params += "&dateSort=" + date;
    }
    if (category.isNotEmpty) {
      if (category != "[]") params += "&category=" + category;
    }
    if (atoz == true) {
      params += "&atoz=asc";
    }

    await yarnIndexData(keyword: params).then((value) {
      yarnData = value.data;
      yarnlistbool = true;
      update();
      // print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
