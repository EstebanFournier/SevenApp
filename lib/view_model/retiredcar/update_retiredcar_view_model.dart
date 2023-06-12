import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../config/app_settings.dart';

class UpdateRetiredCarViewModel extends ChangeNotifier {
  UpdateRetiredCarViewModel();

  // Update a reservation
  Future updateRetiredcar(String id, String model, String licensePlate,
      String statusVehicle, String vehicleId) async {
    try {
      var box = Hive.box('box');
      String myToken = box.get('token');
      var token = myToken;
      var uri = Uri.parse("http://10.0.2.2:8000/api/retiredCar/update/$id");
      var resJson;
      var response = await http.put(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        "model": "$model",
        "licensePlate": "$licensePlate",
        "statusVehicle": "$statusVehicle",
        "vehicleId": "$vehicleId",
      });

      if (response.statusCode == 200) {
        print('succes update');
        resJson = json.decode(response.body);
      } else {
        print("Modification non réussie");
      }
    } catch (e) {
      return e.toString();
    }
  }
}
