import 'package:get/get.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class YarnListController extends GetxController{

  List<yarnIndexDatum?> yarnData = [];
  bool yarnlistbool = false;

  Future<void> fetchDataFromAPI(
      {required String key, String price = "",String date = ""}) async {

    var params = "";

    if (key.isNotEmpty) {
      params += "&search=" + key;
    } else if (price.isNotEmpty) {
      params += "&priceSort=" + price;
    } else if (price.isNotEmpty) {
      params += "&dateSort=" + date;
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