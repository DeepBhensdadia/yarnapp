// To parse this JSON data, do
//
//     final getplayerinfo = getplayerinfoFromJson(jsonString);

import 'dart:convert';

import '../cricketscreens/model/searchplayerresponse.dart';

Getplayerinfo getplayerinfoFromJson(String str) =>
    Getplayerinfo.fromJson(json.decode(str));

String getplayerinfoToJson(Getplayerinfo data) => json.encode(data.toJson());

class Getplayerinfo {
  bool? success;
  String? message;
  PlayerDetails? data;

  Getplayerinfo({
    this.success,
    this.message,
    this.data,
  });

  factory Getplayerinfo.fromJson(Map<String, dynamic> json) => Getplayerinfo(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? PlayerDetails()
            : PlayerDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}
