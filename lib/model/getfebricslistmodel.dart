// To parse this JSON data, do
//
//     final getFebricsModel = getFebricsModelFromJson(jsonString);

import 'dart:convert';

GetFebricsModel getFebricsModelFromJson(String str) => GetFebricsModel.fromJson(json.decode(str));

String getFebricsModelToJson(GetFebricsModel data) => json.encode(data.toJson());

class GetFebricsModel {
  bool? success;
  String? message;
  List<FabricCostList>? fabricCostList;

  GetFebricsModel({
    this.success,
    this.message,
    this.fabricCostList,
  });

  factory GetFebricsModel.fromJson(Map<String, dynamic> json) => GetFebricsModel(
    success: json["success"],
    message: json["message"],
    fabricCostList: List<FabricCostList>.from(json["fabric_cost_list"].map((x) => FabricCostList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "fabric_cost_list": List<dynamic>.from(fabricCostList!.map((x) => x.toJson())),
  };
}

class FabricCostList {
  int? id;
  String? fabricName;
  int? warpYarn;
  int? weftYarn;
  int? width;
  int? finalPpi;
  int? warpWastage;
  int? weftWastage;
  int? buttaCuttingCost;
  int? additionalCost;
  int? fabricCategoryId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? categoryName;

  FabricCostList({
    this.id,
    this.fabricName,
    this.warpYarn,
    this.weftYarn,
    this.width,
    this.finalPpi,
    this.warpWastage,
    this.weftWastage,
    this.buttaCuttingCost,
    this.additionalCost,
    this.fabricCategoryId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
  });

  factory FabricCostList.fromJson(Map<String, dynamic> json) => FabricCostList(
    id: json["id"],
    fabricName: json["fabric_name"],
    warpYarn: json["warp_yarn"],
    weftYarn: json["weft_yarn"],
    width: json["width"],
    finalPpi: json["final_ppi"],
    warpWastage: json["warp_wastage"],
    weftWastage: json["weft_wastage"],
    buttaCuttingCost: json["butta_cutting_cost"],
    additionalCost: json["additional_cost"],
    fabricCategoryId: json["fabric_category_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fabric_name": fabricName,
    "warp_yarn": warpYarn,
    "weft_yarn": weftYarn,
    "width": width,
    "final_ppi": finalPpi,
    "warp_wastage": warpWastage,
    "weft_wastage": weftWastage,
    "butta_cutting_cost": buttaCuttingCost,
    "additional_cost": additionalCost,
    "fabric_category_id": fabricCategoryId,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category_name": categoryName,
  };
}
