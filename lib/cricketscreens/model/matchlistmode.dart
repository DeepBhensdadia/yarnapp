// To parse this JSON data, do
//
//     final matchlistmodel = matchlistmodelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Matchlistmodel matchlistmodelFromJson(String str) =>
    Matchlistmodel.fromJson(json.decode(str));

String matchlistmodelToJson(Matchlistmodel data) => json.encode(data.toJson());

class Matchlistmodel {
  bool? success;
  String? message;
  List<MatchList>? data;

  Matchlistmodel({
    this.success,
    this.message,
    this.data,
  });

  factory Matchlistmodel.fromJson(Map<String, dynamic> json) => Matchlistmodel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MatchList>.from(
                json["data"].map((x) => MatchList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MatchList {
  int? id;
  int? createdBy;
  int? tournamentId;
  int? datumTeam1;
  int? datumTeam2;
  int? overseas;
  dynamic match;
  dynamic leaderBorad;
  dynamic pointTable;
  DateTime? matchDate;
  String? matchTime;
  String? umpires;
  DateTime? createdAt;
  DateTime? updatedAt;
  MatchStatus? matchStatus;
  int? groupId;
  String? toss;
  String? venue;
  String? timeStart;
  User? user;
  Tournament? tournament;
  Team? team1;
  Team? team2;
  String? description;

  String matchdateformat() {
    return DateFormat('dd-MM-yyyy').format(matchDate ?? DateTime.now());
  }

  String matchtimeformat() {
    DateTime parsedTime = DateFormat('HH:mm:ss').parse(matchTime ?? "00:00:00");

    return DateFormat('HH:mm').format(parsedTime);
  }

  MatchList({
    this.id,
    this.createdBy,
    this.tournamentId,
    this.datumTeam1,
    this.datumTeam2,
    this.overseas,
    this.match,
    this.leaderBorad,
    this.pointTable,
    this.matchDate,
    this.matchTime,
    this.umpires,
    this.createdAt,
    this.updatedAt,
    this.matchStatus,
    this.groupId,
    this.toss,
    this.venue,
    this.timeStart,
    this.user,
    this.tournament,
    this.team1,
    this.team2,
    this.description,
  });

  String matchdatecon() {
    return DateFormat('dd-MM-yyyy').format(matchDate ?? DateTime.now());
  }

  factory MatchList.fromJson(Map<String, dynamic> json) => MatchList(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentId: json["tournament_id"],
        datumTeam1: json["team_1"],
        datumTeam2: json["team_2"],
        overseas: json["overseas"],
        match: json["match"],
        leaderBorad: json["leader_borad"],
        pointTable: json["point_table"],
        matchDate: DateTime.parse(json["match_date"]),
        matchTime: json["match_time"],
        umpires: json["umpires"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        matchStatus: json["match_status"] == null
            ? MatchStatus()
            : MatchStatus.fromJson(json["match_status"]),
        groupId: json["group_id"],
        toss: json["toss"],
        venue: json["venue"],
        timeStart: json["time_start"],
        user: json["user"] == null ? User() : User.fromJson(json["user"]),
        tournament: json["tournament"] == null
            ? Tournament()
            : Tournament.fromJson(json["tournament"]),
        team1: json["team1"] == null ? Team() : Team.fromJson(json["team1"]),
        team2: json["team2"] == null ? Team() : Team.fromJson(json["team2"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "tournament_id": tournamentId,
        "team_1": datumTeam1,
        "team_2": datumTeam2,
        "overseas": overseas,
        "match": match,
        "leader_borad": leaderBorad,
        "point_table": pointTable,
        "match_date": matchDate?.toIso8601String(),
        "match_time": matchTime,
        "umpires": umpires,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "match_status": matchStatus?.toJson(),
        "group_id": groupId,
        "toss": toss,
        "venue": venue,
        "time_start": timeStart,
        "user": user?.toJson(),
        "tournament": tournament?.toJson(),
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
        "description": description,
      };
}

class MatchStatus {
  int? id;
  String? name;

  MatchStatus({
    this.id,
    this.name,
  });

  factory MatchStatus.fromJson(Map<String, dynamic> json) => MatchStatus(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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

class Tournament {
  int? id;
  int? createdBy;
  String? tournamentName;
  String? location;
  int? tournamentTypeId;
  String? logo;
  String? description;
  dynamic? stratDate;
  dynamic? endDate;
  dynamic? dueDate;
  dynamic? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tournament({
    this.id,
    this.createdBy,
    this.tournamentName,
    this.location,
    this.tournamentTypeId,
    this.logo,
    this.description,
    this.stratDate,
    this.endDate,
    this.dueDate,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentName: json["tournament_name"],
        location: json["location"],
        tournamentTypeId: json["tournament_type_id"],
        logo: json["logo"],
        description: json["description"],
        stratDate: json["strat_date"],
        endDate: json["end_date"],
        dueDate: json["due_date"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "tournament_name": tournamentName,
        "location": location,
        "tournament_type_id": tournamentTypeId,
        "logo": logo,
        "description": description,
        "strat_date": stratDate,
        "end_date": endDate,
        "due_date": dueDate,
        "address": address,
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
