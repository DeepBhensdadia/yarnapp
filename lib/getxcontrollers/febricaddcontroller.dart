import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/getresultscontroller.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import '../services/all_api_services.dart';

class FebricAddController extends GetxController {
  //
  List<WrapModel> wrapModel = <WrapModel>[];

  List<int> wrapyarnids = <int>[];
  List<String> wrapyarntaar = <String>[];

  void changedData() {
    wrapyarnids.clear();
    wrapyarntaar.clear();
    wrapModel.forEach((element) {
      wrapyarnids.add(element.selectedYarnID);
      wrapyarntaar.add(element.taar);
    });
    print(wrapyarnids.toString());
    print(wrapyarntaar.toString());
  }

  void fillModel() {
    int val = double.tryParse(numberOfWarpYarnController.text)?.toInt() ?? 0;
    for (int i = 0; i < val; i++) {
      wrapModel.add(
        WrapModel(
          controller: TextEditingController(),
          selectedYarnID: 0,
          key: UniqueKey(),
        ),
      );
    }
  }
  List<WeftModel> weftModel = <WeftModel>[];

  List<int> weftyarnids = [];
  List<String> weftppi = [];

  void changedDataweft() {
    weftyarnids.clear();
    weftppi.clear();
    weftModel.forEach((element) {
      weftyarnids.add(element.selectedYarnID);
      weftppi.add(element.ppi);
    });
    print(weftyarnids.toString());
    print(weftppi.toString());
  }

  void fillModelweftBasic() {
    int val = double.tryParse(numberOfWeftYarnController.text)?.toInt() ?? 0;
    for (int i = 0; i < val; i++) {
      weftModel.add(
        WeftModel(
          repeatController: TextEditingController(),
          ppiController: TextEditingController(),
          selectedYarnID: 0,
          key: UniqueKey(),
        ),
      );
    }
  }




  @override
  void dispose() {
    super.dispose();
    wrapModel.forEach((element) {
      element.dispose();
    });
    weftModel.forEach((element) {
      element.dispose();
    });
  } //


  List<yarnIndexDatum?> yarnData = [];

  Future<void> fetchDataFromAPI(
      {required String key, String price = "", String date = ""}) async {
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
      // print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }


  List<fabricCategoryDatum?> yarncategoryData = [];
bool categorybool = false;
  Future<void> yarncategorydatafetch() async {
    categorybool = false;
    await fabricCategoryData().then((value) {
      categorybool = true;
      yarncategoryData = value.data;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  RxInt wrap = 0.obs;
  RxInt category = 0.obs;
  GetResultController getresult = Get.put(GetResultController());
  TextEditingController nameController = TextEditingController();
  TextEditingController numberOfWarpYarnController = TextEditingController();
  TextEditingController numberOfWeftYarnController = TextEditingController();
  TextEditingController widthInInchController = TextEditingController();
  TextEditingController costPerFinalController = TextEditingController();
  TextEditingController warpAmountController = TextEditingController();
  TextEditingController weftAmountController = TextEditingController();
  TextEditingController buttaCuttingController = TextEditingController();
  TextEditingController additionalCostController = TextEditingController();
  TextEditingController fabricCategoryController =
      TextEditingController(text: "2");

  Addfebrickaro(widget) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      "fabric_name": nameController.text,
      "warp_yarn": numberOfWarpYarnController.text,
      "weft_yarn": numberOfWeftYarnController.text,
      "width": widthInInchController.text,
      "final_ppi": costPerFinalController.text,
      "warp_wastage": warpAmountController.text,
      "weft_wastage": weftAmountController.text,
      "butta_cutting_cost": buttaCuttingController.text,
      "additional_cost": additionalCostController.text,
      "fabric_category_id": "2",
      "user_id": "10",
      "warp_id": wrapyarnids,
      "ends": wrapyarntaar,
      "weft_id": weftyarnids,
      "ppi": weftppi
    };

    await addfebricdetails(parameter: jsonEncode(parameter)).then((value) {
      FlutterToast.showCustomToast(value.message ?? "");
      widget.page.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease);
      getresult.getresultcall(id: value.fabaricCostId.toString());
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }

  void clearall() {
    wrapModel.forEach((element) => element.dispose());
    wrapModel.clear();
    weftModel.forEach((element) => element.dispose());
    weftModel.clear();
    nameController.clear();
    numberOfWarpYarnController.clear();
    numberOfWeftYarnController.clear();
    widthInInchController.clear();
    costPerFinalController.clear();
    warpAmountController.clear();
    weftAmountController.clear();
    buttaCuttingController.clear();
    additionalCostController.clear();
    fabricCategoryController.clear();

    wrapyarnids.clear();
    wrapyarntaar.clear();
  }
}

class WrapModel {
  WrapModel({
    required this.controller,
    required this.selectedYarnID,
    required this.key,
  });

  TextEditingController controller;
  int selectedYarnID;
  Key key;

  String get taar => controller.text.trim();

  void dispose() => controller.dispose();

  Map<String, dynamic> toJson() {
    return {
      "enteredTaar": controller.text,
      "yarnID": selectedYarnID,
    };
  }

  String toPrettyJson() => JsonEncoder.withIndent(" " * 4).convert(toJson());
}

class WeftModel {
  WeftModel({
    required this.repeatController,
    required this.ppiController,
    required this.selectedYarnID,
    required this.key,
  });

  TextEditingController repeatController;
  TextEditingController ppiController;
  int selectedYarnID;
  Key key;

  String get ppi => ppiController.text.trim();

  void dispose() => ppiController.dispose();

  Map<String, dynamic> toJson() {
    return {
      "enteredppi": ppiController.text,
      "yarnID": selectedYarnID,
    };
  }

  String toPrettyJson() => JsonEncoder.withIndent(" " * 4).convert(toJson());
}
