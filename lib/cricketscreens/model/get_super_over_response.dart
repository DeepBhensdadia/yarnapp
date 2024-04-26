import 'dart:convert';

GetSuperOverResponse getSuperOverResponseFromJson(String str) => GetSuperOverResponse.fromJson(json.decode(str));

String getSuperOverResponseToJson(GetSuperOverResponse data) => json.encode(data.toJson());

class GetSuperOverResponse {
  bool? success;
  String? message;

  GetSuperOverResponse({
    this.success,
    this.message,
  });

  factory GetSuperOverResponse.fromJson(Map<String, dynamic> json) => GetSuperOverResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
