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
  List<Packageavailable>? packages;

  Packagessummaryresponse({
    this.success,
    this.message,
    this.userPackages,
    this.remaningDays,
    this.packages,
  });

  factory Packagessummaryresponse.fromJson(Map<String, dynamic> json) =>
      Packagessummaryresponse(
        success: json["success"],
        message: json["message"],
        userPackages: UserPackages.fromJson(json["User Packages"]),
        remaningDays: json["Remaning Days"],
        packages: json["packages"] == null
            ? []
            : List<Packageavailable>.from(
                json["packages"].map((x) => Packageavailable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "User Packages": userPackages!.toJson(),
        "Remaning Days": remaningDays,
        "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
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
        paymentMethod: json["payment_method"] ?? "",
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
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

class Packageavailable {
  DateTime? startingDate;
  DateTime? endingDate;
  String? name;
  String? packageName;
  int? packageAmount;

  Packageavailable({
    this.startingDate,
    this.endingDate,
    this.name,
    this.packageName,
    this.packageAmount,
  });

  factory Packageavailable.fromJson(Map<String, dynamic> json) =>
      Packageavailable(
        startingDate: DateTime.parse(json["starting_date"]),
        endingDate: DateTime.parse(json["ending_date"]),
        name: json["name"],
        packageName: json["package_name"],
        packageAmount: json["package_amount"],
      );

  Map<String, dynamic> toJson() => {
        "starting_date": startingDate?.toIso8601String(),
        "ending_date": endingDate?.toIso8601String(),
        "name": name,
        "package_name": packageName,
        "package_amount": packageAmount,
      };
}
