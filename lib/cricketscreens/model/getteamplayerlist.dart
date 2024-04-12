// To parse this JSON data, do
//
//     final getteamplayerlist = getteamplayerlistFromJson(jsonString);

import 'dart:convert';

Getteamplayerlist getteamplayerlistFromJson(String str) =>
    Getteamplayerlist.fromJson(json.decode(str));

String getteamplayerlistToJson(Getteamplayerlist data) =>
    json.encode(data.toJson());

class Getteamplayerlist {
  bool? success;
  String? message;
  List<playersresponse>? date;
  List<playersresponse>? extra;

  Getteamplayerlist({
    this.success,
    this.message,
    this.date,
    this.extra,
  });

  factory Getteamplayerlist.fromJson(Map<String, dynamic> json) =>
      Getteamplayerlist(
        success: json["success"],
        message: json["message"],
        date: json["date"] != null
            ? List<playersresponse>.from(
                json["date"].map((x) => playersresponse.fromJson(x)))
            : [],
        extra: json["extra"] == null
            ? []
            : List<playersresponse>.from(
                json["extra"].map((x) => playersresponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "date": List<dynamic>.from(date!.map((x) => x.toJson())),
        "extra": List<dynamic>.from(extra!.map((x) => x.toJson())),
      };
}

class playersresponse {
  int? id;
  int? teamId;
  int? playerId;
  int? points;
  int? isWicketkeeper;
  String? playerRoll;
  String? postion;
  dynamic sequence;
  int? isExtra;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? roll;
  Team? team;
  Player? player;
  Playerrole? playerrole;

  playersresponse({
    this.id,
    this.teamId,
    this.playerId,
    this.points,
    this.isWicketkeeper,
    this.playerRoll,
    this.postion,
    this.sequence,
    this.isExtra,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.roll,
    this.team,
    this.player,
    this.playerrole,
  });

  factory playersresponse.fromJson(Map<String, dynamic> json) =>
      playersresponse(
        id: json["id"],
        teamId: json["team_id"],
        playerId: json["player_id"],
        points: json["points"],
        isWicketkeeper: json["is_wicketkeeper"],
        playerRoll: json["player_roll"],
        postion: json["postion"],
        sequence: json["sequence"],
        isExtra: json["is_extra"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roll: json["roll"],
        team: Team.fromJson(json["team"]),
        player: Player.fromJson(json["player"]),
        playerrole: Playerrole.fromJson(json["playerrole"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "player_id": playerId,
        "points": points,
        "is_wicketkeeper": isWicketkeeper,
        "player_roll": playerRoll,
        "postion": postion,
        "sequence": sequence,
        "is_extra": isExtra,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "roll": roll,
        "team": team?.toJson(),
        "player": player?.toJson(),
        "playerrole": playerrole?.toJson(),
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
  String? firstPreference;
  String? wicketKeeper;
  int? capExperience;
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
        createdBy: json["created_by"],
        mobileNumber: json["mobile_number"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
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

class Playerrole {
  int? id;
  String? positionName;

  Playerrole({
    this.id,
    this.positionName,
  });

  factory Playerrole.fromJson(Map<String, dynamic> json) => Playerrole(
        id: json["id"],
        positionName: json["position_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position_name": positionName,
      };
}

class Team {
  int? id;
  String? teamName;
  int? tournamentId;
  int? createdBy;
  String? logo;
  String? players;
  String? shortName;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Team({
    this.id,
    this.teamName,
    this.tournamentId,
    this.createdBy,
    this.logo,
    this.players,
    this.shortName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        teamName: json["team_name"],
        tournamentId: json["tournament_id"],
        createdBy: json["created_by"],
        logo: json["logo"],
        players: json["players"],
        shortName: json["short_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_name": teamName,
        "tournament_id": tournamentId,
        "created_by": createdBy,
        "logo": logo,
        "players": players,
        "short_name": shortName,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// class Extra {
//   int? id;
//   int? teamId;
//   int? playerId;
//   int? points;
//   String? playerRoll;
//   String? postion;
//   String? sequence;
//   int? isExtra;
//   int? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Team? team;
//   Player? player;
//   Playerrole? playerrole;
//
//   Extra({
//     this.id,
//     this.teamId,
//     this.playerId,
//     this.points,
//     this.playerRoll,
//     this.postion,
//     this.sequence,
//     this.isExtra,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.team,
//     this.player,
//     this.playerrole,
//   });
//
//   factory Extra.fromJson(Map<String, dynamic> json) => Extra(
//         id: json["id"],
//         teamId: json["team_id"],
//         playerId: json["player_id"],
//         points: json["points"],
//         playerRoll: json["player_roll"],
//         postion: json["postion"],
//         sequence: json["sequence"],
//         isExtra: json["is_extra"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         team: Team.fromJson(json["team"]),
//         player: Player.fromJson(json["player"]),
//         playerrole: Playerrole.fromJson(json["playerrole"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "team_id": teamId,
//         "player_id": playerId,
//         "points": points,
//         "player_roll": playerRoll,
//         "postion": postion,
//         "sequence": sequence,
//         "is_extra": isExtra,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "team": team?.toJson(),
//         "player": player?.toJson(),
//         "playerrole": playerrole?.toJson(),
//       };
// }
