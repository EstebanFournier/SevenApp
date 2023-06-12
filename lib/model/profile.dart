// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
     this.emailVerifiedAt,
     this.lastConnection,
    required this.active,
    required this.roleId,
    required this.companyId,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    this.company,
  });

  int id;
  String firstname;
  String lastname;
  String email;
  dynamic emailVerifiedAt;
  dynamic lastConnection;
  String active;
  int roleId;
  dynamic companyId;
  DateTime createdAt;
  DateTime updatedAt;
  Roles role;
  dynamic company;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    lastConnection: json["lastConnection"],
    active: json["active"],
    roleId: json["role"]["id"],
    companyId: json["company"]["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    role: Roles.fromJson(json["role"]),
    company: json["company"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "lastConnection": lastConnection,
    "active": active,
    "role_id": roleId,
    "company_id": companyId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "roles": role,
    "company": company,
  };
}

class Roles {
  Roles({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
    id: json["id"],
    name: json["label"],
    guardName: json["ref"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
