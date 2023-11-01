import 'dart:convert';

EditModel editModelFromJson(String str) => EditModel.fromJson(json.decode(str));

String editModelToJson(EditModel data) => json.encode(data.toJson());

class EditModel {
  bool success;
  String massage;

  EditModel({
    required this.success,
    required this.massage,
  });

  factory EditModel.fromJson(Map<String, dynamic> json) => EditModel(
    success: json["success"]??false,
    massage: json["massage"]??"",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "massage": massage,
  };
}
