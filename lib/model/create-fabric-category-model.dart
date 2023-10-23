import 'dart:convert';

CreateFabricCategoryModel createFabricCategoryModelFromJson(String str) => CreateFabricCategoryModel.fromJson(json.decode(str));

String createFabricCategoryModelToJson(CreateFabricCategoryModel data) => json.encode(data.toJson());

class CreateFabricCategoryModel {
  bool success;
  String message;

  CreateFabricCategoryModel({
    required this.success,
    required this.message,
  });

  factory CreateFabricCategoryModel.fromJson(Map<String, dynamic> json) => CreateFabricCategoryModel(
    success: json["success"]??false,
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
