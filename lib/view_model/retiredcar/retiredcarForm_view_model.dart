import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/model/retiredcarform.dart';

class RetiredCarFormViewModel extends ChangeNotifier {
  RetiredCarFormViewModel();

  // Get all reservation from API
  Future<List<Retiredcarform>> getOneRetiredcarForm(String id) async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    var uri = Uri.parse("http://10.0.2.2:8000/api/retiredCarForm/$id");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print('200');
      return resJson.map((retiredcarform) =>
      new Retiredcarform.fromJson(retiredcarform))
          .toList();
    } else {
      throw Exception("Echec au chargement");
    }
  }
}