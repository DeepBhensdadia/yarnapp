import 'dart:convert';

CreateAddYarnModel createAddYarnModelFromJson(String str) => CreateAddYarnModel.fromJson(json.decode(str));

String createAddYarnModelToJson(CreateAddYarnModel data) => json.encode(data.toJson());

class CreateAddYarnModel {
  bool success;
  String message;

  CreateAddYarnModel({
    required this.success,
    required this.message,
  });

  factory CreateAddYarnModel.fromJson(Map<String, dynamic> json) => CreateAddYarnModel(
    success: json["success"]??false,
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
