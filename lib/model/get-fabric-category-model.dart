import 'dart:convert';

FabricCategoryModel fabricCategoryModelFromJson(String str) => FabricCategoryModel.fromJson(json.decode(str));

String fabricCategoryModelToJson(FabricCategoryModel data) => json.encode(data.toJson());

class FabricCategoryModel {
  bool success;
  String message;
  List<fabricCategoryDatum?> data;

  FabricCategoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FabricCategoryModel.fromJson(Map<String, dynamic> json) => FabricCategoryModel(
    success: json["success"],
    message: json["message"],
    data: List<fabricCategoryDatum?>.from(json["data"].map((x) => fabricCategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x?.toJson())),
  };
}

class fabricCategoryDatum {
  int id;
  String fabricCategory;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  fabricCategoryDatum({
    required this.id,
    required this.fabricCategory,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory fabricCategoryDatum.fromJson(Map<String, dynamic> json) => fabricCategoryDatum(
    id: json["id"],
    fabricCategory: json["fabric_category"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fabric_category": fabricCategory,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
