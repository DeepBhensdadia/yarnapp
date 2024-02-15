// To parse this JSON data, do
//
//     final getTournamenttype = getTournamenttypeFromJson(jsonString);

import 'dart:convert';

GetTournamenttype getTournamenttypeFromJson(String str) => GetTournamenttype.fromJson(json.decode(str));

String getTournamenttypeToJson(GetTournamenttype data) => json.encode(data.toJson());

class GetTournamenttype {
  bool? success;
  String? message;
  List<Datum>? data;

  GetTournamenttype({
    this.success,
    this.message,
    this.data,
  });

  factory GetTournamenttype.fromJson(Map<String, dynamic> json) => GetTournamenttype(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
