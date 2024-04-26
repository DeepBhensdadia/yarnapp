import 'dart:convert';
import 'package:intl/intl.dart';

TournamentDetailresponse tournamentDetailresponseFromJson(String str) =>
    TournamentDetailresponse.fromJson(json.decode(str));

String tournamentDetailresponseToJson(TournamentDetailresponse data) =>
    json.encode(data.toJson());

class TournamentDetailresponse {
  bool? success;
  String? message;
  List<Tournament>? tournament;
  List<Matchinfo>? matchinfo;
  List<TeamAudiance>? team;
  TournamentDetailresponse({
    this.success,
    this.message,
    this.tournament,
    this.matchinfo,
    this.team,
  });

  factory TournamentDetailresponse.fromJson(Map<String, dynamic> json) =>
      TournamentDetailresponse(
        success: json["success"],
        message: json["message"],
        tournament: json["tournament"] == null
            ? []
            : List<Tournament>.from(
                json["tournament"].map((x) => Tournament.fromJson(x))),
        matchinfo: json["matchinfo"] == null
            ? []
            : List<Matchinfo>.from(
                json["matchinfo"].map((x) => Matchinfo.fromJson(x))),
        team: json["team"] == null
            ? []
            : List<TeamAudiance>.from(
                json["team"].map((x) => TeamAudiance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "tournament": List<dynamic>.from(tournament!.map((x) => x.toJson())),
        "matchinfo": List<dynamic>.from(matchinfo!.map((x) => x.toJson())),
        "team": List<dynamic>.from(team!.map((x) => x.toJson())),
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

class Matchinfo {
  int? id;
  int? createdBy;
  int? tournamentId;
  int? matchinfoTeam1;
  int? team1TotalRun;
  int? team1TotalWickets;
  String? team1TotalOver;
  int? team1ExtraRun;
  int? matchinfoTeam2;
  int? team2TotalRun;
  int? team2TotalWickets;
  String? team2TotalOver;
  int? team2ExtraRun;
  int? inningId;
  int? stickerPlayerId;
  int? nonstickerPlayerId;
  int? bowlerId;
  String? runingOver;
  int? overseas;
  String? matchType;
  String? description;
  String? summary;
  dynamic leaderBorad;
  dynamic pointTable;
  DateTime? matchDate;
  String? matchTime;
  String? umpires;
  DateTime? createdAt;
  DateTime? updatedAt;
  MatchStatus? matchStatus;
  dynamic groupId;
  int? isDelete;
  dynamic toss;
  String? wonToss;
  String? tossElected;
  dynamic notes;
  String? team1Crr;
  String? team2Crr;
  int? team1Runs;
  int? team2Runs;
  String? tossStatus;
  String? venue;
  TeamUser? user;
  Tournament? tournament;
  TeamAudiance? team1;
  TeamAudiance? team2;

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

  Matchinfo({
    this.id,
    this.createdBy,
    this.tournamentId,
    this.matchinfoTeam1,
    this.team1TotalRun,
    this.team1TotalWickets,
    this.team1TotalOver,
    this.team1ExtraRun,
    this.matchinfoTeam2,
    this.team2TotalRun,
    this.team2TotalWickets,
    this.team2TotalOver,
    this.team2ExtraRun,
    this.inningId,
    this.stickerPlayerId,
    this.nonstickerPlayerId,
    this.bowlerId,
    this.runingOver,
    this.overseas,
    this.matchType,
    this.description,
    this.summary,
    this.leaderBorad,
    this.pointTable,
    this.matchDate,
    this.matchTime,
    this.umpires,
    this.createdAt,
    this.updatedAt,
    this.matchStatus,
    this.groupId,
    this.isDelete,
    this.toss,
    this.wonToss,
    this.tossElected,
    this.notes,
    this.team1Crr,
    this.team2Crr,
    this.team1Runs,
    this.team2Runs,
    this.tossStatus,
    this.venue,
    this.user,
    this.tournament,
    this.team1,
    this.team2,
  });

  factory Matchinfo.fromJson(Map<String, dynamic> json) => Matchinfo(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentId: json["tournament_id"],
        matchinfoTeam1: json["team_1"],
        team1TotalRun: json["team_1_total_run"],
        team1TotalWickets: json["team_1_total_wickets"],
        team1TotalOver: json["team_1_total_over"],
        team1ExtraRun: json["team_1_extra_run"],
        matchinfoTeam2: json["team_2"],
        team2TotalRun: json["team_2_total_run"],
        team2TotalWickets: json["team_2_total_wickets"],
        team2TotalOver: json["team_2_total_over"],
        team2ExtraRun: json["team_2_extra_run"],
        inningId: json["inning_id"],
        stickerPlayerId: json["sticker_player_id"],
        nonstickerPlayerId: json["nonsticker_player_id"],
        bowlerId: json["bowler_id"],
        runingOver: json["runing_over"],
        overseas: json["overseas"],
        matchType: json["match_type"],
        description: json["description"],
        summary: json["summary"],
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
        isDelete: json["is_delete"],
        toss: json["toss"],
        wonToss: json["won_toss"],
        tossElected: json["toss_elected"],
        notes: json["notes"],
        team1Crr: json["team_1_crr"],
        team2Crr: json["team_2_crr"],
        tossStatus: json["toss_status"],
        team1Runs: json["team1_runs"],
        team2Runs: json["team2_runs"],
        venue: json["venue"],
        user:
            json["user"] == null ? TeamUser() : TeamUser.fromJson(json["user"]),
        tournament: json["tournament"] == null
            ? Tournament()
            : Tournament.fromJson(json["tournament"]),
        team1: json["team1"] == null
            ? TeamAudiance()
            : TeamAudiance.fromJson(json["team1"]),
        team2: json["team2"] == null
            ? TeamAudiance()
            : TeamAudiance.fromJson(json["team2"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "tournament_id": tournamentId,
        "team_1": matchinfoTeam1,
        "team_1_total_run": team1TotalRun,
        "team_1_total_wickets": team1TotalWickets,
        "team_1_total_over": team1TotalOver,
        "team_1_extra_run": team1ExtraRun,
        "team_2": matchinfoTeam2,
        "team_2_total_run": team2TotalRun,
        "team_2_total_wickets": team2TotalWickets,
        "team_2_total_over": team2TotalOver,
        "team_2_extra_run": team2ExtraRun,
        "inning_id": inningId,
        "sticker_player_id": stickerPlayerId,
        "nonsticker_player_id": nonstickerPlayerId,
        "bowler_id": bowlerId,
        "runing_over": runingOver,
        "overseas": overseas,
        "match_type": matchType,
        "team1_runs": team1Runs,
        "team2_runs": team2Runs,
        "description": description,
        "summary": summary,
        "leader_borad": leaderBorad,
        "point_table": pointTable,
        "match_date":
            "${matchDate?.year.toString().padLeft(4, '0')}-${matchDate?.month.toString().padLeft(2, '0')}-${matchDate?.day.toString().padLeft(2, '0')}",
        "match_time": matchTime,
        "umpires": umpires,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "match_status": matchStatus?.toJson(),
        "group_id": groupId,
        "is_delete": isDelete,
        "toss": toss,
        "won_toss": wonToss,
        "toss_elected": tossElected,
        "notes": notes,
        "team_1_crr": team1Crr,
        "team_2_crr": team2Crr,
        "toss_status": tossStatus,
        "venue": venue,
        "user": user?.toJson(),
        "tournament": tournament?.toJson(),
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
      };
}

class TeamAudiance {
  int? id;
  String? teamName;
  int? tournamentId;
  int? createdBy;
  int? totalMatches;
  int? totalWin;
  int? totalLoss;
  int? totalDraw;
  int? point;
  String? netRunrate;
  String? teamOwner;
  String? logo;
  String? players;
  String? shortName;
  int? status;
  dynamic orderSequence;
  int? isDelete;
  DateTime? createdAt;
  DateTime? updatedAt;
  TeamUser? user;
  List<Teamplaye>? teamplaye;

  TeamAudiance({
    this.id,
    this.teamName,
    this.tournamentId,
    this.createdBy,
    this.totalMatches,
    this.totalWin,
    this.totalLoss,
    this.totalDraw,
    this.point,
    this.netRunrate,
    this.teamOwner,
    this.logo,
    this.players,
    this.shortName,
    this.status,
    this.orderSequence,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.teamplaye,
  });

  factory TeamAudiance.fromJson(Map<String, dynamic> json) => TeamAudiance(
        id: json["id"],
        teamName: json["team_name"],
        tournamentId: json["tournament_id"],
        createdBy: json["created_by"],
        totalWin: json["total_win"],
        totalLoss: json["total_loss"],
        totalDraw: json["total_draw"],
        point: json["point"],
        netRunrate: json["net_runrate"],
        teamOwner: json["team_owner"],
        logo: json["logo"],
        players: json["players"],
        shortName: json["short_name"],
        status: json["status"],
        orderSequence: json["order_sequence"],
        isDelete: json["is_delete"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user:
            json["user"] == null ? TeamUser() : TeamUser.fromJson(json["user"]),
        teamplaye: json["teamplaye"] == null
            ? []
            : List<Teamplaye>.from(
                json["teamplaye"].map((x) => Teamplaye.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_name": teamName,
        "tournament_id": tournamentId,
        "created_by": createdBy,
        "total_matches": totalMatches,
        "total_win": totalWin,
        "total_loss": totalLoss,
        "total_draw": totalDraw,
        "point": point,
        "net_runrate": netRunrate,
        "team_owner": teamOwner,
        "logo": logo,
        "players": players,
        "short_name": shortName,
        "status": status,
        "order_sequence": orderSequence,
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
  dynamic points;
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

class TeamUser {
  int? id;
  String? name;
  dynamic email;
  dynamic emailVerifiedAt;
  String? isCustomer;
  int? isActive;
  int? isDelete;
  String? deviceId;
  String? mobileNumber;
  dynamic companyName;
  dynamic city;
  DateTime? createdAt;
  DateTime? updatedAt;

  TeamUser({
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

  factory TeamUser.fromJson(Map<String, dynamic> json) => TeamUser(
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

class Tournament {
  int? id;
  int? createdBy;
  String? tournamentName;
  String? location;
  dynamic tournamentTypeId;
  String? logo;
  String? ballType;
  String? cricketType;
  String? description;
  DateTime? stratDate;
  DateTime? endDate;
  dynamic dueDate;
  String? address;
  String? organizationName;
  dynamic organizationNumber;
  int? status;
  int? isDelete;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic tournamenttype;
  TournamentUser? user;

  String startdateformat() {
    return DateFormat('dd-MM-yyyy')
        .format(DateTime.parse(stratDate.toString()));
  }

  String enddateformat() {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(endDate.toString()));
  }

  Tournament({
    this.id,
    this.createdBy,
    this.tournamentName,
    this.location,
    this.tournamentTypeId,
    this.logo,
    this.ballType,
    this.cricketType,
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
    this.tournamenttype,
    this.user,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentName: json["tournament_name"],
        location: json["location"],
        tournamentTypeId: json["tournament_type_id"],
        logo: json["logo"],
        ballType: json["ball_type"],
        cricketType: json["cricket_type"],
        description: json["description"],
        stratDate: DateTime.parse(json["strat_date"]),
        endDate: DateTime.parse(json["end_date"]),
        dueDate: json["due_date"],
        address: json["address"],
        organizationName: json["organization_name"],
        organizationNumber: json["organization_number"],
        status: json["status"],
        isDelete: json["is_delete"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tournamenttype: json["tournamenttype"],
        user: json["user"] != null
            ? TournamentUser.fromJson(json["user"])
            : TournamentUser(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "tournament_name": tournamentName,
        "location": location,
        "tournament_type_id": tournamentTypeId,
        "logo": logo,
        "ball_type": ballType,
        "cricket_type": cricketType,
        "description": description,
        "strat_date": stratDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "due_date": dueDate,
        "address": address,
        "organization_name": organizationName,
        "organization_number": organizationNumber,
        "status": status,
        "is_delete": isDelete,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tournamenttype": tournamenttype,
        "user": user?.toJson(),
      };
}

class TournamentUser {
  int? id;
  String? name;

  TournamentUser({
    this.id,
    this.name,
  });

  factory TournamentUser.fromJson(Map<String, dynamic> json) => TournamentUser(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
