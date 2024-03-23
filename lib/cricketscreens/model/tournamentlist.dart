// To parse this JSON data, do
//
//     final getTournamentlist = getTournamentlistFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

GetTournamentlist getTournamentlistFromJson(String str) =>
    GetTournamentlist.fromJson(json.decode(str));

String getTournamentlistToJson(GetTournamentlist data) =>
    json.encode(data.toJson());

class GetTournamentlist {
  bool? success;
  String? message;
  List<Tournamentdetails>? data;

  GetTournamentlist({
    this.success,
    this.message,
    this.data,
  });

  factory GetTournamentlist.fromJson(Map<String, dynamic> json) =>
      GetTournamentlist(
        success: json["success"] != true ? false : json["success"],
        message: json["message"] == true ? "" : json["message"],
        data: json["data"] == null
            ? []
            : List<Tournamentdetails>.from(
                json["data"].map((x) => Tournamentdetails.fromJson(x))),
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
  String? ballType;
  String? cricketType;
  String? description;
  String? organizationName;
  dynamic organizationNumber;
  String? stratDate;
  String? endDate;
  dynamic dueDate;
  int? status;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  Tournamenttype? tournamenttype;
  Tournamenttype? user;

  String startdateformat() {
    return DateFormat('dd-MM-yyyy')
        .format(DateTime.parse(stratDate.toString()));
  }

  String enddateformat() {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(endDate.toString()));
  }

  Tournamentdetails({
    this.id,
    this.createdBy,
    this.tournamentName,
    this.location,
    this.tournamentTypeId,
    this.logo,
    this.ballType,
    this.cricketType,
    this.description,
    this.organizationName,
    this.organizationNumber,
    this.stratDate,
    this.endDate,
    this.dueDate,
    this.status,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.tournamenttype,
    this.user,
  });

  factory Tournamentdetails.fromJson(Map<String, dynamic> json) =>
      Tournamentdetails(
        id: json["id"],
        createdBy: json["created_by"],
        tournamentName: json["tournament_name"],
        location: json["location"],
        tournamentTypeId: json["tournament_type_id"],
        logo: json["logo"],
        ballType: json["ball_type"],
        cricketType: json["cricket_type"],
        description: json["description"],
        organizationName: json["organization_name"],
        organizationNumber: json["organization_number"],
        stratDate: json["strat_date"],
        endDate: json["end_date"],
        dueDate: json["due_date"],
        status: json["status"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tournamenttype: json["tournamenttype"] == null
            ? Tournamenttype()
            : Tournamenttype.fromJson(json["tournamenttype"]),
        user: json["user"] == null
            ? Tournamenttype()
            : Tournamenttype.fromJson(json["user"]),
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
        "organization_name": organizationName,
        "organization_number": organizationNumber,
        "strat_date": stratDate,
        "end_date": endDate,
        "due_date": dueDate,
        "status": status,
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
        "name": name,
      };
}
