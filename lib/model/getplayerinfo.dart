// To parse this JSON data, do
//
//     final getplayerinfo = getplayerinfoFromJson(jsonString);

import 'dart:convert';

import '../cricketscreens/model/searchplayerresponse.dart';
import '../cricketscreens/model/tournamentdetailresponse.dart';

Getplayerinfo getplayerinfoFromJson(String str) =>
    Getplayerinfo.fromJson(json.decode(str));

String getplayerinfoToJson(Getplayerinfo data) => json.encode(data.toJson());

class Getplayerinfo {
  bool? success;
  String? message;
  PlayerDetails? data;
  List<Teamdetails>? teams;
  List<List<Matchinfo>>? matchs;

  Getplayerinfo({
    this.success,
    this.message,
    this.data,
    this.teams,
    this.matchs,
  });

  factory Getplayerinfo.fromJson(Map<String, dynamic> json) => Getplayerinfo(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? PlayerDetails()
            : PlayerDetails.fromJson(json["data"]),
        teams: List<Teamdetails>.from(
            json["teams"].map((x) => Teamdetails.fromJson(x))),
        matchs: List<List<Matchinfo>>.from(json["matchs"].map(
            (x) => List<Matchinfo>.from(x.map((x) => Matchinfo.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "teams": List<dynamic>.from(teams!.map((x) => x.toJson())),
        "matchs": List<dynamic>.from(
            matchs!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Teamdetails {
  int? teamId;
  String? teamName;
  String? logo;
  String? playerName;
  int? id;
  String? shortName;

  Teamdetails({
    this.teamId,
    this.teamName,
    this.logo,
    this.playerName,
    this.id,
    this.shortName,
  });

  factory Teamdetails.fromJson(Map<String, dynamic> json) => Teamdetails(
        teamId: json["team_id"],
        teamName: json["team_name"],
        logo: json["logo"],
        playerName: json["player_name"],
        id: json["id"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "team_name": teamName,
        "logo": logo,
        "player_name": playerName,
        "id": id,
        "short_name": shortName,
      };
}
