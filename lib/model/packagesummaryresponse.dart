// To parse this JSON data, do
//
//     final packagessummaryresponse = packagessummaryresponseFromJson(jsonString);

import 'dart:convert';

Packagessummaryresponse packagessummaryresponseFromJson(String str) =>
    Packagessummaryresponse.fromJson(json.decode(str));

String packagessummaryresponseToJson(Packagessummaryresponse data) =>
    json.encode(data.toJson());

class Packagessummaryresponse {
  bool? success;
  String? message;
  UserPackages? userPackages;
  int? remaningDays;

  Packagessummaryresponse({
    this.success,
    this.message,
    this.userPackages,
    this.remaningDays,
  });

  factory Packagessummaryresponse.fromJson(Map<String, dynamic> json) =>
      Packagessummaryresponse(
        success: json["success"],
        message: json["message"],
        userPackages: UserPackages.fromJson(json["User Packages"]),
        remaningDays: json["Remaning Days"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "User Packages": userPackages!.toJson(),
        "Remaning Days": remaningDays,
      };
}

class UserPackages {
  int? id;
  int? userId;
  int? packageId;
  String? amount;
  DateTime? startingDate;
  DateTime? endingDate;
  String? notes;
  String? paymentMethod;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserPackages({
    this.id,
    this.userId,
    this.packageId,
    this.amount,
    this.startingDate,
    this.endingDate,
    this.notes,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
  });

  factory UserPackages.fromJson(Map<String, dynamic> json) => UserPackages(
        id: json["id"],
        userId: json["user_id"],
        packageId: json["package_id"],
        amount: json["amount"].toString(),
        startingDate: DateTime.parse(json["starting_date"]),
        endingDate: DateTime.parse(json["ending_date"]),
        notes: json["notes"].toString(),
        paymentMethod: json["payment_method"]??"",
        createdAt: json["created_at"] != null ?  DateTime.parse(json["created_at"]) : DateTime.now(),
        updatedAt:json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "package_id": packageId,
        "amount": amount,
        "starting_date": startingDate?.toIso8601String(),
        "ending_date": endingDate?.toIso8601String(),
        "notes": notes,
        "payment_method": paymentMethod,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
