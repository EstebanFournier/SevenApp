// To parse this JSON data, do
//
//     final restituedCar = restituedCarFromJson(jsonString);

import 'dart:convert';

Restituedcar restituedcarFromJson(String str) => Restituedcar.fromJson(json.decode(str));

String restituedcarToJson(Restituedcar data) => json.encode(data.toJson());

class Restituedcar {
  Restituedcar({
    required this.id,
    required this.model,
    required this.licensePlate,
    required this.statusVehicle,
  });

  int id;
  String model;
  String licensePlate;
  String statusVehicle;

  factory Restituedcar.fromJson(Map<String, dynamic> json) => Restituedcar(
    id: json["id"],
    model: json["model"],
    licensePlate: json["licensePlate"],
    statusVehicle: json["statusVehicle"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    "licensePlate": licensePlate,
    "statusVehicle": statusVehicle,
  };
}
