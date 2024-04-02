// To parse this JSON data, do
//
//     final grouplistdata = grouplistdataFromJson(jsonString);

import 'dart:convert';

Grouplistdata grouplistdataFromJson(String str) => Grouplistdata.fromJson(json.decode(str));

String grouplistdataToJson(Grouplistdata data) => json.encode(data.toJson());

class Grouplistdata {
  bool? success;
  String? message;
  List<String>? data;

  Grouplistdata({
    this.success,
    this.message,
    this.data,
  });

  factory Grouplistdata.fromJson(Map<String, dynamic> json) => Grouplistdata(
    success: json["success"],
    message: json["message"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
