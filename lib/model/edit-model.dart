import 'dart:convert';

EditModel editModelFromJson(String str) => EditModel.fromJson(json.decode(str));

String editModelToJson(EditModel data) => json.encode(data.toJson());

class EditModel {
  int status;
  String massage;

  EditModel({
    required this.status,
    required this.massage,
  });

  factory EditModel.fromJson(Map<String, dynamic> json) => EditModel(
    status: json["status"]??false,
    massage: json["massage"]??"",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "massage": massage,
  };
}
