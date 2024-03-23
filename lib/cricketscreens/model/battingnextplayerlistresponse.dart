// To parse this JSON data, do
//
//     final battingnextplayerlist = battingnextplayerlistFromJson(jsonString);

import 'dart:convert';

Battingnextplayerlist battingnextplayerlistFromJson(String str) =>
    Battingnextplayerlist.fromJson(json.decode(str));

String battingnextplayerlistToJson(Battingnextplayerlist data) =>
    json.encode(data.toJson());

class Battingnextplayerlist {
  String? message;
  List<playerlistnext>? data;

  Battingnextplayerlist({
    this.message,
    this.data,
  });

  factory Battingnextplayerlist.fromJson(Map<String, dynamic> json) =>
      Battingnextplayerlist(
        message: json["message"],
        data: List<playerlistnext>.from(
            json["data"].map((x) => playerlistnext.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class playerlistnext {
  int? playerId;
  Player? player;

  playerlistnext({
    this.playerId,
    this.player,
  });

  factory playerlistnext.fromJson(Map<String, dynamic> json) => playerlistnext(
        playerId: json["player_id"],
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "player": player?.toJson(),
      };
}

class Player {
  int? id;
  String? playerName;
  String? nickname;
  String? logo;
  String? skills;
  String? bowlingPace;
  String? bowlingStyle;
  String? battingStyle;
  dynamic firstPreference;
  String? wicketKeeper;
  int? capExperience;
  int? status;
  int? isDelete;
  int? createdBy;
  int? mobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? weight;
  String? city;
  DateTime? bob;
  int? vistiNo;
  String? email;

  Player({
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
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
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
        "bob":
            "${bob?.year.toString().padLeft(4, '0')}-${bob?.month.toString().padLeft(2, '0')}-${bob?.day.toString().padLeft(2, '0')}",
        "visti_no": vistiNo,
        "email": email,
      };
}
