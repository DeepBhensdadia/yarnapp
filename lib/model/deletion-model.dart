import 'dart:convert';

DeletionModel deletionModelFromJson(String str) =>
    DeletionModel.fromJson(json.decode(str));

String deletionModelToJson(DeletionModel data) => json.encode(data.toJson());

class DeletionModel {
  bool success;
  String message;

  DeletionModel({
    required this.success,
    required this.message,
  });

  factory DeletionModel.fromJson(Map<String, dynamic> json) => DeletionModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
