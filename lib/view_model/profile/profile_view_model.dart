import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../model/profile.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel();

  Future<List> getProfile() async {
    var box = Hive.box('box');
    String myToken = box.get('token');
    var token = myToken;
    var uri = Uri.parse("http://10.0.2.2:8000/api/users");
    var response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print('response.statusCode profil');
    print(response.statusCode);
    if (response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print('return profil');
      return resJson.map((profile) =>
      new Profile.fromJson(profile)).toList();
    } else {
      throw Exception("Echec au chargement");
    }
  }
}