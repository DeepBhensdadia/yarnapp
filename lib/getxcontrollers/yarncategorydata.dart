import 'package:get/get.dart';
import 'package:yarn_modified/model/get-yarn-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class YarnCategoryController extends GetxController {
  bool yarncategorybool = false;

  List<yarnCategoryDatum?> getData = [];

  Future<void> fetchDataFromAPI() async {
    yarncategorybool = false;
    await yarnCategoryData().then((value) {
      getData = value.data;
      yarncategorybool = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  String categoryid = "53";
}
