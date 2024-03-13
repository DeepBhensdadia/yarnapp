// To parse this JSON data, do
//
//     final getplayerrolelist = getplayerrolelistFromJson(jsonString);

import 'dart:convert';

Getplayerrolelist getplayerrolelistFromJson(String str) => Getplayerrolelist.fromJson(json.decode(str));

String getplayerrolelistToJson(Getplayerrolelist data) => json.encode(data.toJson());

class Getplayerrolelist {
  bool? success;
  List<Positions>? data;

  Getplayerrolelist({
    this.success,
    this.data,
  });

  factory Getplayerrolelist.fromJson(Map<String, dynamic> json) => Getplayerrolelist(
    success: json["success"],
    data: List<Positions>.from(json["data"].map((x) => Positions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Positions {
  int? id;
  String? positionName;

  Positions({
    this.id,
    this.positionName,
  });

  factory Positions.fromJson(Map<String, dynamic> json) => Positions(
    id: json["id"],
    positionName: json["position_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position_name": positionName,
  };
}
