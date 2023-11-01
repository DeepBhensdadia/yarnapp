import 'dart:convert';

CreateFabricCategoryModel createFabricCategoryModelFromJson(String str) => CreateFabricCategoryModel.fromJson(json.decode(str));

String createFabricCategoryModelToJson(CreateFabricCategoryModel data) => json.encode(data.toJson());

class CreateFabricCategoryModel {
  bool? success;
  String? message;
  int? categoryId;

  CreateFabricCategoryModel({
     this.success,
     this.message,
    this.categoryId,
  });

  factory CreateFabricCategoryModel.fromJson(Map<String, dynamic> json) => CreateFabricCategoryModel(
    success: json["success"]??false,
    message: json["message"]??"",
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "category_id": categoryId,
  };
}
