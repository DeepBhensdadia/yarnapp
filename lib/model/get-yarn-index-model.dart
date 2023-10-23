import 'dart:convert';

YarnIndexModel yarnIndexModelFromJson(String str) => YarnIndexModel.fromJson(json.decode(str));

String yarnIndexModelToJson(YarnIndexModel data) => json.encode(data.toJson());

class YarnIndexModel {
  bool success;
  String message;
  List<yarnIndexDatum?> data;

  YarnIndexModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory YarnIndexModel.fromJson(Map<String, dynamic> json) => YarnIndexModel(
    success: json["success"],
    message: json["message"],
    data: List<yarnIndexDatum?>.from(json["data"].map((x) => yarnIndexDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x?.toJson())),
  };
}

class yarnIndexDatum {
  int id;
  String yarnName;
  int yarnDenier;
  int yarnRate;
  int categoryId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  String yarnCategory;

  yarnIndexDatum({
    required this.id,
    required this.yarnName,
    required this.yarnDenier,
    required this.yarnRate,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.yarnCategory,
  });

  factory yarnIndexDatum.fromJson(Map<String, dynamic> json) => yarnIndexDatum(
    id: json["id"],
    yarnName: json["yarn_name"],
    yarnDenier: json["yarn_denier"],
    yarnRate: json["yarn_rate"],
    categoryId: json["category_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    yarnCategory: json["yarn_category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "yarn_name": yarnName,
    "yarn_denier": yarnDenier,
    "yarn_rate": yarnRate,
    "category_id": categoryId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "yarn_category": yarnCategory,
  };
}
