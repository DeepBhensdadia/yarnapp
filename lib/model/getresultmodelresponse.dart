// To parse this JSON data, do
//
//     final getResultModel = getResultModelFromJson(jsonString);

import 'dart:convert';

GetResultModel getResultModelFromJson(String str) =>
    GetResultModel.fromJson(json.decode(str));

String getResultModelToJson(GetResultModel data) => json.encode(data.toJson());

class GetResultModel {
  bool? success;
  String? message;
  List<dynamic>? data;
  List<Warplist>? warplist;
  List<Weftlist>? weftlist;
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
        warplist: List<Warplist>.from(
            json["warplist"].map((x) => Warplist.fromJson(x))),
        weftlist: List<Weftlist>.from(
            json["weftlist"].map((x) => Weftlist.fromJson(x))),
        general: General.fromJson(json["general"]),
        calculation: List<Calculation>.from(
            json["calculation"].map((x) => Calculation.fromJson(x))),
        weightDetails: List<Calculation>.from(
            json["weightDetails"].map((x) => Calculation.fromJson(x))),
        otherDetails: List<Calculation>.from(
            json["otherDetails"].map((x) => Calculation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x)),
        "warplist": List<dynamic>.from(warplist!.map((x) => x.toJson())),
        "weftlist": List<dynamic>.from(weftlist!.map((x) => x.toJson())),
        "general": general?.toJson(),
        "calculation": List<dynamic>.from(calculation!.map((x) => x.toJson())),
        "weightDetails":
            List<dynamic>.from(weightDetails!.map((x) => x.toJson())),
        "otherDetails":
            List<dynamic>.from(otherDetails!.map((x) => x.toJson())),
      };
}

class Calculation {
  String? name;
  dynamic value;

  Calculation({
    this.name,
    this.value,
  });

  factory Calculation.fromJson(Map<String, dynamic> json) => Calculation(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class General {
  int? id;
  String? fabricName;
  String? photo;

  int? warpYarn;
  int? weftYarn;
  double? width;
  double? finalPpi;
  double? warpWastage;
  double? weftWastage;
  double? buttaCuttingCost;
  double? additionalCost;
  int? fabricCategoryId;
  int? userId;
  double? finalCostPerMeter;
  double? finalCostPerPiece;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? categoryName;

  General({
    this.id,
    this.fabricName,
    this.photo,
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
    this.finalCostPerMeter,
    this.finalCostPerPiece,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        id: json["id"],
        fabricName: json["fabric_name"],
        photo: json["photo"] ?? "",
        warpYarn: json["warp_yarn"],
        weftYarn: json["weft_yarn"],
        width: json["width"] != null ? json["width"].toDouble() : 0.00,
        finalPpi:
            json["final_ppi"] != null ? json["final_ppi"].toDouble() : 0.00,
        warpWastage: json["warp_wastage"] != null
            ? json["warp_wastage"].toDouble()
            : 0.00,
        weftWastage: json["weft_wastage"] != null
            ? json["weft_wastage"].toDouble()
            : 0.00,
        buttaCuttingCost: json["butta_cutting_cost"] != null
            ? json["butta_cutting_cost"].toDouble()
            : 0.00,
        additionalCost: json["additional_cost"] != null
            ? json["additional_cost"].toDouble()
            : 0.00,
        fabricCategoryId: json["fabric_category_id"],
        userId: json["user_id"],
        finalCostPerMeter: json["final_cost_per_meter"] != null
            ? json["final_cost_per_meter"].toDouble()
            : 0.00,
        finalCostPerPiece: json["final_cost_per_piece"] != null
            ? json["final_cost_per_piece"].toDouble()
            : 0.00,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fabric_name": fabricName,
        "photo": photo,
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
        "final_cost_per_meter": finalCostPerMeter,
        "final_cost_per_piece": finalCostPerPiece,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category_name": categoryName,
      };
}

class Warplist {
  int? id;
  int? fabricCostId;
  int? ends;
  int? tpmCost;
  String? yarnName;
  int? yarnId;
  int? yarnDenier;
  int? yarnRate;
  int? denier;
  double? weight;
  double? amount;
  dynamic tpm;

  Warplist({
    this.id,
    this.fabricCostId,
    this.ends,
    this.tpmCost,
    this.yarnName,
    this.yarnId,
    this.yarnDenier,
    this.yarnRate,
    this.denier,
    this.weight,
    this.amount,
    this.tpm,
  });

  factory Warplist.fromJson(Map<String, dynamic> json) => Warplist(
      id: json["id"],
      fabricCostId: json["fabric_cost_id"],
      ends: json["ends"],
      tpmCost: json["tpm_cost"] != null ? json["tpm_cost"] : 0,
      yarnName: json["yarn_name"],
      yarnId: json["yarn_id"],
      yarnDenier: json["yarn_denier"],
      yarnRate: json["yarn_rate"],
      denier: json["denier"],
      weight: json["weight"] != null ? json["weight"].toDouble() : 0.00,
      amount: json["amount"] != null ? json["amount"].toDouble() : 0.00,
      tpm: json["tpm"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "fabric_cost_id": fabricCostId,
        "ends": ends,
        "tpm_cost": tpmCost,
        "yarn_name": yarnName,
        "yarn_id": yarnId,
        "yarn_denier": yarnDenier,
        "yarn_rate": yarnRate,
        "denier": denier,
        "weight": weight,
        "amount": amount,
        "tpm": tpm,
      };
}

class Weftlist {
  int? id;
  int? fabricCostId;
  double? finalPpi;
  dynamic rowPpi;
  int? isAdvance;
  int? tpmCost;
  double? lenght;
  int? repeat;
  int? yarnDenier;
  int? yarnRate;
  String? yarnName;
  int? yarnId;
  double? weight;
  double? rate;
  double? ppi;
  dynamic tpm;

  Weftlist({
    this.id,
    this.fabricCostId,
    this.finalPpi,
    this.rowPpi,
    this.isAdvance,
    this.tpmCost,
    this.lenght,
    this.repeat,
    this.yarnDenier,
    this.yarnRate,
    this.yarnName,
    this.yarnId,
    this.weight,
    this.rate,
    this.ppi,
    this.tpm,
  });

  factory Weftlist.fromJson(Map<String, dynamic> json) => Weftlist(
        id: json["id"],
        fabricCostId: json["fabric_cost_id"],
        finalPpi:
            json["final_ppi"] != null ? json["final_ppi"].toDouble() : 0.00,
        rowPpi: json["row_ppi"],
        isAdvance: json["is_advance"],
        tpmCost: json["tpm_cost"] != null ? json["tpm_cost"] : 0,
        lenght: json["lenght"] != null ? json["lenght"].toDouble() : 0.00,
        repeat: json["repeat"],
        yarnDenier: json["yarn_denier"],
        yarnRate: json["yarn_rate"],
        yarnName: json["yarn_name"],
        yarnId: json["yarn_id"],
        weight: json["weight"] != null ? json["weight"].toDouble() : 0.00,
        rate: json["amount"] != null ? json["amount"].toDouble() : 0.00,
        ppi: json["ppi"] != null ? json["ppi"].toDouble() : 0.00,
        tpm: json["tpm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fabric_cost_id": fabricCostId,
        "final_ppi": finalPpi,
        "row_ppi": rowPpi,
        "is_advance": isAdvance,
        "tpm_cost": tpmCost,
        "lenght": lenght,
        "repeat": repeat,
        "yarn_denier": yarnDenier,
        "yarn_rate": yarnRate,
        "yarn_name": yarnName,
        "yarn_id": yarnId,
        "weight": weight,
        "amount": rate,
        "ppi": ppi,
        "tpm": tpm,
      };
}
