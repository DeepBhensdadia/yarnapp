// To parse this JSON data, do
//
//     final getTournamentlist = getTournamentlistFromJson(jsonString);

import 'dart:convert';

GetTournamentlist getTournamentlistFromJson(String str) => GetTournamentlist.fromJson(json.decode(str));

String getTournamentlistToJson(GetTournamentlist data) => json.encode(data.toJson());

class GetTournamentlist {
  bool? success;
  String? message;
  List<Tournamentdetails>? data;

  GetTournamentlist({
    this.success,
    this.message,
    this.data,
  });

  factory GetTournamentlist.fromJson(Map<String, dynamic> json) => GetTournamentlist(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Tournamentdetails>.from(json["data"].map((x) => Tournamentdetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Tournamentdetails {
  int? id;
  int? createdBy;
  String? tournamentName;
  String? location;
  int? tournamentTypeId;
  String? logo;
  String? description;
  dynamic stratDate;
  dynamic endDate;
  dynamic dueDate;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  Tournamenttype? tournamenttype;
  Tournamenttype? user;

  Tournamentdetails({
    this.id,
    this.createdBy,
    this.tournamentName,
    this.location,
    this.tournamentTypeId,
    this.logo,
    this.description,
    this.stratDate,
    this.endDate,
    this.dueDate,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.tournamenttype,
    this.user,
  });

  factory Tournamentdetails.fromJson(Map<String, dynamic> json) => Tournamentdetails(
    id: json["id"],
    createdBy: json["created_by"],
    tournamentName: json["tournament_name"],
    location: json["location"],
    tournamentTypeId: json["tournament_type_id"],
    logo: json["logo"],
    description: json["description"],
    stratDate: json["strat_date"],
    endDate: json["end_date"],
    dueDate: json["due_date"],
    address: json["address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    tournamenttype: Tournamenttype.fromJson(json["tournamenttype"]),
    user: Tournamenttype.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_by": createdBy,
    "tournament_name": tournamentName,
    "location": location,
    "tournament_type_id": tournamentTypeId,
    "logo": logo,
    "description": description,
    "strat_date": stratDate,
    "end_date": endDate,
    "due_date": dueDate,
    "address": address,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "tournamenttype": tournamenttype?.toJson(),
    "user": user?.toJson(),
  };
}

class Tournamenttype {
  int? id;
  String? name;

  Tournamenttype({
    this.id,
    this.name,
  });

  factory Tournamenttype.fromJson(Map<String, dynamic> json) => Tournamenttype(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name":name,
  };
}
