// import 'dart:convert';
//
// import 'package:intl/intl.dart';
//
// MatchLiveSuperOver matchLiveSuperOverFromJson(String str) => MatchLiveSuperOver.fromJson(json.decode(str));
//
// String matchLiveSuperOverToJson(MatchLiveSuperOver data) => json.encode(data.toJson());
//
// class MatchLiveSuperOver {
//   bool? success;
//   String? message;
//   MatchLiveSuper? data;
//   List<Superover>? superovers;
//   List<dynamic>? overBalls;
//   int? overRuns;
//   int? partnershipRun;
//   int? partnershipBall;
//   bool? isNewOver;
//   bool? isBowlerAssigned;
//   int? targetRun;
//   int? outPlayerId;
//   String? requiredRunrate;
//   String? requiredStatus;
//   bool? isNewInning;
//   bool? isStrikerChangeable;
//   bool? isNonstrikerChangeable;
//   bool? isBowlerChangeable;
//
//   MatchLiveSuperOver({
//     this.success,
//     this.message,
//     this.data,
//     this.superovers,
//     this.overBalls,
//     this.overRuns,
//     this.partnershipRun,
//     this.partnershipBall,
//     this.isNewOver,
//     this.isBowlerAssigned,
//     this.targetRun,
//     this.outPlayerId,
//     this.requiredRunrate,
//     this.requiredStatus,
//     this.isNewInning,
//     this.isStrikerChangeable,
//     this.isNonstrikerChangeable,
//     this.isBowlerChangeable,
//   });
//
//   factory MatchLiveSuperOver.fromJson(Map<String, dynamic> json) => MatchLiveSuperOver(
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] == null ? MatchLiveSuper() : MatchLiveSuper.fromJson(json["data"]),
//     superovers: List<Superover>.from(json["superovers"].map((x) => Superover.fromJson(x))),
//     overBalls: List<dynamic>.from(json["over_balls"].map((x) => x)),
//     overRuns: json["over_runs"],
//     partnershipRun: json["partnership_run"],
//     partnershipBall: json["partnership_ball"],
//     isNewOver: json["is_new_over"],
//     isBowlerAssigned: json["is_bowler_assigned"],
//     targetRun: json["target_run"],
//     outPlayerId: json["out_player_id"],
//     requiredRunrate: json["required_runrate"],
//     requiredStatus: json["required_status"],
//     isNewInning: json["is_new_inning"],
//     isStrikerChangeable: json["is_striker_changeable"],
//     isNonstrikerChangeable: json["is_nonstriker_changeable"],
//     isBowlerChangeable: json["is_bowler_changeable"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": data?.toJson(),
//     "superovers": List<dynamic>.from(superovers!.map((x) => x.toJson())),
//     "over_balls": List<dynamic>.from(overBalls!.map((x) => x)),
//     "over_runs": overRuns,
//     "partnership_run": partnershipRun,
//     "partnership_ball": partnershipBall,
//     "is_new_over": isNewOver,
//     "is_bowler_assigned": isBowlerAssigned,
//     "target_run": targetRun,
//     "out_player_id": outPlayerId,
//     "required_runrate": requiredRunrate,
//     "required_status": requiredStatus,
//     "is_new_inning": isNewInning,
//     "is_striker_changeable": isStrikerChangeable,
//     "is_nonstriker_changeable": isNonstrikerChangeable,
//     "is_bowler_changeable": isBowlerChangeable,
//   };
// }
//
// class MatchLiveSuper {
//   int? id;
//   int? createdBy;
//   int? tournamentId;
//   int? dataTeam1;
//   int? team1TotalRun;
//   int? team1TotalWickets;
//   dynamic team1TotalOver;
//   int? team1ExtraRun;
//   int? team1Point;
//   int? dataTeam2;
//   int? team2TotalRun;
//   int? team2TotalWickets;
//   String? team2TotalOver;
//   int? team2ExtraRun;
//   int? team2Point;
//   int? inningId;
//   dynamic stickerPlayerId;
//   dynamic nonstickerPlayerId;
//   dynamic bowlerId;
//   dynamic runingOver;
//   int? overseas;
//   dynamic totalPlayer;
//   String? matchType;
//   String? description;
//   String? summary;
//   dynamic leaderBorad;
//   dynamic pointTable;
//   DateTime? matchDate;
//   String? matchTime;
//   String? umpires;
//   String? createdAt;
//   String? updatedAt;
//   MatchStatus? matchStatus;
//   dynamic groupId;
//   int? isDelete;
//   String? toss;
//   String? wonToss;
//   dynamic wonTeamId;
//   dynamic playerOfTheMatch;
//   String? tossElected;
//   String? venue;
//   dynamic notes;
//   bool? isSuperOver;
//   int? parentId;
//   dynamic playerOfTheMatchTeam;
//   int? bettingTeamId;
//   int? bowlingTeamId;
//   int? winningTeamId;
//   String? buttonLabel;
//   String? team1Crr;
//   String? team2Crr;
//   String? tossStatus;
//   int? team1Runs;
//   int? team2Runs;
//   String? datesTimes;
//   User? user;
//   Tournament? tournament;
//   Team? team1;
//   Team? team2;
//   Tosswonteam? tosswonteam;
//   dynamic playerstrick;
//   dynamic playerNonStricker;
//   dynamic playerBowler;
//   dynamic stickerScore;
//   dynamic nonstickerScore;
//   dynamic bowlerScore;
//   dynamic playerofthematch;
//
//   MatchLiveSuper({
//     this.id,
//     this.createdBy,
//     this.tournamentId,
//     this.dataTeam1,
//     this.team1TotalRun,
//     this.team1TotalWickets,
//     this.team1TotalOver,
//     this.team1ExtraRun,
//     this.team1Point,
//     this.dataTeam2,
//     this.team2TotalRun,
//     this.team2TotalWickets,
//     this.team2TotalOver,
//     this.team2ExtraRun,
//     this.team2Point,
//     this.inningId,
//     this.stickerPlayerId,
//     this.nonstickerPlayerId,
//     this.bowlerId,
//     this.runingOver,
//     this.overseas,
//     this.totalPlayer,
//     this.matchType,
//     this.description,
//     this.summary,
//     this.leaderBorad,
//     this.pointTable,
//     this.matchDate,
//     this.matchTime,
//     this.umpires,
//     this.createdAt,
//     this.updatedAt,
//     this.matchStatus,
//     this.groupId,
//     this.isDelete,
//     this.toss,
//     this.wonToss,
//     this.wonTeamId,
//     this.playerOfTheMatch,
//     this.tossElected,
//     this.venue,
//     this.notes,
//     this.isSuperOver,
//     this.parentId,
//     this.playerOfTheMatchTeam,
//     this.bettingTeamId,
//     this.bowlingTeamId,
//     this.winningTeamId,
//     this.buttonLabel,
//     this.team1Crr,
//     this.team2Crr,
//     this.tossStatus,
//     this.team1Runs,
//     this.team2Runs,
//     this.datesTimes,
//     this.user,
//     this.tournament,
//     this.team1,
//     this.team2,
//     this.tosswonteam,
//     this.playerstrick,
//     this.playerNonStricker,
//     this.playerBowler,
//     this.stickerScore,
//     this.nonstickerScore,
//     this.bowlerScore,
//     this.playerofthematch,
//   });
//
//   factory MatchLiveSuper.fromJson(Map<String, dynamic> json) => MatchLiveSuper(
//     id: json["id"],
//     createdBy: json["created_by"],
//     tournamentId: json["tournament_id"],
//     dataTeam1: json["team_1"],
//     team1TotalRun: json["team_1_total_run"],
//     team1TotalWickets: json["team_1_total_wickets"],
//     team1TotalOver: json["team_1_total_over"],
//     team1ExtraRun: json["team_1_extra_run"],
//     team1Point: json["team_1_point"],
//     dataTeam2: json["team_2"],
//     team2TotalRun: json["team_2_total_run"],
//     team2TotalWickets: json["team_2_total_wickets"],
//     team2TotalOver: json["team_2_total_over"],
//     team2ExtraRun: json["team_2_extra_run"],
//     team2Point: json["team_2_point"],
//     inningId: json["inning_id"],
//     stickerPlayerId: json["sticker_player_id"],
//     nonstickerPlayerId: json["nonsticker_player_id"],
//     bowlerId: json["bowler_id"],
//     runingOver: json["runing_over"],
//     overseas: json["overseas"],
//     totalPlayer: json["total_player"],
//     matchType: json["match_type"],
//     description: json["description"],
//     summary: json["summary"],
//     leaderBorad: json["leader_borad"],
//     pointTable: json["point_table"],
//     matchDate: DateTime.parse(json["match_date"]),
//     matchTime: json["match_time"],
//     umpires: json["umpires"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     matchStatus: json["match_status"] == null
//         ? MatchStatus()
//         : MatchStatus.fromJson(json["match_status"]),
//     groupId: json["group_id"],
//     isDelete: json["is_delete"],
//     toss: json["toss"],
//     wonToss: json["won_toss"],
//     wonTeamId: json["won_team_id"],
//     playerOfTheMatch: json["player_of_the_match"],
//     tossElected: json["toss_elected"],
//     venue: json["venue"],
//     notes: json["notes"],
//     isSuperOver: json["is_super_over"],
//     parentId: json["parent_id"],
//     playerOfTheMatchTeam: json["player_of_the_match_team"],
//     bettingTeamId: json["betting_team_id"],
//     bowlingTeamId: json["bowling_team_id"],
//     winningTeamId: json["winning_team_id"],
//     buttonLabel: json["button_label"],
//     team1Crr: json["team_1_crr"],
//     team2Crr: json["team_2_crr"],
//     tossStatus: json["toss_status"],
//     team1Runs: json["team1_runs"],
//     team2Runs: json["team2_runs"],
//     datesTimes: json["dates_times"],
//     user: json["user"] == null
//         ? User()
//         : User.fromJson(json["user"]),
//     tournament: json["tournament"] == null ? Tournament() : Tournament.fromJson(json["tournament"]),
//     team1: json["team1"] == null ? Team() : Team.fromJson(json["team1"]),
//     team2: json["team2"] == null ? Team() : Team.fromJson(json["team2"]),
//     tosswonteam: json["tosswonteam"] == null ? Tosswonteam() : Tosswonteam.fromJson(json["tosswonteam"]),
//     playerstrick: json["playerstrick"],
//     playerNonStricker: json["player_non_stricker"],
//     playerBowler: json["player_bowler"],
//     stickerScore: json["sticker_score"],
//     nonstickerScore: json["nonsticker_score"],
//     bowlerScore: json["bowler_score"],
//     playerofthematch: json["playerofthematch"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "created_by": createdBy,
//     "tournament_id": tournamentId,
//     "team_1": dataTeam1,
//     "team_1_total_run": team1TotalRun,
//     "team_1_total_wickets": team1TotalWickets,
//     "team_1_total_over": team1TotalOver,
//     "team_1_extra_run": team1ExtraRun,
//     "team_1_point": team1Point,
//     "team_2": dataTeam2,
//     "team_2_total_run": team2TotalRun,
//     "team_2_total_wickets": team2TotalWickets,
//     "team_2_total_over": team2TotalOver,
//     "team_2_extra_run": team2ExtraRun,
//     "team_2_point": team2Point,
//     "inning_id": inningId,
//     "sticker_player_id": stickerPlayerId,
//     "nonsticker_player_id": nonstickerPlayerId,
//     "bowler_id": bowlerId,
//     "runing_over": runingOver,
//     "overseas": overseas,
//     "total_player": totalPlayer,
//     "match_type": matchType,
//     "description": description,
//     "summary": summary,
//     "leader_borad": leaderBorad,
//     "point_table": pointTable,
//     "match_date": "${matchDate!.year.toString().padLeft(4, '0')}-${matchDate!.month.toString().padLeft(2, '0')}-${matchDate!.day.toString().padLeft(2, '0')}",
//     "match_time": matchTime,
//     "umpires": umpires,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "match_status": matchStatus!.toJson(),
//     "group_id": groupId,
//     "is_delete": isDelete,
//     "toss": toss,
//     "won_toss": wonToss,
//     "won_team_id": wonTeamId,
//     "player_of_the_match": playerOfTheMatch,
//     "toss_elected": tossElected,
//     "venue": venue,
//     "notes": notes,
//     "is_super_over": isSuperOver,
//     "parent_id": parentId,
//     "player_of_the_match_team": playerOfTheMatchTeam,
//     "betting_team_id": bettingTeamId,
//     "bowling_team_id": bowlingTeamId,
//     "winning_team_id": winningTeamId,
//     "button_label": buttonLabel,
//     "team_1_crr": team1Crr,
//     "team_2_crr": team2Crr,
//     "toss_status": tossStatus,
//     "team1_runs": team1Runs,
//     "team2_runs": team2Runs,
//     "dates_times": datesTimes,
//     "user": user!.toJson(),
//     "tournament": tournament!.toJson(),
//     "team1": team1!.toJson(),
//     "team2": team2!.toJson(),
//     "tosswonteam": tosswonteam!.toJson(),
//     "playerstrick": playerstrick,
//     "player_non_stricker": playerNonStricker,
//     "player_bowler": playerBowler,
//     "sticker_score": stickerScore,
//     "nonsticker_score": nonstickerScore,
//     "bowler_score": bowlerScore,
//     "playerofthematch": playerofthematch,
//   };
// }
//
// class MatchStatus {
//   int? id;
//   String? name;
//
//   MatchStatus({
//     this.id,
//     this.name,
//   });
//
//   factory MatchStatus.fromJson(Map<String, dynamic> json) => MatchStatus(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }
//
// class Team {
//   int? id;
//   String? teamName;
//   String? teamOwner;
//   int? tournamentId;
//   int? createdBy;
//   String? logo;
//   String? players;
//   String? shortName;
//   int? status;
//   String? groupId;
//   int? totalMatches;
//   int? totalWin;
//   int? totalLoss;
//   int? totalDraw;
//   int? point;
//   String? netRunrate;
//   int? isDelete;
//   String? createdAt;
//   String? updatedAt;
//   String? playerShortName;
//   int? totalCount;
//   int? totalPlayedCount;
//   int? totalWinCount;
//   int? totalLossCount;
//   int? totalDrawCount;
//   int? points;
//   String? nrr;
//   String? nrrString;
//   List<Team1Element>? team1;
//   List<Team1Element>? team2;
//
//   Team({
//     this.id,
//     this.teamName,
//     this.teamOwner,
//     this.tournamentId,
//     this.createdBy,
//     this.logo,
//     this.players,
//     this.shortName,
//     this.status,
//     this.groupId,
//     this.totalMatches,
//     this.totalWin,
//     this.totalLoss,
//     this.totalDraw,
//     this.point,
//     this.netRunrate,
//     this.isDelete,
//     this.createdAt,
//     this.updatedAt,
//     this.playerShortName,
//     this.totalCount,
//     this.totalPlayedCount,
//     this.totalWinCount,
//     this.totalLossCount,
//     this.totalDrawCount,
//     this.points,
//     this.nrr,
//     this.nrrString,
//     this.team1,
//     this.team2,
//   });
//
//   factory Team.fromJson(Map<String, dynamic> json) => Team(
//     id: json["id"],
//     teamName: json["team_name"],
//     teamOwner: json["team_owner"],
//     tournamentId: json["tournament_id"],
//     createdBy: json["created_by"],
//     logo: json["logo"],
//     players: json["players"],
//     shortName: json["short_name"],
//     status: json["status"],
//     groupId: json["group_id"],
//     totalMatches: json["total_matches"],
//     totalWin: json["total_win"],
//     totalLoss: json["total_loss"],
//     totalDraw: json["total_draw"],
//     point: json["point"],
//     netRunrate: json["net_runrate"],
//     isDelete: json["is_delete"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     playerShortName: json["player_short_name"],
//     totalCount: json["total_count"],
//     totalPlayedCount: json["total_played_count"],
//     totalWinCount: json["total_win_count"],
//     totalLossCount: json["total_loss_count"],
//     totalDrawCount: json["total_draw_count"],
//     points: json["points"],
//     nrr: json["nrr"],
//     nrrString: json["nrr_string"],
//     team1: List<Team1Element>.from(json["team_1"].map((x) => Team1Element.fromJson(x))),
//     team2: List<Team1Element>.from(json["team_2"].map((x) => Team1Element.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "team_name": teamName,
//     "team_owner": teamOwner,
//     "tournament_id": tournamentId,
//     "created_by": createdBy,
//     "logo": logo,
//     "players": players,
//     "short_name": shortName,
//     "status": status,
//     "group_id": groupId,
//     "total_matches": totalMatches,
//     "total_win": totalWin,
//     "total_loss": totalLoss,
//     "total_draw": totalDraw,
//     "point": point,
//     "net_runrate": netRunrate,
//     "is_delete": isDelete,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "player_short_name": playerShortName,
//     "total_count": totalCount,
//     "total_played_count": totalPlayedCount,
//     "total_win_count": totalWinCount,
//     "total_loss_count": totalLossCount,
//     "total_draw_count": totalDrawCount,
//     "points": points,
//     "nrr": nrr,
//     "nrr_string": nrrString,
//     "team_1": List<dynamic>.from(team1!.map((x) => x.toJson())),
//     "team_2": List<dynamic>.from(team2!.map((x) => x.toJson())),
//   };
// }
//
// class Team1Element {
//   int? id;
//   int? createdBy;
//   int? tournamentId;
//   int? team1;
//   int? team1TotalRun;
//   int? team1TotalWickets;
//   String? team1TotalOver;
//   int? team1ExtraRun;
//   int? team1Point;
//   int? team2;
//   int? team2TotalRun;
//   int? team2TotalWickets;
//   String? team2TotalOver;
//   int? team2ExtraRun;
//   int? team2Point;
//   dynamic wonTeamId;
//   int? inningId;
//   int? overseas;
//   String? team1Crr;
//   String? team2Crr;
//   dynamic tossStatus;
//   int? team1Runs;
//   int? team2Runs;
//   String? datesTimes;
//
//   Team1Element({
//     this.id,
//     this.createdBy,
//     this.tournamentId,
//     this.team1,
//     this.team1TotalRun,
//     this.team1TotalWickets,
//     this.team1TotalOver,
//     this.team1ExtraRun,
//     this.team1Point,
//     this.team2,
//     this.team2TotalRun,
//     this.team2TotalWickets,
//     this.team2TotalOver,
//     this.team2ExtraRun,
//     this.team2Point,
//     this.wonTeamId,
//     this.inningId,
//     this.overseas,
//     this.team1Crr,
//     this.team2Crr,
//     this.tossStatus,
//     this.team1Runs,
//     this.team2Runs,
//     this.datesTimes,
//   });
//
//   factory Team1Element.fromJson(Map<String, dynamic> json) => Team1Element(
//     id: json["id"],
//     createdBy: json["created_by"],
//     tournamentId: json["tournament_id"],
//     team1: json["team_1"],
//     team1TotalRun: json["team_1_total_run"],
//     team1TotalWickets: json["team_1_total_wickets"],
//     team1TotalOver: json["team_1_total_over"],
//     team1ExtraRun: json["team_1_extra_run"],
//     team1Point: json["team_1_point"],
//     team2: json["team_2"],
//     team2TotalRun: json["team_2_total_run"],
//     team2TotalWickets: json["team_2_total_wickets"],
//     team2TotalOver: json["team_2_total_over"],
//     team2ExtraRun: json["team_2_extra_run"],
//     team2Point: json["team_2_point"],
//     wonTeamId: json["won_team_id"],
//     inningId: json["inning_id"],
//     overseas: json["overseas"],
//     team1Crr: json["team_1_crr"],
//     team2Crr: json["team_2_crr"],
//     tossStatus: json["toss_status"],
//     team1Runs: json["team1_runs"],
//     team2Runs: json["team2_runs"],
//     datesTimes: json["dates_times"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "created_by": createdBy,
//     "tournament_id": tournamentId,
//     "team_1": team1,
//     "team_1_total_run": team1TotalRun,
//     "team_1_total_wickets": team1TotalWickets,
//     "team_1_total_over": team1TotalOver,
//     "team_1_extra_run": team1ExtraRun,
//     "team_1_point": team1Point,
//     "team_2": team2,
//     "team_2_total_run": team2TotalRun,
//     "team_2_total_wickets": team2TotalWickets,
//     "team_2_total_over": team2TotalOver,
//     "team_2_extra_run": team2ExtraRun,
//     "team_2_point": team2Point,
//     "won_team_id": wonTeamId,
//     "inning_id": inningId,
//     "overseas": overseas,
//     "team_1_crr": team1Crr,
//     "team_2_crr": team2Crr,
//     "toss_status": tossStatus,
//     "team1_runs": team1Runs,
//     "team2_runs": team2Runs,
//     "dates_times": datesTimes,
//   };
// }
//
// class Tosswonteam {
//   int? id;
//   String? teamName;
//   String? playerShortName;
//   int? totalCount;
//   int? totalPlayedCount;
//   int? totalWinCount;
//   int? totalLossCount;
//   int? totalDrawCount;
//   int? points;
//   String? nrr;
//   String? nrrString;
//   List<Team1Element>? team1;
//   List<Team1Element>? team2;
//
//   Tosswonteam({
//     this.id,
//     this.teamName,
//     this.playerShortName,
//     this.totalCount,
//     this.totalPlayedCount,
//     this.totalWinCount,
//     this.totalLossCount,
//     this.totalDrawCount,
//     this.points,
//     this.nrr,
//     this.nrrString,
//     this.team1,
//     this.team2,
//   });
//
//   factory Tosswonteam.fromJson(Map<String, dynamic> json) => Tosswonteam(
//     id: json["id"],
//     teamName: json["team_name"],
//     playerShortName: json["player_short_name"],
//     totalCount: json["total_count"],
//     totalPlayedCount: json["total_played_count"],
//     totalWinCount: json["total_win_count"],
//     totalLossCount: json["total_loss_count"],
//     totalDrawCount: json["total_draw_count"],
//     points: json["points"],
//     nrr: json["nrr"],
//     nrrString: json["nrr_string"],
//     team1: List<Team1Element>.from(json["team_1"].map((x) => Team1Element.fromJson(x))),
//     team2: List<Team1Element>.from(json["team_2"].map((x) => Team1Element.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "team_name": teamName,
//     "player_short_name": playerShortName,
//     "total_count": totalCount,
//     "total_played_count": totalPlayedCount,
//     "total_win_count": totalWinCount,
//     "total_loss_count": totalLossCount,
//     "total_draw_count": totalDrawCount,
//     "points": points,
//     "nrr": nrr,
//     "nrr_string": nrrString,
//     "team_1": List<dynamic>.from(team1!.map((x) => x.toJson())),
//     "team_2": List<dynamic>.from(team2!.map((x) => x.toJson())),
//   };
// }
//
// class Tournament {
//   int? id;
//   int? createdBy;
//   String? tournamentName;
//   String? location;
//   dynamic tournamentTypeId;
//   String? ballType;
//   String? cricketType;
//   String? logo;
//   String? description;
//   String? stratDate;
//   String? endDate;
//   dynamic dueDate;
//   String? address;
//   String? organizationName;
//   dynamic organizationNumber;
//   int? status;
//   int? isDelete;
//   String? createdAt;
//   String? updatedAt;
//
//   Tournament({
//     this.id,
//     this.createdBy,
//     this.tournamentName,
//     this.location,
//     this.tournamentTypeId,
//     this.ballType,
//     this.cricketType,
//     this.logo,
//     this.description,
//     this.stratDate,
//     this.endDate,
//     this.dueDate,
//     this.address,
//     this.organizationName,
//     this.organizationNumber,
//     this.status,
//     this.isDelete,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
//     id: json["id"],
//     createdBy: json["created_by"],
//     tournamentName: json["tournament_name"],
//     location: json["location"],
//     tournamentTypeId: json["tournament_type_id"],
//     ballType: json["ball_type"],
//     cricketType: json["cricket_type"],
//     logo: json["logo"],
//     description: json["description"],
//     stratDate: json["strat_date"],
//     endDate: json["end_date"],
//     dueDate: json["due_date"],
//     address: json["address"],
//     organizationName: json["organization_name"],
//     organizationNumber: json["organization_number"],
//     status: json["status"],
//     isDelete: json["is_delete"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "created_by": createdBy,
//     "tournament_name": tournamentName,
//     "location": location,
//     "tournament_type_id": tournamentTypeId,
//     "ball_type": ballType,
//     "cricket_type": cricketType,
//     "logo": logo,
//     "description": description,
//     "strat_date": stratDate,
//     "end_date": endDate,
//     "due_date": dueDate,
//     "address": address,
//     "organization_name": organizationName,
//     "organization_number": organizationNumber,
//     "status": status,
//     "is_delete": isDelete,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class User {
//   int? id;
//   String? name;
//   String? email;
//   dynamic emailVerifiedAt;
//   String? isCustomer;
//   int? isActive;
//   int? isDelete;
//   String? deviceId;
//   String? mobileNumber;
//   dynamic companyName;
//   dynamic city;
//   String? createdAt;
//   String? updatedAt;
//
//   User({
//     this.id,
//     this.name,
//     this.email,
//     this.emailVerifiedAt,
//     this.isCustomer,
//     this.isActive,
//     this.isDelete,
//     this.deviceId,
//     this.mobileNumber,
//     this.companyName,
//     this.city,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     emailVerifiedAt: json["email_verified_at"],
//     isCustomer: json["is_customer"],
//     isActive: json["is_active"],
//     isDelete: json["is_delete"],
//     deviceId: json["device_id"],
//     mobileNumber: json["mobile_number"],
//     companyName: json["company_name"],
//     city: json["city"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "email_verified_at": emailVerifiedAt,
//     "is_customer": isCustomer,
//     "is_active": isActive,
//     "is_delete": isDelete,
//     "device_id": deviceId,
//     "mobile_number": mobileNumber,
//     "company_name": companyName,
//     "city": city,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class Superover {
//   int? id;
//   int? createdBy;
//   int? tournamentId;
//   int? superoverTeam1;
//   int? team1TotalRun;
//   int? team1TotalWickets;
//   String? team1TotalOver;
//   int? team1ExtraRun;
//   int? team1Point;
//   int? superoverTeam2;
//   int? team2TotalRun;
//   int? team2TotalWickets;
//   String? team2TotalOver;
//   int? team2ExtraRun;
//   int? team2Point;
//   int? inningId;
//   dynamic stickerPlayerId;
//   dynamic nonstickerPlayerId;
//   dynamic bowlerId;
//   String? runingOver;
//   int? overseas;
//   dynamic totalPlayer;
//   String? matchType;
//   String? description;
//   dynamic summary;
//   dynamic leaderBorad;
//   dynamic pointTable;
//   DateTime? matchDate;
//   String? matchTime;
//   String? umpires;
//   String? createdAt;
//   String? updatedAt;
//   MatchStatus? matchStatus;
//   dynamic groupId;
//   int? isDelete;
//   dynamic toss;
//   dynamic wonToss;
//   dynamic wonTeamId;
//   dynamic playerOfTheMatch;
//   dynamic tossElected;
//   String? venue;
//   dynamic notes;
//   int? isSuperOver;
//   int? parentId;
//   String? team1Crr;
//   String? team2Crr;
//   dynamic tossStatus;
//   int? team1Runs;
//   int? team2Runs;
//   String? datesTimes;
//   User? user;
//   Tournament? tournament;
//   Team? team1;
//   Team? team2;
//
//   String matchdatecon() {
//     return DateFormat('dd-MM-yyyy').format(matchDate ?? DateTime.now());
//   }
//
//   String matchdateformat() {
//     return DateFormat('dd-MM-yyyy').format(matchDate ?? DateTime.now());
//   }
//
//   String matchtimeformat() {
//     DateTime parsedTime = DateFormat('HH:mm:ss').parse(matchTime ?? "00:00:00");
//
//     return DateFormat('HH:mm').format(parsedTime);
//   }
//
//   Superover({
//     this.id,
//     this.createdBy,
//     this.tournamentId,
//     this.superoverTeam1,
//     this.team1TotalRun,
//     this.team1TotalWickets,
//     this.team1TotalOver,
//     this.team1ExtraRun,
//     this.team1Point,
//     this.superoverTeam2,
//     this.team2TotalRun,
//     this.team2TotalWickets,
//     this.team2TotalOver,
//     this.team2ExtraRun,
//     this.team2Point,
//     this.inningId,
//     this.stickerPlayerId,
//     this.nonstickerPlayerId,
//     this.bowlerId,
//     this.runingOver,
//     this.overseas,
//     this.totalPlayer,
//     this.matchType,
//     this.description,
//     this.summary,
//     this.leaderBorad,
//     this.pointTable,
//     this.matchDate,
//     this.matchTime,
//     this.umpires,
//     this.createdAt,
//     this.updatedAt,
//     this.matchStatus,
//     this.groupId,
//     this.isDelete,
//     this.toss,
//     this.wonToss,
//     this.wonTeamId,
//     this.playerOfTheMatch,
//     this.tossElected,
//     this.venue,
//     this.notes,
//     this.isSuperOver,
//     this.parentId,
//     this.team1Crr,
//     this.team2Crr,
//     this.tossStatus,
//     this.team1Runs,
//     this.team2Runs,
//     this.datesTimes,
//     this.user,
//     this.tournament,
//     this.team1,
//     this.team2,
//   });
//
//   factory Superover.fromJson(Map<String, dynamic> json) => Superover(
//     id: json["id"],
//     createdBy: json["created_by"],
//     tournamentId: json["tournament_id"],
//     superoverTeam1: json["team_1"],
//     team1TotalRun: json["team_1_total_run"],
//     team1TotalWickets: json["team_1_total_wickets"],
//     team1TotalOver: json["team_1_total_over"],
//     team1ExtraRun: json["team_1_extra_run"],
//     team1Point: json["team_1_point"],
//     superoverTeam2: json["team_2"],
//     team2TotalRun: json["team_2_total_run"],
//     team2TotalWickets: json["team_2_total_wickets"],
//     team2TotalOver: json["team_2_total_over"],
//     team2ExtraRun: json["team_2_extra_run"],
//     team2Point: json["team_2_point"],
//     inningId: json["inning_id"],
//     stickerPlayerId: json["sticker_player_id"],
//     nonstickerPlayerId: json["nonsticker_player_id"],
//     bowlerId: json["bowler_id"],
//     runingOver: json["runing_over"],
//     overseas: json["overseas"],
//     totalPlayer: json["total_player"],
//     matchType: json["match_type"],
//     description: json["description"],
//     summary: json["summary"],
//     leaderBorad: json["leader_borad"],
//     pointTable: json["point_table"],
//     matchDate: DateTime.parse(json["match_date"]),
//     matchTime: json["match_time"],
//     umpires: json["umpires"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     matchStatus: MatchStatus.fromJson(json["match_status"]),
//     groupId: json["group_id"],
//     isDelete: json["is_delete"],
//     toss: json["toss"],
//     wonToss: json["won_toss"],
//     wonTeamId: json["won_team_id"],
//     playerOfTheMatch: json["player_of_the_match"],
//     tossElected: json["toss_elected"],
//     venue: json["venue"],
//     notes: json["notes"],
//     isSuperOver: json["is_super_over"],
//     parentId: json["parent_id"],
//     team1Crr: json["team_1_crr"],
//     team2Crr: json["team_2_crr"],
//     tossStatus: json["toss_status"],
//     team1Runs: json["team1_runs"],
//     team2Runs: json["team2_runs"],
//     datesTimes: json["dates_times"],
//     user: json["user"] == null ? User() : User.fromJson(json["user"]),
//     tournament: json["tournament"] == null ? Tournament() : Tournament.fromJson(json["tournament"]),
//     team1: json["team1"] == null ? Team() : Team.fromJson(json["team1"]),
//     team2: json["team2"] == null ? Team() : Team.fromJson(json["team2"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "created_by": createdBy,
//     "tournament_id": tournamentId,
//     "team_1": superoverTeam1,
//     "team_1_total_run": team1TotalRun,
//     "team_1_total_wickets": team1TotalWickets,
//     "team_1_total_over": team1TotalOver,
//     "team_1_extra_run": team1ExtraRun,
//     "team_1_point": team1Point,
//     "team_2": superoverTeam2,
//     "team_2_total_run": team2TotalRun,
//     "team_2_total_wickets": team2TotalWickets,
//     "team_2_total_over": team2TotalOver,
//     "team_2_extra_run": team2ExtraRun,
//     "team_2_point": team2Point,
//     "inning_id": inningId,
//     "sticker_player_id": stickerPlayerId,
//     "nonsticker_player_id": nonstickerPlayerId,
//     "bowler_id": bowlerId,
//     "runing_over": runingOver,
//     "overseas": overseas,
//     "total_player": totalPlayer,
//     "match_type": matchType,
//     "description": description,
//     "summary": summary,
//     "leader_borad": leaderBorad,
//     "point_table": pointTable,
//     "match_date": "${matchDate!.year.toString().padLeft(4, '0')}-${matchDate!.month.toString().padLeft(2, '0')}-${matchDate!.day.toString().padLeft(2, '0')}",
//     "match_time": matchTime,
//     "umpires": umpires,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "match_status": matchStatus!.toJson(),
//     "group_id": groupId,
//     "is_delete": isDelete,
//     "toss": toss,
//     "won_toss": wonToss,
//     "won_team_id": wonTeamId,
//     "player_of_the_match": playerOfTheMatch,
//     "toss_elected": tossElected,
//     "venue": venue,
//     "notes": notes,
//     "is_super_over": isSuperOver,
//     "parent_id": parentId,
//     "team_1_crr": team1Crr,
//     "team_2_crr": team2Crr,
//     "toss_status": tossStatus,
//     "team1_runs": team1Runs,
//     "team2_runs": team2Runs,
//     "dates_times": datesTimes,
//     "user": user!.toJson(),
//     "tournament": tournament!.toJson(),
//     "team1": team1!.toJson(),
//     "team2": team2!.toJson(),
//   };
// }
