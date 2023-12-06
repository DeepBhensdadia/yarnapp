// To parse this JSON data, do
//
//     final packagelistresponse = packagelistresponseFromJson(jsonString);

import 'dart:convert';

Packagelistresponse packagelistresponseFromJson(String str) =>
    Packagelistresponse.fromJson(json.decode(str));

String packagelistresponseToJson(Packagelistresponse data) =>
    json.encode(data.toJson());

class Packagelistresponse {
  bool? success;
  List<Package>? package;
  List<PaymentDetail>? paymentDetails;

  Packagelistresponse({
    this.success,
    this.package,
    this.paymentDetails,
  });

  factory Packagelistresponse.fromJson(Map<String, dynamic> json) =>
      Packagelistresponse(
        success: json["success"],
        package:
            List<Package>.from(json["package"].map((x) => Package.fromJson(x))),
        paymentDetails: List<PaymentDetail>.from(
            json["paymentDetails"].map((x) => PaymentDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "package": List<dynamic>.from(package!.map((x) => x.toJson())),
        "paymentDetails":
            List<dynamic>.from(paymentDetails!.map((x) => x.toJson())),
      };
}

class Package {
  int? id;
  String? name;
  String? description;
  int? amount;
  int? days;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Package({
    this.id,
    this.name,
    this.description,
    this.amount,
    this.days,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"],
        days: json["days"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount,
        "days": days,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class PaymentDetail {
  int? id;
  String? image;
  String? name;
  String? upiId;
  int? mobileNumber;
  String? companyName;
  int? isActive;
  dynamic createdAt;
  dynamic updatedAt;

  PaymentDetail({
    this.id,
    this.image,
    this.name,
    this.upiId,
    this.mobileNumber,
    this.companyName,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        upiId: json["upi_id"],
        mobileNumber: json["mobile_number"],
        companyName: json["company_name"],
        isActive: json["is_active"],
        createdAt:json["created_at"], //!= null ? DateTime.parse(json["created_at"]) : DateTime.now(),
        updatedAt:json["updated_at"] //!= null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "upi_id": upiId,
        "mobile_number": mobileNumber,
        "company_name": companyName,
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
