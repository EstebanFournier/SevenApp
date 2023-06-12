// To parse this JSON data, do
//
//     final authenticate = authenticateFromJson(jsonString);

import 'dart:convert';

Authenticate authenticateFromJson(String str) => Authenticate.fromJson(json.decode(str));

String authenticateToJson(Authenticate data) => json.encode(data.toJson());

class Authenticate {
  Authenticate({
    required this.success,
  });

  Success success;

  factory Authenticate.fromJson(Map<String, dynamic> json) => Authenticate(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success.toJson(),
  };
}

class Success {
  Success({
    required this.token,
    required this.userId,
    required this.user,
    required this.role,
  });

  String token;
  int userId;
  String user;
  String role;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    token: json["token"],
    userId: json["user_id"],
    user: json["user"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_id": userId,
    "user": user,
    "role": role,
  };
}
