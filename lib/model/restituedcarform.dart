// To parse this JSON data, do
//
//     final restituedcar = restituedcarFromJson(jsonString);

import 'dart:convert';

Restituedcarform restituedcarformFromJson(String str) => Restituedcarform.fromJson(json.decode(str));

String restituedcarformToJson(Restituedcarform data) => json.encode(data.toJson());

class Restituedcarform {
  Restituedcarform({
    required this.id,
    required this.mileage,
    required this.date,
    required this.frontLeftWing,
    required this.frontRightWing,
    required this.leftRearWing,
    required this.rightRearWing,
    //required this.radiator,
    required this.frontLeftLightHouse,
    required this.frontRightLightHouse,
    required this.seat,
    required this.passengerSeat,
    required this.dashboard,
    required this.frontLeftDoor,
    required this.frontRightDoor,
    //required this.leftRearDoor,
    //required this.rightRearDoor,
    required this.observations,
  });

  int id;
  int mileage;
  DateTime date;
  String? frontLeftWing;
  String? frontRightWing;
  String? leftRearWing;
  String? rightRearWing;
  //String? radiator;
  String? frontLeftLightHouse;
  String? frontRightLightHouse;
  String? seat;
  String? passengerSeat;
  String? dashboard;
  String? frontLeftDoor;
  String? frontRightDoor;
  //String? leftRearDoor;
  //String? rightRearDoor;
  String? observations;

  factory Restituedcarform.fromJson(Map<String, dynamic> json) => Restituedcarform(
    id: json["id"],
    mileage: json["mileage"],
    date: DateTime.parse(json["dateHourControl"]),
    frontLeftWing: json["aileAVG"],
    frontRightWing: json["aileAVD"],
    leftRearWing: json["aileARG"],
    rightRearWing: json["aileARD"],
    //radiator: json["radiator"],
    frontLeftLightHouse: json["phareAVG"],
    frontRightLightHouse: json["phareAVD"],
    seat: json["siegePass"],
    passengerSeat: json["siegeCond"],
    dashboard: json["tdb"],
    frontLeftDoor: json["porteAVG"],
    frontRightDoor: json["porteAVD"],
    //leftRearDoor: json["leftRearDoor"],
    //rightRearDoor: json["rightRearDoor"],
    observations: json["observation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mileage": mileage,
    "date": date.toIso8601String(),
    "frontLeftWing": frontLeftWing,
    "frontRightWing": frontRightWing,
    "leftRearWing": leftRearWing,
    "rightRearWing": rightRearWing,
    //"radiator": radiator,
    "frontLeftLightHouse": frontLeftLightHouse,
    "frontRightLightHouse": frontRightLightHouse,
    "seat": seat,
    "passengerSeat": passengerSeat,
    "dashboard": dashboard,
    "frontLeftDoor": frontLeftDoor,
    "frontRightDoor": frontRightDoor,
    //"leftRearDoor": leftRearDoor,
    //"rightRearDoor": rightRearDoor,
    "observations": observations,
  };
}
