// To parse this JSON data, do
//
//     final getplayerdropdown = getplayerdropdownFromJson(jsonString);

import 'dart:convert';

Getplayerdropdown getplayerdropdownFromJson(String str) => Getplayerdropdown.fromJson(json.decode(str));

String getplayerdropdownToJson(Getplayerdropdown data) => json.encode(data.toJson());

class Getplayerdropdown {
  bool? success;
  String? message;
  List<String>? battingStyleList;
  List<String>? bowlingStyleList;
  List<String>? cricketerRoles;
  List<String>? bowlingPaceList;

  Getplayerdropdown({
    this.success,
    this.message,
    this.battingStyleList,
    this.bowlingStyleList,
    this.cricketerRoles,
    this.bowlingPaceList,
  });

  factory Getplayerdropdown.fromJson(Map<String, dynamic> json) => Getplayerdropdown(
    success: json["success"],
    message: json["message"],
    battingStyleList: List<String>.from(json["batting_style_list"].map((x) => x)),
    bowlingStyleList: List<String>.from(json["bowling_style_list"].map((x) => x)),
    cricketerRoles: List<String>.from(json["cricketer_roles"].map((x) => x)),
    bowlingPaceList: List<String>.from(json["bowling_pace_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "batting_style_list": List<dynamic>.from(battingStyleList!.map((x) => x)),
    "bowling_style_list": List<dynamic>.from(bowlingStyleList!.map((x) => x)),
    "cricketer_roles": List<dynamic>.from(cricketerRoles!.map((x) => x)),
    "bowling_pace_list": List<dynamic>.from(bowlingPaceList!.map((x) => x)),
  };
}
