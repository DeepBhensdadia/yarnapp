// To parse this JSON data, do
//
//     final usercheckmodel = usercheckmodelFromJson(jsonString);

import 'dart:convert';

Usercheckmodel usercheckmodelFromJson(String str) => Usercheckmodel.fromJson(json.decode(str));

String usercheckmodelToJson(Usercheckmodel data) => json.encode(data.toJson());

class Usercheckmodel {
  bool? success;
  String? message;
  Data? data;

  Usercheckmodel({
    this.success,
    this.message,
    this.data,
  });

  factory Usercheckmodel.fromJson(Map<String, dynamic> json) => Usercheckmodel(
    success: json["success"],
    message: json["message"],
    data:json["data"] !=null ?  Data.fromJson(json["data"]) : Data(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  int? id;
  String? playerName;
  dynamic nickname;
  String? logo;
  String? skills;
  dynamic bowlingPace;
  String? bowlingStyle;
  String? battingStyle;
  dynamic firstPreference;
  dynamic wicketKeeper;
  dynamic capExperience;
  int? status;
  int? createdBy;
  int? mobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? weight;
  int? age;
  dynamic bob;
  int? vistiNo;
  String? email;

  Data({
    this.id,
    this.playerName,
    this.nickname,
    this.logo,
    this.skills,
    this.bowlingPace,
    this.bowlingStyle,
    this.battingStyle,
    this.firstPreference,
    this.wicketKeeper,
    this.capExperience,
    this.status,
    this.createdBy,
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.age,
    this.bob,
    this.vistiNo,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    playerName: json["player_name"],
    nickname: json["nickname"],
    logo: json["logo"],
    skills: json["skills"],
    bowlingPace: json["Bowling_pace"],
    bowlingStyle: json["bowling_style"],
    battingStyle: json["batting_style"],
    firstPreference: json["first_preference"],
    wicketKeeper: json["wicket_keeper"],
    capExperience: json["cap_experience"],
    status: json["status"],
    createdBy: json["created_by"],
    mobileNumber: json["mobile_number"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"],
    age: json["age"],
    bob: json["bob"],
    vistiNo: json["visti_no"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "player_name": playerName,
    "nickname": nickname,
    "logo": logo,
    "skills": skills,
    "Bowling_pace": bowlingPace,
    "bowling_style": bowlingStyle,
    "batting_style": battingStyle,
    "first_preference": firstPreference,
    "wicket_keeper": wicketKeeper,
    "cap_experience": capExperience,
    "status": status,
    "created_by": createdBy,
    "mobile_number": mobileNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "weight": weight,
    "age": age,
    "bob": bob,
    "visti_no": vistiNo,
    "email": email,
  };
}
