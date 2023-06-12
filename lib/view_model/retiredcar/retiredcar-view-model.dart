import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../../config/app_settings.dart';
import '../../model/retiredcar.dart';


class RetiredcarViewModel extends ChangeNotifier{

  // Get all the retired cars
  Future<List<Retiredcar>> getRetiredcar() async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    var uri = Uri.parse("http://10.0.2.2:8000/api/retiredCar");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200) {
      List resJson = json.decode(response.body);
       print('getRetiredcar 200');
       print(response.statusCode);
      return resJson.map((retiredcar) => new Retiredcar.fromJson(retiredcar)).toList();
    }else {
      print('getRetiredcar error');
      throw Exception("Echec au chargement");
    }
  }

  // Delete a retired car
  static Future<http.Response> deleteRetiredcar(String id) async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    final http.Response response = await http.delete(Uri.parse("http://10.0.2.2:8000/api/retiredCar/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer $token',
        });
    if(response.statusCode == 200){
      print('deleteRetiredcar 200');
      return response;
    } else  {
      print('deleteRetiredcar error');
      throw Exception('Echec lors de la suppression de la voiture retirée');
    }
  }
}