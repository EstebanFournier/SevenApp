// To parse this JSON data, do
//
//     final retiredcar = retiredcarFromJson(jsonString);

import 'dart:convert';

Retiredcarform retiredcarformFromJson(String str) => Retiredcarform.fromJson(json.decode(str));

String retiredcarformToJson(Retiredcarform data) => json.encode(data.toJson());

class Retiredcarform {
  Retiredcarform({
    required this.id,
    required this.mileage,
    required this.date,
    required this.frontLeftWing,
    required this.frontRightWing,
    required this.leftRearWing,
    required this.rightRearWing,
    required this.radiator,
    required this.frontLeftLightHouse,
    required this.frontRightLightHouse,
    required this.seat,
    required this.passengerSeat,
    required this.dashboard,
    required this.frontLeftDoor,
    required this.frontRightDoor,
    required this.leftRearDoor,
    required this.rightRearDoor,
    required this.observations,
  });

  int id;
  int mileage;
  DateTime date;
  String? frontLeftWing;
  String? frontRightWing;
  String? leftRearWing;
  String? rightRearWing;
  String? radiator;
  String? frontLeftLightHouse;
  String? frontRightLightHouse;
  String? seat;
  String? passengerSeat;
  String? dashboard;
  String? frontLeftDoor;
  String? frontRightDoor;
  String? leftRearDoor;
  String? rightRearDoor;
  String? observations;

  factory Retiredcarform.fromJson(Map<String, dynamic> json) => Retiredcarform(
    id: json["id"],
    mileage: json["mileage"],
    date: DateTime.parse(json["date"]),
    frontLeftWing: json["frontLeftWing"],
    frontRightWing: json["frontRightWing"],
    leftRearWing: json["leftRearWing"],
    rightRearWing: json["rightRearWing"],
    radiator: json["radiator"],
    frontLeftLightHouse: json["frontLeftLightHouse"],
    frontRightLightHouse: json["frontRightLightHouse"],
    seat: json["seat"],
    passengerSeat: json["passengerSeat"],
    dashboard: json["dashboard"],
    frontLeftDoor: json["frontLeftDoor"],
    frontRightDoor: json["frontRightDoor"],
    leftRearDoor: json["leftRearDoor"],
    rightRearDoor: json["rightRearDoor"],
    observations: json["observations"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mileage": mileage,
    "date": date.toIso8601String(),
    "frontLeftWing": frontLeftWing,
    "frontRightWing": frontRightWing,
    "leftRearWing": leftRearWing,
    "rightRearWing": rightRearWing,
    "radiator": radiator,
    "frontLeftLightHouse": frontLeftLightHouse,
    "frontRightLightHouse": frontRightLightHouse,
    "seat": seat,
    "passengerSeat": passengerSeat,
    "dashboard": dashboard,
    "frontLeftDoor": frontLeftDoor,
    "frontRightDoor": frontRightDoor,
    "leftRearDoor": leftRearDoor,
    "rightRearDoor": rightRearDoor,
    "observations": observations,
  };
}
