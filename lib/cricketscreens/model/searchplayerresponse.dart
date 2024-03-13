// To parse this JSON data, do
//
//     final getplayerlist = getplayerlistFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Getplayerlist getplayerlistFromJson(String str) =>
    Getplayerlist.fromJson(json.decode(str));

String getplayerlistToJson(Getplayerlist data) => json.encode(data.toJson());

class Getplayerlist {
  bool? success;
  String? message;
  List<PlayerDetails>? data;

  Getplayerlist({
    this.success,
    this.message,
    this.data,
  });

  factory Getplayerlist.fromJson(Map<String, dynamic> json) => Getplayerlist(
        success: json["success"],
        message: json["message"],
        data: List<PlayerDetails>.from(
            json["data"].map((x) => PlayerDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PlayerDetails {
  int? id;
  String? playerName;
  String? nickname;
  String? logo;
  String? skills;
  dynamic bowlingPace;
  String? bowlingStyle;
  String? battingStyle;
  dynamic firstPreference;
  String? wicketKeeper;
  dynamic capExperience;
  int? status;
  int? isDelete;
  int? createdBy;
  int? mobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic weight;
  String? city;
  DateTime? bob;
  int? vistiNo;
  String? email;
  int? calAge;
  User? user;
  List<Playerteam>? playerteam;

  String birthdateformat() {
    return DateFormat('dd-MM-yyyy').format(bob ?? DateTime.now());
  }

  PlayerDetails({
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
    this.isDelete,
    this.createdBy,
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.city,
    this.bob,
    this.vistiNo,
    this.email,
    this.calAge,
    this.user,
    this.playerteam,
  });

  factory PlayerDetails.fromJson(Map<String, dynamic> json) => PlayerDetails(
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
        isDelete: json["is_delete"],
        createdBy: json["created_by"],
        mobileNumber: json["mobile_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        weight: json["weight"],
        city: json["city"],
        bob: json["bob"] == null ? DateTime.now() : DateTime.parse(json["bob"]),
        vistiNo: json["visti_no"],
        email: json["email"],
        calAge: json["cal_age"],
        user: User.fromJson(json["user"]),
        playerteam: List<Playerteam>.from(
            json["playerteam"].map((x) => Playerteam.fromJson(x))),
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
    "is_delete": isDelete,
    "created_by": createdBy,
    "mobile_number": mobileNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "weight": weight,
    "city": city,
    "bob": "${bob?.year.toString().padLeft(4, '0')}-${bob?.month.toString().padLeft(2, '0')}-${bob?.day.toString().padLeft(2, '0')}",
    "visti_no": vistiNo,
    "email": email,
    "cal_age": calAge,
        "user": user?.toJson(),
        "playerteam": List<dynamic>.from(playerteam!.map((x) => x.toJson())),
      };
}

class Playerteam {
  int? id;
  int? teamId;
  int? playerId;
  dynamic points;
  String? playerRoll;
  String? postion;
  dynamic sequence;
  int? isExtra;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Playerteam({
    this.id,
    this.teamId,
    this.playerId,
    this.points,
    this.playerRoll,
    this.postion,
    this.sequence,
    this.isExtra,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Playerteam.fromJson(Map<String, dynamic> json) => Playerteam(
        id: json["id"],
        teamId: json["team_id"],
        playerId: json["player_id"],
        points: json["points"],
        playerRoll: json["player_roll"],
        postion: json["postion"],
        sequence: json["sequence"],
        isExtra: json["is_extra"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "player_id": playerId,
        "points": points,
        "player_roll": playerRoll,
        "postion": postion,
        "sequence": sequence,
        "is_extra": isExtra,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  int? id;
  String? name;

  User({
    this.id,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
