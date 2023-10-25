// To parse this JSON data, do
//
//     final getResultModel = getResultModelFromJson(jsonString);

import 'dart:convert';

GetResultModel getResultModelFromJson(String str) => GetResultModel.fromJson(json.decode(str));

String getResultModelToJson(GetResultModel data) => json.encode(data.toJson());

class GetResultModel {
  bool? success;
  String? message;
  List<dynamic>? data;
  List<WarplistElement>? warplist;
  List<WarplistElement>? weftlist;
  General? general;
  List<Calculation>? calculation;
  List<Calculation>? weightDetails;
  List<Calculation>? otherDetails;

  GetResultModel({
    this.success,
    this.message,
    this.data,
    this.warplist,
    this.weftlist,
    this.general,
    this.calculation,
    this.weightDetails,
    this.otherDetails,
  });

  factory GetResultModel.fromJson(Map<String, dynamic> json) => GetResultModel(
    success: json["success"],
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    warplist: List<WarplistElement>.from(json["warplist"].map((x) => WarplistElement.fromJson(x))),
    weftlist: List<WarplistElement>.from(json["weftlist"].map((x) => WarplistElement.fromJson(x))),
    general: General.fromJson(json["general"]),
    calculation: List<Calculation>.from(json["calculation"].map((x) => Calculation.fromJson(x))),
    weightDetails: List<Calculation>.from(json["weightDetails"].map((x) => Calculation.fromJson(x))),
    otherDetails: List<Calculation>.from(json["otherDetails"].map((x) => Calculation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x)),
    "warplist": List<dynamic>.from(warplist!.map((x) => x.toJson())),
    "weftlist": List<dynamic>.from(weftlist!.map((x) => x.toJson())),
    "general": general?.toJson(),
    "calculation": List<dynamic>.from(calculation!.map((x) => x.toJson())),
    "weightDetails": List<dynamic>.from(weightDetails!.map((x) => x.toJson())),
    "otherDetails": List<dynamic>.from(otherDetails!.map((x) => x.toJson())),
  };
}

class Calculation {
  String? name;
  double? value;

  Calculation({
    this.name,
    this.value,
  });

  factory Calculation.fromJson(Map<String, dynamic> json) => Calculation(
    name: json["name"],
    value: json["value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}

class General {
  int? id;
  String? fabricName;
  dynamic warpYarn;
  dynamic weftYarn;
  dynamic width;
  dynamic finalPpi;
  dynamic warpWastage;
  dynamic weftWastage;
  dynamic buttaCuttingCost;
  dynamic additionalCost;
  dynamic fabricCategoryId;
  dynamic userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  General({
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
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
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
  };
}

class WarplistElement {
  int? id;
  dynamic fabricCostId;
  String? yarnName;
  dynamic ends;
  dynamic weight;
  dynamic rate;
  double? amount;
  dynamic denier;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic yarnId;
  dynamic finalPpi;

  WarplistElement({
    this.id,
    this.fabricCostId,
    this.yarnName,
    this.ends,
    this.weight,
    this.rate,
    this.amount,
    this.denier,
    this.createdAt,
    this.updatedAt,
    this.yarnId,
    this.finalPpi,
  });

  factory WarplistElement.fromJson(Map<String, dynamic> json) => WarplistElement(
    id: json["id"],
    fabricCostId: json["fabric_cost_id"],
    yarnName: json["yarn_name"],
    ends: json["ends"],
    weight: json["weight"],
    rate: json["rate"],
    amount: json["amount"].toDouble(),
    denier: json["denier"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    yarnId: json["yarn_id"],
    finalPpi: json["final_ppi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fabric_cost_id": fabricCostId,
    "yarn_name": yarnName,
    "ends": ends,
    "weight": weight,
    "rate": rate,
    "amount": amount,
    "denier": denier,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "yarn_id": yarnId,
    "final_ppi": finalPpi,
  };
}
