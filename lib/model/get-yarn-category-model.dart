import 'dart:convert';

YarnCategoryModel yarnCategoryModelFromJson(String str) => YarnCategoryModel.fromJson(json.decode(str));

String yarnCategoryModelToJson(YarnCategoryModel data) => json.encode(data.toJson());

class YarnCategoryModel {
  bool success;
  String message;
  List<yarnCategoryDatum?> data;

  YarnCategoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory YarnCategoryModel.fromJson(Map<String, dynamic> json) => YarnCategoryModel(
    success: json["success"],
    message: json["message"],
    data:json["data"] == null ? [] : List<yarnCategoryDatum?>.from(json["data"].map((x) => yarnCategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x?.toJson())),
  };
}

class yarnCategoryDatum {
  int id;
  String yarnCategory;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  yarnCategoryDatum({
    required this.id,
    required this.yarnCategory,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory yarnCategoryDatum.fromJson(Map<String, dynamic> json) => yarnCategoryDatum(
    id: json["id"],
    yarnCategory: json["yarn_category"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "yarn_category": yarnCategory,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
