// To parse this JSON data, do
//
//     final matchscroreboardDetails = matchscroreboardDetailsFromJson(jsonString);

import 'dart:convert';

import 'matchlivedetailsresponse.dart';

MatchscroreboardDetails matchscroreboardDetailsFromJson(String str) =>
    MatchscroreboardDetails.fromJson(json.decode(str));

String matchscroreboardDetailsToJson(MatchscroreboardDetails data) =>
    json.encode(data.toJson());

class MatchscroreboardDetails {
  bool? success;
  String? message;
  MatchLive? data;
  List<Betsmen>? betsmens;
  List<Bawler>? bawlers;
  List<Ball>? balls;
  Extra? extra;
  bool? isNewOver;

  MatchscroreboardDetails({
    this.success,
    this.message,
    this.data,
    this.betsmens,
    this.bawlers,
    this.balls,
    this.extra,
    this.isNewOver,
  });

  factory MatchscroreboardDetails.fromJson(Map<String, dynamic> json) =>
      MatchscroreboardDetails(
        success: json["success"],
        message: json["message"],
        data: MatchLive.fromJson(json["data"]),
        betsmens: List<Betsmen>.from(
            json["betsmens"].map((x) => Betsmen.fromJson(x))),
        bawlers:
            List<Bawler>.from(json["bawlers"].map((x) => Bawler.fromJson(x))),
        balls: List<Ball>.from(json["balls"].map((x) => Ball.fromJson(x))),
        extra: Extra.fromJson(json["extra"]),
        isNewOver: json["is_new_over"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "betsmens": List<dynamic>.from(betsmens!.map((x) => x.toJson())),
        "bawlers": List<dynamic>.from(bawlers!.map((x) => x.toJson())),
        "balls": List<dynamic>.from(balls!.map((x) => x.toJson())),
        "extra": extra?.toJson(),
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
  String? economyRate;
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
    this.economyRate,
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
        economyRate: json["economy_rate"],
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
        "economy_rate": economyRate,
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

class OutPlayername {
  int? id;
  String? playerName;
  String? nickname;
  String? logo;
  String? skills;
  dynamic bowlingPace;
  String? bowlingStyle;
  String? battingStyle;
  dynamic firstPreference;
  dynamic wicketKeeper;
  dynamic capExperience;
  int? status;
  int? isDelete;
  int? createdBy;
  int? mobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? weight;
  String? city;
  dynamic bob;
  int? vistiNo;
  String? email;

  OutPlayername({
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

  factory OutPlayername.fromJson(Map<String, dynamic> json) => OutPlayername(
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
        "is_delete": isDelete,
        "created_by": createdBy,
        "mobile_number": mobileNumber,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "weight": weight,
        "city": city,
        "bob": bob,
        "visti_no": vistiNo,
        "email": email,
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
  int? outByBowlerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? outStatusLabel;
  String? strikeRate;
  PlayerBowler? betsmens;
  dynamic outPlayername;

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
    this.outByBowlerId,
    this.createdAt,
    this.updatedAt,
    this.outStatusLabel,
    this.strikeRate,
    this.betsmens,
    this.outPlayername,
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
        outByBowlerId: json["out_by_bowler_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        outStatusLabel: json["out_status_label"],
        strikeRate: json["strike_rate"],
        betsmens: PlayerBowler.fromJson(json["betsmens"]),
        outPlayername: json["out_playername"],
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
        "out_by_bowler_id": outByBowlerId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "out_status_label": outStatusLabel,
        "strike_rate": strikeRate,
        "betsmens": betsmens?.toJson(),
        "out_playername": outPlayername,
      };
}

class Extra {
  String? ball;
  String? by;
  String? lb;
  String? wb;
  String? nb;
  int? total;

  Extra({
    this.ball,
    this.by,
    this.lb,
    this.wb,
    this.nb,
    this.total,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        ball: json["ball"].toString(),
        by: json["by"].toString(),
        lb: json["lb"].toString(),
        wb: json["wb"].toString(),
        nb: json["nb"].toString(),
        total: json["total"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "ball": ball,
        "by": by,
        "lb": lb,
        "wb": wb,
        "nb": nb,
        "total": total,
      };
}
