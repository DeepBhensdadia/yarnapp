// To parse this JSON data, do
//
//     final getdetailscheckresponse = getdetailscheckresponseFromJson(jsonString);

import 'dart:convert';

Getdetailscheckresponse getdetailscheckresponseFromJson(String str) => Getdetailscheckresponse.fromJson(json.decode(str));

String getdetailscheckresponseToJson(Getdetailscheckresponse data) => json.encode(data.toJson());

class Getdetailscheckresponse {
  bool? success;
  String? message;
  int? id;
  String? name;
  String? email;
  String? isCustomer;
  int? isActive;
  int? isDelete;
  String? mobileNumber;

  Getdetailscheckresponse({
    this.success,
    this.message,
    this.id,
    this.name,
    this.email,
    this.isCustomer,
    this.isActive,
    this.isDelete,
    this.mobileNumber,
  });

  factory Getdetailscheckresponse.fromJson(Map<String, dynamic> json) => Getdetailscheckresponse(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    isCustomer: json["is_customer"] ?? "",
    isActive: json["is_active"] ?? 0,
    isDelete: json["is_delete"]??0,
    mobileNumber: json["mobile_number"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "id": id,
    "name": name,
    "email": email,
    "is_customer": isCustomer,
    "is_active": isActive,
    "is_delete": isDelete,
    "mobile_number": mobileNumber,
  };
}
