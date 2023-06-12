// To parse this JSON data, do
//
//     final retiredcar = retiredcarFromJson(jsonString);

import 'dart:convert';

Retiredcar retiredcarFromJson(String str) => Retiredcar.fromJson(json.decode(str));

String retiredcarToJson(Retiredcar data) => json.encode(data.toJson());

class Retiredcar {
  Retiredcar({
    required this.id,
    required this.model,
    required this.licensePlate,
    required this.statusVehicle,
    required this.vehicleId,
  });

  int id;
  String model;
  String licensePlate;
  String statusVehicle;
  String vehicleId;

  factory Retiredcar.fromJson(Map<String, dynamic> json) => Retiredcar(
    id: json["id"],
    model: json["vehicleModel"],
    licensePlate: json["vehicleMatriculation"],
    statusVehicle: json['vehicle'],
    vehicleId : json['vehicle_id'].toString(),
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    "licensePlate": licensePlate,
    "statusVehicle": statusVehicle,
    "vehicleId": vehicleId,
  };
}
