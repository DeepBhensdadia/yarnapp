import 'dart:convert';

CreateYarnCategoryModel createYarnCategoryModelFromJson(String str) => CreateYarnCategoryModel.fromJson(json.decode(str));

String createYarnCategoryModelToJson(CreateYarnCategoryModel data) => json.encode(data.toJson());

class CreateYarnCategoryModel {
  bool? success;
  String? message;
  int?  yarncategoryid;

  CreateYarnCategoryModel({
     this.success,
     this.message,
     this.yarncategoryid,
  });

  factory CreateYarnCategoryModel.fromJson(Map<String, dynamic> json) => CreateYarnCategoryModel(
    success: json["success"]??false,
    message: json["message"].toString(),
    yarncategoryid: json["yarn_category_id"]??0,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "yarn_category_id": yarncategoryid,
  };
}
