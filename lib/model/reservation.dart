// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) => Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    required this.id,
    required this.number,
    required this.date,
    required this.dateStart,
    required this.dateEnd,
    required this.halfDayStart,
    required this.halfDayEnd,
    required this.status,
    required this.driverId,
    required this.vehicleId,
    //required this.userId,
    required this.placeStartId,
    required this.placeEndId,
    required this.driver,
    required this.vehicle,
    required this.placeStart,
    required this.placeEnd,
  });

  int id;
  String number;
  DateTime date;
  DateTime dateStart;
  DateTime dateEnd;
  String halfDayStart;
  String halfDayEnd;
  String status;
  int driverId;
  int vehicleId;
  //int userId;
  int placeStartId;
  int placeEndId;
  Driver driver;
  Vehicle vehicle;
  Place placeStart;
  Place placeEnd;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    id: json["id"],
    number: json["number"],
    date: DateTime.parse(json["date"]),
    dateStart: DateTime.parse(json["dateStart"]),
    dateEnd: DateTime.parse(json["dateEnd"]),
    halfDayStart: json["halfDayStart"],
    halfDayEnd: json["halfDayEnd"],
    //userId: json["user_id"],
    placeStartId: json["placeStart_id"],
    placeEndId: json["placeEnd_id"],
    driver: Driver.fromJson(json["driver"]),
    vehicle: Vehicle.fromJson(json["vehicle"]),
    placeStart: Place.fromJson(json["placeStart"]),
    placeEnd: Place.fromJson(json["placeEnd"]),
    status: json["status"],
    driverId: json["driver_id"],
    vehicleId: json["vehicle_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "date": date.toIso8601String(),
    "dateStart": dateStart.toIso8601String(),
    "dateEnd": dateEnd.toIso8601String(),
    "halfDayStart": halfDayStart,
    "halfDayEnd": halfDayEnd,
    "status": status,
    "driver_id": driverId,
    "vehicle_id": vehicleId,
    //"user_id": userId,
    "placeStart_id": placeStartId,
    "placeEnd_id": placeEndId,
    "driver": driver.toJson(),
    "vehicle": vehicle.toJson(),
    "place_start": placeStart.toJson(),
    "place_end": placeEnd.toJson(),
  };
}

class Driver {
  Driver({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.street,
    required this.postalCode,
    //required this.town,
    required this.phoneNumber,
  });

  int id;
  String firstname;
  String lastname;
  String email;
  String street;
  String postalCode;
  //String town;
  String phoneNumber;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    firstname: json["firstName"],
    lastname: json["lastName"],
    email: json["professionalEmail"],
    street: json["street"],
    postalCode: json["postalCode"],
    //town: json["town"],
    phoneNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "street": street,
    "postalCode": postalCode,
    //"town": town,
    "phoneNumber": phoneNumber,
  };
}

class Place {
  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.postalCode,
    required this.city,
  });

  int id;
  String name;
  String address;
  String postalCode;
  String city;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    postalCode: json["postalCode"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "postalCode": postalCode,
    "city": city,
  };
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.model,
    //required this.numberOfSeats,
    required this.licensePlate,
    required this.statusVehicle,
  });

  int id;
  String model;
  //int numberOfSeats;
  String licensePlate;
  String statusVehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    model: json["model"],
    //numberOfSeats: json["numberOfSeats"],
    licensePlate: json["immatriculation"],
    statusVehicle: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    //"numberOfSeats": numberOfSeats,
    "licensePlate": licensePlate,
    "statusVehicle": statusVehicle,
  };
}
