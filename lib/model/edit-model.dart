import 'dart:convert';

EditModel editModelFromJson(String str) => EditModel.fromJson(json.decode(str));

String editModelToJson(EditModel data) => json.encode(data.toJson());

class EditModel {
  bool? success;
  String? message;

  EditModel({
    this.success,
    this.message,
  });

  factory EditModel.fromJson(Map<String, dynamic> json) => EditModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
