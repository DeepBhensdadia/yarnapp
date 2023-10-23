import 'dart:convert';

CreateYarnCategoryModel createYarnCategoryModelFromJson(String str) => CreateYarnCategoryModel.fromJson(json.decode(str));

String createYarnCategoryModelToJson(CreateYarnCategoryModel data) => json.encode(data.toJson());

class CreateYarnCategoryModel {
  bool success;
  String message;

  CreateYarnCategoryModel({
    required this.success,
    required this.message,
  });

  factory CreateYarnCategoryModel.fromJson(Map<String, dynamic> json) => CreateYarnCategoryModel(
    success: json["success"]??false,
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
