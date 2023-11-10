// To parse this JSON data, do
//
//     final getregistrationresponse = getregistrationresponseFromJson(jsonString);

import 'dart:convert';

Getregistrationresponse getregistrationresponseFromJson(String str) => Getregistrationresponse.fromJson(json.decode(str));

String getregistrationresponseToJson(Getregistrationresponse data) => json.encode(data.toJson());

class Getregistrationresponse {
  bool? success;
  String? message;
  Data? data;

  Getregistrationresponse({
    this.success,
    this.message,
    this.data,
  });

  factory Getregistrationresponse.fromJson(Map<String, dynamic> json) => Getregistrationresponse(
    success: json["success"],
    message: json["message"],
    data:json["data"] != null ? Data.fromJson(json["data"]) : Data(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? isCustomer;
  int? isActive;
  String? mobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isCustomer,
    this.isActive,
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    isCustomer: json["is_customer"],
    isActive: json["is_active"],
    mobileNumber: json["mobile_number"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "is_customer": isCustomer,
    "is_active": isActive,
    "mobile_number": mobileNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
