import 'dart:convert';

AddfebricresponseModel addfebricresponseModelFromJson(String str) => AddfebricresponseModel.fromJson(json.decode(str));

String addfebricresponseModelToJson(AddfebricresponseModel data) => json.encode(data.toJson());

class AddfebricresponseModel {
  bool? success;
  String? message;
  int? fabaricCostId;

  AddfebricresponseModel({
    this.success,
    this.message,
    this.fabaricCostId,
  });

  factory AddfebricresponseModel.fromJson(Map<String, dynamic> json) => AddfebricresponseModel(
    success: json["success"],
    message: json["message"],
    fabaricCostId: json["fabaric_cost_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "fabaric_cost_id": fabaricCostId,
  };
}
