import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:sp1appli/config/app_settings.dart';

class LoginViewModel extends ChangeNotifier {
LoginViewModel();


  Future<bool> signInButtonOnClickCommand(String email, String password) async {
      await Hive.initFlutter();
      var openBox = await Hive.openBox('box');
      var box = Hive.box('box');

      HttpClient client = new HttpClient();
      client.badCertificateCallback =((X509Certificate cert, String  host, int port) => true);
      HttpClientRequest request = await client.postUrl(Uri.parse("http://10.0.2.2:8000/api/login"));
      request.headers.set('Content-Type', 'application/json');
      request.add(utf8.encode(jsonEncode({"email": email, "password": password})));
      HttpClientResponse result = await request.close();
      final stringData = await result.transform(utf8.decoder).join();

      print('status :');
      print(result.statusCode);
      if(result.statusCode == 201) {
        var jsonResponse = json.decode(stringData);
        box.put('token', jsonResponse["token"]);
        var token = box.get('token');
        print('token : ');
        print(jsonResponse["token"]);
        print(token);
        return true;
      } else {
        return false;
      }
   }

  /*Future<bool> signInButtonOnClickCommand(String email, String password) async {
    bool isConnected = false;
    //var response = await http.get(Uri.parse("http://10.0.2.2:8000/api/booking"));
    var body = jsonEncode(<String, String>{"email": email, "password": password});
    var uri = Uri.parse("http://10.0.2.2:8000/api/login");
    final response = await http.post(
        uri,
        headers:<String, String>{
          'Accept': 'application/json',
        },
        body: body,
    );

    print('body : ');
    print(body);
    print('uri : ');
    print(uri);
    print('response.body : ');
    print(json.decode(response.body));

    //API status
    var jsonResponse;

    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      isConted = true;
    }else{
      isConnected = false;
    }
    return isConnected;
    }*/
  }