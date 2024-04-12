// To parse this JSON data, do
//
//     final matchLiveDetails = matchLiveDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

MatchLiveDetails matchLiveDetailsFromJson(String str) =>
    MatchLiveDetails.fromJson(json.decode(str));

String matchLiveDetailsToJson(MatchLiveDetails data) =>
    json.encode(data.toJson());

class MatchLiveDetails {
  bool? success;
  String? message;
  MatchLive? data;
  List<Ball>? balls;
  bool? isNewOver;
  bool? isbowlerassigned;
  int? partnershipRun;
  int? partnershipBall;
  int? targetRun;
  String? requiredRunrate;
  String? requiredStatus;
  int? outPlayerId;
  int? overruns;
  bool? isNewInning;
  bool? isStrikerChangeable;
  bool? isNonstrikerChangeable;
  bool? isBowlerChangeable;

  MatchLiveDetails({
    this.success,
    this.message,
    this.data,
    this.balls,
    this.isNewOver,
    this.isbowlerassigned,
    this.partnershipRun,
    this.partnershipBall,
    this.targetRun,
    this.requiredRunrate,
    this.overruns,
    this.requiredStatus,
    this.outPlayerId,
    this.isNewInning,
    this.isStrikerChangeable,
    this.isNonstrikerChangeable,
    this.isBowlerChangeable,
  });

  factory MatchLiveDetails.fromJson(Map<String, dynamic> json) =>
      MatchLiveDetails(
        success: json["success"],
        message: json["message"],
        data: MatchLive.fromJson(json["data"]),
        balls: List<Ball>.from(json["over_balls"].map((x) => Ball.fromJson(x))),
        isNewOver: json["is_new_over"],
        isbowlerassigned: json["is_bowler_assigned"],
        partnershipRun: json["partnership_run"],
        partnershipBall: json["partnership_ball"],
        targetRun: json["target_run"],
        requiredRunrate: json["required_runrate"],
        overruns: json["over_runs"],
        requiredStatus: json["required_status"],
        outPlayerId: json["out_player_id"],
        isNewInning: json["is_new_inning"],
        isStrikerChangeable: json["is_striker_changeable"],
        isNonstrikerChangeable: json["is_nonstriker_changeable"],
        isBowlerChangeable: json["is_bowler_changeable"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "over_balls": List<dynamic>.from(balls!.map((x) => x.toJson())),
        "is_new_over": isNewOver,
        "is_bowler_assigned": isbowlerassigned,
        "partnership_run": partnershipRun,
        "partnership_ball": partnershipBall,
        "target_run": targetRun,
        "required_runrate": requiredRunrate,
        "out_player_id": outPlayerId,
        "over_runs": overruns,
        "required_status": requiredStatus,
        "is_new_inning": isNewInning,
        "is_striker_changeable": isStrikerChangeable,
        "is_nonstriker_changeable": isNonstrikerChangeable,
        "is_bowler_changeable": isBowlerChangeable,
      };
}

class Ball {
  int? ballNumber;
  int? run;
  String? ballType;
  String? outType;
  String? balltag;

  Ball({
    this.ballNumber,
    this.run,
    this.ballType,
    this.outType,
    this.balltag,
  });

  factory Ball.fromJson(Map<String, dynamic> json) => Ball(
        ballNumber: json["ball_number"],
        run: json["run"],
        ballType: json["ball_type"],
        outType: json["out_type"],
        balltag: json["ball_tag"],
      );

  Map<String, dynamic> toJson() => {
        "ball_number": ballNumber,
        "run": run,
        "ball_type": ballType,
        "out_type": outType,
        "ball_tag": balltag,
      };
}

class MatchLive {
  int? id;
  int? createdBy;
  int? tournamentId;
  int? dataTeam1;
  int? team1TotalRun;
  int? team1TotalWickets;
  dynamic team1TotalOver;
  int? team1ExtraRun;
  int? team1Runs;
  int? team2Runs;
  int? team2ExtraRun;
  int? dataTeam2;
  int? team2TotalRun;
  int? team2TotalWickets;
  dynamic team2TotalOver;
  int? inningId;
  int? bettingTeamId;
  int? bowlingTeamId;
  int? overseas;
  String? summary;
  int? stickerPlayerId;
  int? nonstickerPlayerId;
  int? bowlerId;
  dynamic runingOver;
  dynamic description;
  dynamic leaderBorad;
  dynamic pointTable;
  DateTime? matchDate;
  String? matchTime;
  String? umpires;
  DateTime? createdAt;
  DateTime? updatedAt;
  MatchStatus? matchStatus;
  String? breakType;
  dynamic groupId;
  int? isDelete;
  dynamic toss;
  dynamic tossstatus;
  String? wonToss;
  int? wonteamid;
  String? tossElected;
  String? venue;
  int? winningTeamId;
  String? playerOfTheMatchTeam;
  bool? isSuperOver;
  String? buttonLabel;
  String? team1Crr;
  String? team2Crr;
  User? user;
  Tournament? tournament;
  Team? team1;
  Team? team2;
  Tosswonteam? tosswonteam;
  Player? playerstrick;
  Player? playerNonStricker;
  Player? playerBowler;
  StickerScore? stickerScore;
  StickerScore? nonstickerScore;
  BowlerScore? bowlerScore;
  Playerofthematch? playerofthematch;

  String matchdateformat() {
    return DateFormat('dd-MM-yyyy').format(matchDate ?? DateTime.now());
  }

  String matchtimeformat() {
    DateTime parsedTime = DateFormat('HH:mm:ss').parse(matchTime ?? "00:00:00");

    return DateFormat('HH:mm').format(parsedTime);
  }

  String matchdatecon() {
    return DateFormat('dd-MM-yyyy').format(matchDate ?? DateTime.now());
  }

  MatchLive({
    this.id,
    this.createdBy,
    this.tournamentId,
    this.dataTeam1,
    this.team1TotalRun,
    this.team1TotalWickets,
    this.team1TotalOver,
    this.team2ExtraRun,
    this.team1ExtraRun,
    this.team1Runs,
    this.team2Runs,
    this.dataTeam2,
    this.team2TotalRun,
    this.team2TotalWickets,
    this.team2TotalOver,
    this.inningId,
    this.playerOfTheMatchTeam,
    this.bettingTeamId,
    this.bowlingTeamId,
    this.overseas,
    this.summary,
    this.stickerPlayerId,
    this.nonstickerPlayerId,
    this.bowlerId,
    this.runingOver,
    this.description,
    this.leaderBorad,
    this.pointTable,
    this.matchDate,
    this.matchTime,
    this.umpires,
    this.createdAt,
    this.updatedAt,
    this.matchStatus,
    this.breakType,
    this.groupId,
    this.isDelete,
    this.toss,
    this.tossstatus,
    this.wonToss,
    this.wonteamid,
    this.tossElected,
    this.venue,
    this.winningTeamId,
    this.isSuperOver,
    this.buttonLabel,
    this.team1Crr,
    this.team2Crr,
    this.user,
    this.tournament,
    this.team1,
    this.team2,
    this.tosswonteam,
    this.playerstrick,
    this.playerNonStricker,
    this.playerBowler,
    this.stickerScore,
    this.nonstickerScore,
    this.bowlerScore,
    this.playerofthematch,
  });

  factory MatchLive.fromJson(Map<String, dynamic> json) => MatchLive(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentId: json["tournament_id"],
        dataTeam1: json["team_1"],
        team1TotalRun: json["team_1_total_run"],
        team1TotalWickets: json["team_1_total_wickets"],
        team1TotalOver: json["team_1_total_over"],
        team1ExtraRun: json["team_1_extra_run"],
        team2ExtraRun: json["team_2_extra_run"],
        team1Runs: json["team1_runs"],
        team2Runs: json["team2_runs"],
        dataTeam2: json["team_2"],
        team2TotalRun: json["team_2_total_run"],
        team2TotalWickets: json["team_2_total_wickets"],
        playerOfTheMatchTeam: json["player_of_the_match_team"],
        team2TotalOver: json["team_2_total_over"],
        inningId: json["inning_id"] != null ? json["inning_id"] : 0,
        bettingTeamId: json["betting_team_id"],
        bowlingTeamId: json["bowling_team_id"],
        overseas: json["overseas"],
        summary: json["summary"],
        stickerPlayerId: json["sticker_player_id"],
        nonstickerPlayerId: json["nonsticker_player_id"],
        bowlerId: json["bowler_id"],
        runingOver: json["runing_over"],
        description: json["description"],
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
        breakType: json["break_type"],
        groupId: json["group_id"],
        isDelete: json["is_delete"],
        toss: json["toss"],
        tossstatus: json["toss_status"],
        wonToss: json["won_toss"],
        wonteamid: json["won_team_id"],
        tossElected: json["toss_elected"],
        venue: json["venue"],
        winningTeamId: json["winning_team_id"],
        isSuperOver: json["is_super_over"],
        team1Crr: json["team_1_crr"] ?? "0.00",
        team2Crr: json["team_2_crr"] ?? "0.00",
        buttonLabel: json["button_label"],
        user: json["user"] == null ? User() : User.fromJson(json["user"]),
        tournament: json["tournament"] == null
            ? Tournament()
            : Tournament.fromJson(json["tournament"]),
        team1: json["team1"] == null ? Team() : Team.fromJson(json["team1"]),
        team2: json["team2"] == null ? Team() : Team.fromJson(json["team2"]),
        tosswonteam: json["tosswonteam"] == null
            ? Tosswonteam()
            : Tosswonteam.fromJson(json["tosswonteam"]),
        playerstrick: json["playerstrick"] == null
            ? Player()
            : Player.fromJson(json["playerstrick"]),
        playerNonStricker: json["player_non_stricker"] == null
            ? Player()
            : Player.fromJson(json["player_non_stricker"]),
        playerBowler: json["player_bowler"] == null
            ? Player()
            : Player.fromJson(json["player_bowler"]),
        stickerScore: json["sticker_score"] == null
            ? StickerScore()
            : StickerScore.fromJson(json["sticker_score"]),
        nonstickerScore: json["nonsticker_score"] == null
            ? StickerScore()
            : StickerScore.fromJson(json["nonsticker_score"]),
        bowlerScore: json["bowler_score"] == null
            ? BowlerScore()
            : BowlerScore.fromJson(json["bowler_score"]),
        playerofthematch: json["playerofthematch"] == null
            ? Playerofthematch()
            : Playerofthematch.fromJson(json["playerofthematch"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "tournament_id": tournamentId,
        "team_1": dataTeam1,
        "team_1_total_run": team1TotalRun,
        "team_1_total_wickets": team1TotalWickets,
        "team_1_total_over": team1TotalOver,
        "team_1_extra_run": team1ExtraRun,
        "team1_runs": team1Runs,
        "team2_runs": team2Runs,
        "team_2_extra_run": team2ExtraRun,
        "team_2": dataTeam2,
        "team_2_total_run": team2TotalRun,
        "team_2_total_wickets": team2TotalWickets,
        "team_2_total_over": team2TotalOver,
        "inning_id": inningId,
        "betting_team_id": bettingTeamId,
        "bowling_team_id": bowlingTeamId,
        "overseas": overseas,
        "summary": summary,
        "sticker_player_id": stickerPlayerId,
        "player_of_the_match_team": playerOfTheMatchTeam,
        "nonsticker_player_id": nonstickerPlayerId,
        "bowler_id": bowlerId,
        "runing_over": runingOver,
        "description": description,
        "leader_borad": leaderBorad,
        "point_table": pointTable,
        "match_date":
            "${matchDate?.year.toString().padLeft(4, '0')}-${matchDate?.month.toString().padLeft(2, '0')}-${matchDate?.day.toString().padLeft(2, '0')}",
        "match_time": matchTime,
        "umpires": umpires,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "match_status": matchStatus?.toJson(),
        "break_type": breakType,
        "group_id": groupId,
        "is_delete": isDelete,
        "toss": toss,
        "toss_status": tossstatus,
        "won_toss": wonToss,
        "won_team_id": wonteamid,
        "toss_elected": tossElected,
        "venue": venue,
        "winning_team_id": winningTeamId,
        "is_super_over": isSuperOver,
        "team_1_crr": team1Crr,
        "team_2_crr": team2Crr,
        "button_label": buttonLabel,
        "user": user?.toJson(),
        "tournament": tournament?.toJson(),
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
        "tosswonteam": tosswonteam?.toJson(),
        "playerstrick": playerstrick?.toJson(),
        "player_non_stricker": playerNonStricker?.toJson(),
        "player_bowler": playerBowler?.toJson(),
        "sticker_score": stickerScore?.toJson(),
        "nonsticker_score": nonstickerScore?.toJson(),
        "bowler_score": bowlerScore?.toJson(),
        "playerofthematch": playerofthematch?.toJson()
      };
}

class Playerofthematch {
  int? id;
  String? playerName;
  String? logo;
  String? playerShortName;

  Playerofthematch({
    this.id,
    this.playerName,
    this.logo,
    this.playerShortName,
  });

  factory Playerofthematch.fromJson(Map<String, dynamic> json) =>
      Playerofthematch(
        id: json["id"],
        playerName: json["player_name"],
        logo: json["logo"],
        playerShortName: json["player_short_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_name": playerName,
        "logo": logo,
        "player_short_name": playerShortName,
      };
}

class BowlerScore {
  int? id;
  int? matchId;
  int? tournamentId;
  int? teamId;
  int? playerId;
  dynamic overs;
  int? runs;
  int? maidenOver;
  int? wickets;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? economyRate;

  BowlerScore({
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
  });

  factory BowlerScore.fromJson(Map<String, dynamic> json) => BowlerScore(
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

class StickerScore {
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
  dynamic outByBowlerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? outStatusLabel;
  String? strikeRate;
  dynamic outPlayername;

  StickerScore({
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
    this.outPlayername,
  });

  factory StickerScore.fromJson(Map<String, dynamic> json) => StickerScore(
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
        strikeRate: json[""
            "strike_rate"],
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
        "out_playername": outPlayername,
      };
}

class Player {
  int? id;
  String? playerName;

  Player({
    this.id,
    this.playerName,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        playerName: json["player_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_name": playerName,
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
  String? orderSequence;
  int? isDelete;
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
    this.orderSequence,
    this.isDelete,
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
        orderSequence: json["order_sequence"],
        isDelete: json["is_delete"],
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
        "order_sequence": orderSequence,
        "is_delete": isDelete,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Tosswonteam {
  int? id;
  String? teamName;

  Tosswonteam({
    this.id,
    this.teamName,
  });

  factory Tosswonteam.fromJson(Map<String, dynamic> json) => Tosswonteam(
        id: json["id"],
        teamName: json["team_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_name": teamName,
      };
}

class Tournament {
  int? id;
  int? createdBy;
  String? tournamentName;
  String? location;
  int? tournamentTypeId;
  dynamic? cricketType;
  dynamic? ballType;
  String? logo;
  String? description;
  dynamic? stratDate;
  dynamic? endDate;
  dynamic? dueDate;
  String? address;
  String? organizationName;
  dynamic? organizationNumber;
  int? status;
  int? isDelete;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tournament({
    this.id,
    this.createdBy,
    this.tournamentName,
    this.location,
    this.tournamentTypeId,
    this.cricketType,
    this.ballType,
    this.logo,
    this.description,
    this.stratDate,
    this.endDate,
    this.dueDate,
    this.address,
    this.organizationName,
    this.organizationNumber,
    this.status,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentName: json["tournament_name"],
        location: json["location"],
        tournamentTypeId: json["tournament_type_id"],
        cricketType: json["cricket_type"],
        ballType: json["ball_type"],
        logo: json["logo"],
        description: json["description"],
        stratDate: json["strat_date"],
        endDate: json["end_date"],
        dueDate: json["due_date"],
        address: json["address"],
        organizationName: json["organization_name"],
        organizationNumber: json["organization_number"],
        status: json["status"],
        isDelete: json["is_delete"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "tournament_name": tournamentName,
        "location": location,
        "tournament_type_id": tournamentTypeId,
        "cricket_type": cricketType,
        "ball_type": ballType,
        "logo": logo,
        "description": description,
        "strat_date": stratDate,
        "end_date": endDate,
        "due_date": dueDate,
        "address": address,
        "organization_name": organizationName,
        "organization_number": organizationNumber,
        "status": status,
        "is_delete": isDelete,
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
