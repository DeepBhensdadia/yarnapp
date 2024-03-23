// To parse this JSON data, do
//
//     final matchscroreboardDetails = matchscroreboardDetailsFromJson(jsonString);

import 'dart:convert';

import 'matchlivedetailsresponse.dart';

MatchscroreboardDetails matchscroreboardDetailsFromJson(String str) => MatchscroreboardDetails.fromJson(json.decode(str));

String matchscroreboardDetailsToJson(MatchscroreboardDetails data) => json.encode(data.toJson());

class MatchscroreboardDetails {
  bool? success;
  String? message;
  MatchLive? data;
  List<Betsmen>? betsmens;
  List<Bawler>? bawlers;
  List<Ball>? balls;
  bool? isNewOver;

  MatchscroreboardDetails({
    this.success,
    this.message,
    this.data,
    this.betsmens,
    this.bawlers,
    this.balls,
    this.isNewOver,
  });

  factory MatchscroreboardDetails.fromJson(Map<String, dynamic> json) => MatchscroreboardDetails(
    success: json["success"],
    message: json["message"],
    data: MatchLive.fromJson(json["data"]),
    betsmens: List<Betsmen>.from(json["betsmens"].map((x) => Betsmen.fromJson(x))),
    bawlers: List<Bawler>.from(json["bawlers"].map((x) => Bawler.fromJson(x))),
    balls: List<Ball>.from(json["balls"].map((x) => Ball.fromJson(x))),
    isNewOver: json["is_new_over"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "betsmens": List<dynamic>.from(betsmens!.map((x) => x.toJson())),
    "bawlers": List<dynamic>.from(bawlers!.map((x) => x.toJson())),
    "balls": List<dynamic>.from(balls!.map((x) => x.toJson())),
    "is_new_over": isNewOver,
  };
}

class Bawler {
  int? id;
  int? matchId;
  int? tournamentId;
  int? teamId;
  int? playerId;
  String? overs;
  int? runs;
  int? maidenOver;
  int? wickets;
  DateTime? createdAt;
  DateTime? updatedAt;
  PlayerBowler? bowler;

  Bawler({
    this.id,
    this.matchId,
    this.tournamentId,
    this.teamId,
    this.playerId,
    this.overs,
    this.runs,
    this.maidenOver,
    this.wickets,
    this.createdAt,
    this.updatedAt,
    this.bowler,
  });

  factory Bawler.fromJson(Map<String, dynamic> json) => Bawler(
    id: json["id"],
    matchId: json["match_id"],
    tournamentId: json["tournament_id"],
    teamId: json["team_id"],
    playerId: json["player_id"],
    overs: json["overs"],
    runs: json["runs"],
    maidenOver: json["maiden_over"],
    wickets: json["wickets"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bowler: PlayerBowler.fromJson(json["bowler"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "match_id": matchId,
    "tournament_id": tournamentId,
    "team_id": teamId,
    "player_id": playerId,
    "overs": overs,
    "runs": runs,
    "maiden_over": maidenOver,
    "wickets": wickets,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "bowler": bowler?.toJson(),
  };
}

class PlayerBowler {
  int? id;
  String? playerName;

  PlayerBowler({
    this.id,
    this.playerName,
  });

  factory PlayerBowler.fromJson(Map<String, dynamic> json) => PlayerBowler(
    id: json["id"],
    playerName: json["player_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "player_name": playerName,
  };
}

class Betsmen {
  int? id;
  int? matchId;
  int? tournamentId;
  int? teamId;
  int? playerId;
  int? run;
  int? balls;
  int? sixers;
  int? fours;
  dynamic typeOut;
  dynamic outByPlayerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  PlayerBowler? betsmens;

  Betsmen({
    this.id,
    this.matchId,
    this.tournamentId,
    this.teamId,
    this.playerId,
    this.run,
    this.balls,
    this.sixers,
    this.fours,
    this.typeOut,
    this.outByPlayerId,
    this.createdAt,
    this.updatedAt,
    this.betsmens,
  });

  factory Betsmen.fromJson(Map<String, dynamic> json) => Betsmen(
    id: json["id"],
    matchId: json["match_id"],
    tournamentId: json["tournament_id"],
    teamId: json["team_id"],
    playerId: json["player_id"],
    run: json["run"],
    balls: json["balls"],
    sixers: json["sixers"],
    fours: json["fours"],
    typeOut: json["type_out"],
    outByPlayerId: json["out_by_player_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    betsmens: PlayerBowler.fromJson(json["betsmens"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "match_id": matchId,
    "tournament_id": tournamentId,
    "team_id": teamId,
    "player_id": playerId,
    "run": run,
    "balls": balls,
    "sixers": sixers,
    "fours": fours,
    "type_out": typeOut,
    "out_by_player_id": outByPlayerId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "betsmens": betsmens?.toJson(),
  };
}






