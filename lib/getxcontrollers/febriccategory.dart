import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class FebricCategoryController extends GetxController {
  List<fabricCategoryDatum?> getData = [];
  bool febricbool = false;
  Future<void> fetchDataFromAPI() async {
    febricbool = false;
    await fabricCategoryData().then((value) {
      getData = value.data;
      febricbool = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
