// To parse this JSON data, do
//
//     final updateresponse = updateresponseFromJson(jsonString);

import 'dart:convert';

Updateresponse updateresponseFromJson(String str) => Updateresponse.fromJson(json.decode(str));

String updateresponseToJson(Updateresponse data) => json.encode(data.toJson());

class Updateresponse {
  bool? success;
  String? message;

  Updateresponse({
    this.success,
    this.message,
  });

  factory Updateresponse.fromJson(Map<String, dynamic> json) => Updateresponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
