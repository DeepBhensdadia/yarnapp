import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/febricslistcontroller.dart';
import 'package:yarn_modified/getxcontrollers/getresultscontroller.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';
import '../model/addfebricresponsemodel.dart';
import '../services/all_api_services.dart';

class FebricEditController extends GetxController {
  bool editedt = false;
  //
  List<WrapModel> wrapModel = <WrapModel>[];

  List<int> wrapyarnids = <int>[];
  List<String> wrapyarntaar = <String>[];
  List<String> wraptpm = <String>[];

  void goToResult(widget) {
    editedt = false;
    changedData();
    changedDataweft();
    print("wrapids${wrapyarnupdateid}");
    print("weftids${weftyarnupdateid}");
    updatefebrickaro(widget);
  }

  void changedData() {
    wraptpm.clear();
    wrapyarnids.clear();
    wrapyarntaar.clear();
    wrapyarntaar.clear();
    wrapModel.forEach((element) {
      wrapyarnids.add(element.selectedYarnID.value);
      wrapyarntaar.add(element.taar);
      wraptpm.add(element.tpm != "" ? element.tpm : "0");
    });
    print("wrap yarn id ${wrapyarnids}");
    print("wrap yarn taar ${wrapyarntaar}");
    print("wrap yarn taar ${wraptpm}");
  }

  void fillModel() {
    int val = double.tryParse(numberOfWarpYarnController.text)?.toInt() ?? 0;
    for (int i = 0; i < val; i++) {
      wrapModel.add(
        WrapModel(
          controller2: TextEditingController(),
          controller: TextEditingController(),
          selectedYarnID: 0.obs,
          key: UniqueKey(),
        ),
      );
    }
  }

  List<WeftModel> weftModel = <WeftModel>[];

  List<int> weftyarnids = [];
  List<String> weftppi = [];
  List<String> wefttpm = [];
  List<String> weftrepeat = [];

  bool isWrapDone = false;
  bool isWeftDone = false;
  bool isResultDone = false;
  bool isadddone = false;

  void changedDataweft() {
    weftyarnids.clear();
    weftppi.clear();
    wefttpm.clear();
    weftrepeat.clear();
    weftModel.forEach((element) {
      weftyarnids.add(element.selectedYarnID.value);
      weftppi.add(element.ppi);
      wefttpm.add(element.tpm != "" ? element.tpm : "0");
      if (currenttab != 0) weftrepeat.add(element.repeat);
    });
    print("weft yarn ids ${weftyarnids}");
    print("weft yarn ppi ${weftppi}");
    print("weft yarn ppi ${wefttpm}");
  }

  void fillModelweftBasic() {
    int val = double.tryParse(numberOfWeftYarnController.text)?.toInt() ?? 0;
    for (int i = 0; i < val; i++) {
      weftModel.add(
        WeftModel(
          repeatController: TextEditingController(),
          tpmController: TextEditingController(),
          ppiController: TextEditingController(),
          selectedYarnID: 0.obs,
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

  late AddfebricresponseModel febriccostid;

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
      TextEditingController(text: "29");

  List<int> wrapyarnupdateid = <int>[];
  List<int> weftyarnupdateid = <int>[];

  bool weftppitect = false;
  int currenttab = 0;

  FebricListControllers febricsController = Get.put(FebricListControllers());

  updatefebrickaro(widget) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      "fabric_cost_id": widget.general?.general?.id,
      "fabric_name": nameController.text,
      "warp_yarn": numberOfWarpYarnController.text,
      "weft_yarn": numberOfWeftYarnController.text,
      "width": widthInInchController.text,
      "final_ppi": costPerFinalController.text,
      "warp_wastage": warpAmountController.text,
      "weft_wastage": weftAmountController.text,
      "butta_cutting_cost": buttaCuttingController.text,
      "additional_cost": additionalCostController.text,
      "fabric_category_id": fabricCategoryController.text,
      "user_id": "${saveUser()?.id}",
      "warp_id": wrapyarnupdateid,
      "weft_id": weftyarnupdateid,
      "yarn_id_warp": wrapyarnids,
      "tpm_cost_warp": wraptpm,
      "tpm_cost_weft":wefttpm,
      "ends": wrapyarntaar,
      "yarn_id_weft": weftyarnids,
      "ppi": weftppi
    };
    if (currenttab == 1) {
      Map<String, dynamic> newEntries = {"repeat": weftrepeat, "is_advance": 1};
      parameter.addAll(newEntries);
    }

    await addfebricdetails(parameter: jsonEncode(parameter)).then((value) {
      if (value.success != false) {
        getresult.getresultcall(id: value.fabaricCostId.toString());
      } else {
        widget.page.jumpToPage(2);
      }
      febricsController.getfebrics(key: febricsController.searchController.text);
      FlutterToast.showCustomToast(value.message ?? "");
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
      FlutterToast.showCustomToast("Something Wrong..");
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
    required this.controller2,
    required this.selectedYarnID,
    required this.key,
  });

  TextEditingController controller;
  TextEditingController controller2;
  FocusNode focusNode = FocusNode();
  Rx<int> selectedYarnID;
  Key key;

  String get taar => controller.text.trim();
  String get tpm => controller2.text.trim();

  void dispose() {
    controller.dispose();
    controller2.dispose();
  }


  Map<String, dynamic> toJson() {
    return {
      "enteredTaar": controller.text,
      "enteredtpm": controller2.text,
      "yarnID": selectedYarnID,
    };
  }

  String toPrettyJson() => JsonEncoder.withIndent(" " * 4).convert(toJson());
}

class WeftModel {
  WeftModel({
    required this.repeatController,
    required this.ppiController,
    required this.tpmController,
    required this.selectedYarnID,
    required this.key,
  });

  TextEditingController repeatController;
  TextEditingController ppiController;
  TextEditingController tpmController;
  FocusNode focusNode = FocusNode();
  Rx<int> selectedYarnID;
  Key key;

  String get ppi => ppiController.text.trim();
  String get tpm => tpmController.text.trim();
  String get repeat => repeatController.text.trim();

  void dispose() {
    ppiController.dispose();
    tpmController.dispose();
    repeatController.dispose();
  }

  Map<String, dynamic> toJson() {
    return {
      "enteredppi": ppiController.text,
      "enteredtpm": tpmController.text,
      "enteredrepet": repeatController.text,
      "yarnID": selectedYarnID,
    };
  }

  String toPrettyJson() => JsonEncoder.withIndent(" " * 4).convert(toJson());
}
