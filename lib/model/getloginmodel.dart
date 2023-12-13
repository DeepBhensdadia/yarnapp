// To parse this JSON data, do
//
//     final getloginresponse = getloginresponseFromJson(jsonString);

import 'dart:convert';

Getloginresponse getloginresponseFromJson(String str) =>
    Getloginresponse.fromJson(json.decode(str));

String getloginresponseToJson(Getloginresponse data) =>
    json.encode(data.toJson());

class Getloginresponse {
  int? id;
  String? name;
  String? email;
  dynamic isCustomer;
  int? isActive;
  String? mobileNumber;
  String? city;
  String? companyName;
  String? message;
  bool? success;

  Getloginresponse({
    this.id,
    this.name,
    this.email,
    this.isCustomer,
    this.isActive,
    this.mobileNumber,
    this.city,
    this.companyName,
    this.message,
    this.success,
  });

  factory Getloginresponse.fromJson(Map<String, dynamic> json) =>
      Getloginresponse(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        isCustomer: json["is_customer"] ?? "",
        isActive: json["is_active"] ?? 0,
        mobileNumber: json["mobile_number"] ?? "",
        city: json["city"] ?? "",
        companyName: json["company_name"] ?? "",
        message: json["message"] ?? "",
        success: json["success"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "is_customer": isCustomer,
        "is_active": isActive,
        "mobile_number": mobileNumber,
        "city": city,
        "company_name": companyName,
        "message": message,
        "success": success,
      };
}
