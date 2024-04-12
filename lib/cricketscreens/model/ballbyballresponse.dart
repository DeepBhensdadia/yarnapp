// To parse this JSON data, do
//
//     final ballbyballresponse = ballbyballresponseFromJson(jsonString);

import 'dart:convert';

Ballbyballresponse ballbyballresponseFromJson(String str) =>
    Ballbyballresponse.fromJson(json.decode(str));

String ballbyballresponseToJson(Ballbyballresponse data) =>
    json.encode(data.toJson());

class Ballbyballresponse {
  bool? success;
  String? message;
  List<Overs>? data;
  BallTeam? team1;
  BallTeam? team2;

  Ballbyballresponse({
    this.success,
    this.message,
    this.data,
    this.team1,
    this.team2,
  });

  factory Ballbyballresponse.fromJson(Map<String, dynamic> json) =>
      Ballbyballresponse(
        success: json["success"],
        message: json["message"],
        data: List<Overs>.from(json["data"].map((x) => Overs.fromJson(x))),
        team1: BallTeam.fromJson(json["team_1"]),
        team2: BallTeam.fromJson(json["team_2"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "team_1": team1!.toJson(),
        "team_2": team2!.toJson(),
      };
}

class Overs {
  String? overName;
  List<Ballovers>? balls;
  int? totalRun;
  Bowler? bowler;

  Overs({
    this.overName,
    this.balls,
    this.totalRun,
    this.bowler,
  });

  factory Overs.fromJson(Map<String, dynamic> json) => Overs(
        overName: json["over_name"],
        balls: List<Ballovers>.from(
            json["balls"].map((x) => Ballovers.fromJson(x))),
        totalRun: json["total_run"],
        bowler: Bowler.fromJson(json["bowler"]),
      );

  Map<String, dynamic> toJson() => {
        "over_name": overName,
        "balls": List<dynamic>.from(balls!.map((x) => x.toJson())),
        "total_run": totalRun,
        "bowler": bowler?.toJson(),
      };
}

class Bowler {
  int? id;
  String? playerName;
  String? nickname;
  String? playerShortName;

  Bowler({
    this.id,
    this.playerName,
    this.nickname,
    this.playerShortName,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        id: json["id"],
        playerName: json["player_name"],
        nickname: json["nickname"],
        playerShortName: json["player_short_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_name": playerName,
        "nickname": nickname,
        "player_short_name": playerShortName,
      };
}

class Ballovers {
  int? ballNumber;
  int? teamId;
  int? run;
  String? ballType;
  String? outType;
  String? balltag;
  int? isExtra;

  Ballovers({
    this.ballNumber,
    this.teamId,
    this.run,
    this.ballType,
    this.outType,
    this.balltag,
    this.isExtra,
  });

  factory Ballovers.fromJson(Map<String, dynamic> json) => Ballovers(
        ballNumber: json["ball_number"],
        teamId: json["team_id"],
        run: json["run"],
        ballType: json["ball_type"],
        balltag: json["ball_tag"],
        outType: json["out_type"],
        isExtra: json["is_extra"],
      );

  Map<String, dynamic> toJson() => {
        "ball_number": ballNumber,
        "team_id": teamId,
        "run": run,
        "ball_tag": balltag,
        "out_type": outType,
        "is_extra": isExtra,
      };
}

class BallTeam {
  TeamClass? team;
  List<Overs>? overs;

  BallTeam({
    this.team,
    this.overs,
  });

  factory BallTeam.fromJson(Map<String, dynamic> json) => BallTeam(
        team: TeamClass.fromJson(json["team"]),
        overs: List<Overs>.from(json["overs"].map((x) => Overs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "overs": List<dynamic>.from(overs!.map((x) => x.toJson())),
      };
}

class TeamClass {
  int? id;
  String? teamName;
  dynamic? teamOwner;
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

  TeamClass({
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
  });

  factory TeamClass.fromJson(Map<String, dynamic> json) => TeamClass(
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
      };
}
