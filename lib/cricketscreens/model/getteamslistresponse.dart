// To parse this JSON data, do
//
//     final getteamslist = getteamslistFromJson(jsonString);

import 'dart:convert';

Getteamslist getteamslistFromJson(String str) =>
    Getteamslist.fromJson(json.decode(str));

String getteamslistToJson(Getteamslist data) => json.encode(data.toJson());

class Getteamslist {
  bool? success;
  String? message;
  List<Teams>? data;

  Getteamslist({
    this.success,
    this.message,
    this.data,
  });

  factory Getteamslist.fromJson(Map<String, dynamic> json) => Getteamslist(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null
            ? List<Teams>.from(json["data"].map((x) => Teams.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Teams {
  int? id;
  String? teamName;
  String? groupId;
  String? teamOwner;
  int? tournamentId;
  int? createdBy;
  int? totalMatches;
  int? totalWin;
  int? totalLoss;
  int? totalDraw;
  int? point;
  String? netRunrate;
  String? logo;
  String? players;
  String? shortName;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  List<Teamplaye>? teamplaye;

  Teams({
    this.id,
    this.teamName,
    this.teamOwner,
    this.groupId,
    this.tournamentId,
    this.createdBy,
    this.totalMatches,
    this.totalWin,
    this.totalLoss,
    this.totalDraw,
    this.point,
    this.netRunrate,
    this.logo,
    this.players,
    this.shortName,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.teamplaye,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        id: json["id"],
        teamName: json["team_name"],
        teamOwner: json["team_owner"],
        groupId: json["group_id"],
        tournamentId: json["tournament_id"],
        createdBy: json["created_by"],
        totalMatches: json["total_matches"],
        totalWin: json["total_win"],
        totalLoss: json["total_loss"],
        totalDraw: json["total_draw"],
        point: json["point"],
        netRunrate: json["net_runrate"],
        logo: json["logo"],
        players: json["players"],
        shortName: json["short_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        teamplaye: json["teamplaye"] != null
            ? List<Teamplaye>.from(
                json["teamplaye"].map((x) => Teamplaye.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_name": teamName,
        "team_owner": teamOwner,
        "group_id": groupId,
        "tournament_id": tournamentId,
        "created_by": createdBy,
        "total_matches": totalMatches,
        "total_win": totalWin,
        "total_loss": totalLoss,
        "total_draw": totalDraw,
        "point": point,
        "net_runrate": netRunrate,
        "logo": logo,
        "players": players,
        "short_name": shortName,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "teamplaye": List<dynamic>.from(teamplaye!.map((x) => x.toJson())),
      };
}

class Teamplaye {
  int? id;
  int? teamId;
  int? playerId;
  int? points;
  String? playerRoll;
  String? postion;
  dynamic sequence;
  int? isExtra;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Teamplaye({
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

  factory Teamplaye.fromJson(Map<String, dynamic> json) => Teamplaye(
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
  String? email;
  dynamic emailVerifiedAt;
  String? isCustomer;
  int? isActive;
  int? isDelete;
  String? deviceId;
  String? mobileNumber;
  String? companyName;
  String? city;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isCustomer,
    this.isActive,
    this.isDelete,
    this.deviceId,
    this.mobileNumber,
    this.companyName,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        isCustomer: json["is_customer"],
        isActive: json["is_active"],
        isDelete: json["is_delete"],
        deviceId: json["device_id"],
        mobileNumber: json["mobile_number"],
        companyName: json["company_name"],
        city: json["city"],
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
        "is_delete": isDelete,
        "device_id": deviceId,
        "mobile_number": mobileNumber,
        "company_name": companyName,
        "city": city,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
