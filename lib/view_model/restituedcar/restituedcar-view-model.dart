import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../config/app_settings.dart';
import '../../model/restituedcar.dart';


class RestituedcarViewModel extends ChangeNotifier{

  // Get all the restitued car
  Future<List<Restituedcar>> getRestituedcar() async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    var uri = Uri.parse("http://10.0.2.2:8000/api/restituedCar");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print(resJson);
      return resJson.map((restituedcar) => new Restituedcar.fromJson(restituedcar)).toList();
    }else {
      throw Exception("Echec au chargement");
    }
  }

  // Delete a restitued car
  static Future<http.Response> deleteRestituedcar(String id) async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    final http.Response response = await http.delete(Uri.parse("http://10.0.2.2:8000/api/restituedCar/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer $token',
        });
    if(response.statusCode == 200){
      return response;
    } else  {
      throw Exception('Echec lors de la suppression de la voiture restituée');
    }
  }

}