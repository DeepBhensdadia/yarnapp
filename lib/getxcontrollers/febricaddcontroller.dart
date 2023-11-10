import 'dart:convert';
import 'dart:developer';
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

class FebricAddController extends GetxController {
  bool editedt = false;
  List<WrapModel> wrapModel = <WrapModel>[];
  GetResultController resultController = Get.put(GetResultController());
  FebricListControllers febricsController = Get.put(FebricListControllers());

  List<int> wrapyarnids = <int>[];
  List<String> wrapyarntaar = <String>[];

  void goToResult(widget) {
    wrapyarnupdateid.clear();
    weftyarnupdateid.clear();
    if (isadddone) {
      resultController.result.warplist?.forEach((element) {
        wrapyarnupdateid.add(element.id ?? 0);
      });
      resultController.result.weftlist?.forEach((element) {
        weftyarnupdateid.add(element.id ?? 0);
      });
    }
    changedData();
    changedDataweft();
    !isadddone ? Addfebrickaro(widget) : updatefebrickaro(widget);
  }

  void changedData() {
    // weftModel.clear();
    wrapyarnids.clear();
    wrapyarntaar.clear();
    wrapModel.forEach((element) {
      wrapyarnids.add(element.selectedYarnID.value);
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
          selectedYarnID: 0.obs,
          key: UniqueKey(),
        ),
      );
    }
  }

  List<WeftModel> weftModel = <WeftModel>[];

  List<int> weftyarnids = [];
  List<String> weftppi = [];
  List<String> weftrepeat = [];

  bool isWrapDone = false;
  bool isWeftDone = false;
  bool isResultDone = false;
  bool isadddone = false;

  bool weftppitect = false;
  int currenttab = 0;

  void changedDataweft() {
    weftyarnids.clear();
    weftppi.clear();
    weftrepeat.clear();
    weftModel.forEach((element) {
      weftyarnids.add(element.selectedYarnID.value);
      weftppi.add(element.ppi);
      if (currenttab != 0) weftrepeat.add(element.repeat);
    });
    print(weftyarnids.toString());
    print(weftppi.toString());
    print(weftrepeat.toString());
  }

  void fillModelweftBasic() {
    int val = double.tryParse(numberOfWeftYarnController.text)?.toInt() ?? 0;
    for (int i = 0; i < val; i++) {
      weftModel.add(
        WeftModel(
          repeatController: TextEditingController(),
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
      TextEditingController(text: "0");

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
      "fabric_category_id": fabricCategoryController.text,
      "user_id": "${saveUser()?.id}",
      "yarn_id_warp": wrapyarnids,
      "ends": wrapyarntaar,
      "yarn_id_weft": weftyarnids,
      "ppi": weftppi,
    };
    if (currenttab == 1) {
      Map<String, dynamic> newEntries = {"repeat": weftrepeat, "is_advance": 1};
      parameter.addAll(newEntries);
    }

    await addfebricdetails(parameter: jsonEncode(parameter)).then((value) {
      if (value.success != false) {
        isResultDone = true;
        isadddone = true;
        febriccostid = value;
        getresult.getresultcall(id: value.fabaricCostId.toString());

        editedt = false;
        try {
          widget.page.jumpToPage(3);
        } catch (e, s) {
          print(s);
        }
        febricsController.getfebrics();
      }
      Get.context!.loaderOverlay.hide();
      FlutterToast.showCustomToast(value.message ?? "");
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
      // FlutterToast.showCustomToast("The Febric Name has already been taken.");
    });
  }

  List<int> wrapyarnupdateid = <int>[];
  List<int> weftyarnupdateid = <int>[];
  updatefebrickaro(widget) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      "fabric_cost_id": febriccostid.fabaricCostId,
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
        editedt = false;
        try {
          widget.page.jumpToPage(3);
        } catch (e) {
          print(e);
        }
      }
      febricsController.getfebrics();

      Get.context!.loaderOverlay.hide();

      FlutterToast.showCustomToast(value.message ?? "");
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      log(error.toString());
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
    required this.selectedYarnID,
    required this.key,
  });

  TextEditingController controller;
  Rx<int> selectedYarnID;
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
  Rx<int> selectedYarnID;
  Key key;

  String get ppi => ppiController.text.trim();
  String get repeat => repeatController.text.trim();

  void dispose() {
    ppiController.dispose();
    repeatController.dispose();
  }

  Map<String, dynamic> toJson() {
    return {
      "enteredppi": ppiController.text,
      "enteredrepet": repeatController.text,
      "yarnID": selectedYarnID,
    };
  }

  String toPrettyJson() => JsonEncoder.withIndent(" " * 4).convert(toJson());
}
