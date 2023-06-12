import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/model/retiredcar.dart';


class AddRetiredcarViewModel extends ChangeNotifier{
  AddRetiredcarViewModel();

  void AddRetiredcar(String model, String licensePlate, String statusVehicle) async {
    var token = AppSettings.APP_TOKEN;
    var uri = Uri.parse("http://10.0.2.2:8000/api/retiredCar/create");
    var resJson;
    var response = await http.post(uri, headers:
    {
      'Accept':'application/json',
      'Authorization' : 'Bearer $token',
    },
        body: {
          "model": "$model",
          "licensePlate": "$licensePlate",
          "statusVehicle": "$statusVehicle",
        });
    if(response.statusCode == 200){
      resJson = json.decode(response.body);
      print(resJson);
    }
  }

}