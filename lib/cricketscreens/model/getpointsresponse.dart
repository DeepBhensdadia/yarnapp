// To parse this JSON data, do
//
//     final getpointslist = getpointslistFromJson(jsonString);

import 'dart:convert';

Getpointslist getpointslistFromJson(String str) => Getpointslist.fromJson(json.decode(str));

String getpointslistToJson(Getpointslist data) => json.encode(data.toJson());

class Getpointslist {
  bool? success;
  String? message;
  List<Teampoints>? teamA;
  List<Teampoints>? teamB;
  List<Teampoints>? teamC;
  List<Teampoints>? teamD;

  Getpointslist({
    this.success,
    this.message,
    this.teamA,
    this.teamB,
    this.teamC,
    this.teamD,
  });

  factory Getpointslist.fromJson(Map<String, dynamic> json) => Getpointslist(
    success: json["success"],
    message: json["message"],
    teamA: List<Teampoints>.from(json["team_A"].map((x) => Teampoints.fromJson(x))),
    teamB: List<Teampoints>.from(json["team_B"].map((x) => Teampoints.fromJson(x))),
    teamC: List<Teampoints>.from(json["team_C"].map((x) => Teampoints.fromJson(x))),
    teamD: List<Teampoints>.from(json["team_D"].map((x) => Teampoints.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "team_A": List<dynamic>.from(teamA!.map((x) => x.toJson())),
    "team_B": List<dynamic>.from(teamB!.map((x) => x.toJson())),
    "team_C": List<dynamic>.from(teamC!.map((x) => x.toJson())),
    "team_D": List<dynamic>.from(teamD!.map((x) => x.toJson())),
  };
}

class Teampoints {
  int? id;
  String? teamName;
  dynamic teamOwner;
  int? tournamentId;
  int? createdBy;
  String? logo;
  String? players;
  String? shortName;
  int? status;
  String? groupId;
  int? totalMatches;
  int? totalWin;
  int? totalLoss;
  int? totalDraw;
  int? point;
  String? netRunrate;
  int? isDelete;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  List<Teamplaye>? teamplaye;

  Teampoints({
    this.id,
    this.teamName,
    this.teamOwner,
    this.tournamentId,
    this.createdBy,
    this.logo,
    this.players,
    this.shortName,
    this.status,
    this.groupId,
    this.totalMatches,
    this.totalWin,
    this.totalLoss,
    this.totalDraw,
    this.point,
    this.netRunrate,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.teamplaye,
  });

  factory Teampoints.fromJson(Map<String, dynamic> json) => Teampoints(
    id: json["id"],
    teamName: json["team_name"],
    teamOwner: json["team_owner"],
    tournamentId: json["tournament_id"],
    createdBy: json["created_by"],
    logo: json["logo"],
    players: json["players"],
    shortName: json["short_name"],
    status: json["status"],
    groupId: json["group_id"],
    totalMatches: json["total_matches"],
    totalWin: json["total_win"],
    totalLoss: json["total_loss"],
    totalDraw: json["total_draw"],
    point: json["point"],
    netRunrate: json["net_runrate"],
    isDelete: json["is_delete"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
    teamplaye: List<Teamplaye>.from(json["teamplaye"].map((x) => Teamplaye.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_name": teamName,
    "team_owner": teamOwner,
    "tournament_id": tournamentId,
    "created_by": createdBy,
    "logo": logo,
    "players": players,
    "short_name": shortName,
    "status": status,
    "group_id": groupId,
    "total_matches": totalMatches,
    "total_win": totalWin,
    "total_loss": totalLoss,
    "total_draw": totalDraw,
    "point": point,
    "net_runrate": netRunrate,
    "is_delete": isDelete,
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
  int? tournamentId;
  int? points;
  String? playerRoll;
  String? postion;
  int? isWicketkeeper;
  int? sequence;
  int? isExtra;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Teamplaye({
    this.id,
    this.teamId,
    this.playerId,
    this.tournamentId,
    this.points,
    this.playerRoll,
    this.postion,
    this.isWicketkeeper,
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
    tournamentId: json["tournament_id"],
    points: json["points"],
    playerRoll: json["player_roll"],
    postion: json["postion"],
    isWicketkeeper: json["is_wicketkeeper"],
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
    "tournament_id": tournamentId,
    "points": points,
    "player_roll": playerRoll,
    "postion": postion,
    "is_wicketkeeper": isWicketkeeper,
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
  dynamic? emailVerifiedAt;
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
