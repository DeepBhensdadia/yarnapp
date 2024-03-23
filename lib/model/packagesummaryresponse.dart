// To parse this JSON data, do
//
//     final packagessummaryresponse = packagessummaryresponseFromJson(jsonString);

import 'dart:convert';

Packagessummaryresponse packagessummaryresponseFromJson(String str) => Packagessummaryresponse.fromJson(json.decode(str));

String packagessummaryresponseToJson(Packagessummaryresponse data) => json.encode(data.toJson());

class Packagessummaryresponse {
  bool? success;
  String? message;
  UserPackages? userPackages;
  int? remaningDays;
  List<Packageavailable>? packages;
  bool? packageVisible;

  Packagessummaryresponse({
    this.success,
    this.message,
    this.userPackages,
    this.remaningDays,
    this.packages,
    this.packageVisible,
  });

  factory Packagessummaryresponse.fromJson(Map<String, dynamic> json) => Packagessummaryresponse(
    success: json["success"],
    message: json["message"],
    userPackages: UserPackages.fromJson(json["User Packages"]),
    remaningDays: json["Remaning Days"],
    packages: json["packages"] == null ? [] :List<Packageavailable>.from(json["packages"].map((x) => Packageavailable.fromJson(x))),
    packageVisible: json["Package_visible"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "User Packages": userPackages?.toJson(),
    "Remaning Days": remaningDays,
    "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
    "Package_visible": packageVisible,
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

  factory Packageavailable.fromJson(Map<String, dynamic> json) => Packageavailable(
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

class UserPackages {
  int? id;
  int? userId;
  int? packageId;
  String? amount;
  DateTime? startingDate;
  DateTime? endingDate;
  String? notes;
  int? cricketAndroid;
  int? cricketIos;
  String? paymentMethod;

  UserPackages({
    this.id,
    this.userId,
    this.packageId,
    this.amount,
    this.startingDate,
    this.endingDate,
    this.notes,
    this.cricketAndroid,
    this.cricketIos,
    this.paymentMethod,
  });

  factory UserPackages.fromJson(Map<String, dynamic> json) => UserPackages(
    id: json["id"],
    userId: json["user_id"],
    packageId: json["package_id"],
    amount: json["amount"],
    startingDate: DateTime.parse(json["starting_date"]),
    endingDate: DateTime.parse(json["ending_date"]),
    notes: json["notes"],
    cricketAndroid: json["cricket_android"],
    cricketIos: json["cricket_ios"],
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "package_id": packageId,
    "amount": amount,
    "starting_date": startingDate?.toIso8601String(),
    "ending_date": endingDate?.toIso8601String(),
    "notes": notes,
    "cricket_android": cricketAndroid,
    "cricket_ios": cricketIos,
    "payment_method": paymentMethod,
  };
}
