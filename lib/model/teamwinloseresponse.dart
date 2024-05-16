// To parse this JSON data, do
//
//     final teamwinloseresponse = teamwinloseresponseFromJson(jsonString);

import 'dart:convert';

import '../cricketscreens/model/getteamplayerlist.dart';

Teamwinloseresponse teamwinloseresponseFromJson(String str) => Teamwinloseresponse.fromJson(json.decode(str));

String teamwinloseresponseToJson(Teamwinloseresponse data) => json.encode(data.toJson());

class Teamwinloseresponse {
  bool? success;
  String? message;
  List<Matchwinlose>? match;

  Teamwinloseresponse({
    this.success,
    this.message,
    this.match,
  });

  factory Teamwinloseresponse.fromJson(Map<String, dynamic> json) => Teamwinloseresponse(
    success: json["success"],
    message: json["message"],
    match: List<Matchwinlose>.from(json["match"].map((x) => Matchwinlose.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "match": List<dynamic>.from(match!.map((x) => x.toJson())),
  };
}

class Matchwinlose {
  int? id;
  int? matchTeam1;
  int? matchTeam2;
  String? summary;
  DateTime? matchDate;
  String? team1Crr;
  String? team2Crr;
  dynamic tossStatus;
  int? team1Runs;
  int? team2Runs;
  int? team1TotalBalls;
  int? team2TotalBalls;
  Team? team1;
  Team? team2;

  Matchwinlose({
    this.id,
    this.matchTeam1,
    this.matchTeam2,
    this.summary,
    this.matchDate,
    this.team1Crr,
    this.team2Crr,
    this.tossStatus,
    this.team1Runs,
    this.team2Runs,
    this.team1TotalBalls,
    this.team2TotalBalls,
    this.team1,
    this.team2,
  });

  factory Matchwinlose.fromJson(Map<String, dynamic> json) => Matchwinlose(
    id: json["id"],
    matchTeam1: json["team_1"],
    matchTeam2: json["team_2"],
    summary: json["summary"],
    matchDate: DateTime.parse(json["match_date"]),
    team1Crr: json["team_1_crr"],
    team2Crr: json["team_2_crr"],
    tossStatus: json["toss_status"],
    team1Runs: json["team1_runs"],
    team2Runs: json["team2_runs"],
    team1TotalBalls: json["team1_total_balls"],
    team2TotalBalls: json["team2_total_balls"],
    team1: Team.fromJson(json["team1"]),
    team2: Team.fromJson(json["team2"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_1": matchTeam1,
    "team_2": matchTeam2,
    "summary": summary,
    "match_date": "${matchDate?.year.toString().padLeft(4, '0')}-${matchDate?.month.toString().padLeft(2, '0')}-${matchDate?.day.toString().padLeft(2, '0')}",
    "team_1_crr": team1Crr,
    "team_2_crr": team2Crr,
    "toss_status": tossStatus,
    "team1_runs": team1Runs,
    "team2_runs": team2Runs,
    "team1_total_balls": team1TotalBalls,
    "team2_total_balls": team2TotalBalls,
    "team1": team1?.toJson(),
    "team2": team2?.toJson(),
  };
}
