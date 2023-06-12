import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/model/reservation.dart';

class ReservationViewModel extends ChangeNotifier {
  ReservationViewModel();

  // Get all reservation from API
  Future<List<Reservation>> getReservations() async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    var uri = Uri.parse("http://10.0.2.2:8000/api/booking");
    var response = await http.get(
        uri,
        headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print('status :');
    print(response.statusCode);
    if (response.statusCode == 200) {
      List resJson = json.decode(response.body);
      return resJson.map((reservation) => new Reservation.fromJson(reservation)).toList();
    } else {
      throw Exception("Echec au chargement");
    }
  }

  // Delete a reservation with API call
  static Future<http.Response> deleteReservation(String id) async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    final http.Response response = await http.delete(Uri.parse("http://10.0.2.2:8000/api/booking/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer $token',
        });
    if(response.statusCode == 200){
      return response;
    } else  {
      throw Exception('Echec lors de la suppression de la réservation');
    }
  }
}