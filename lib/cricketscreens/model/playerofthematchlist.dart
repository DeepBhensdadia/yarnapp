// To parse this JSON data, do
//
//     final playerofthematchlist = playerofthematchlistFromJson(jsonString);

import 'dart:convert';

Playerofthematchlist playerofthematchlistFromJson(String str) => Playerofthematchlist.fromJson(json.decode(str));

String playerofthematchlistToJson(Playerofthematchlist data) => json.encode(data.toJson());

class Playerofthematchlist {
  bool? success;
  String? message;
  List<playerlist>? date;

  Playerofthematchlist({
    this.success,
    this.message,
    this.date,
  });

  factory Playerofthematchlist.fromJson(Map<String, dynamic> json) => Playerofthematchlist(
    success: json["success"],
    message: json["message"],
    date: List<playerlist>.from(json["date"].map((x) => playerlist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "date": List<dynamic>.from(date!.map((x) => x.toJson())),
  };
}

class playerlist {
  int? id;
  int? playerId;
  Player? player;

  playerlist({
    this.id,
    this.playerId,
    this.player,
  });

  factory playerlist.fromJson(Map<String, dynamic> json) => playerlist(
    id: json["id"],
    playerId: json["player_id"],
    player: Player.fromJson(json["player"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "player_id": playerId,
    "player": player?.toJson(),
  };
}

class Player {
  int? id;
  String? playerName;
  String? playerShortName;

  Player({
    this.id,
    this.playerName,
    this.playerShortName,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    id: json["id"],
    playerName: json["player_name"],
    playerShortName: json["player_short_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "player_name": playerName,
    "player_short_name": playerShortName,
  };
}
