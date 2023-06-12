import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp1appli/config/app_settings.dart';

class LandingView extends StatefulWidget {
  @override
  LandingViewState createState() => LandingViewState();
}

class LandingViewState extends State<LandingView> {
  @override
  void initState() {
    print('LandingViewState - initState()');
    super.initState();
    Timer(Duration(seconds:AppSettings.SPLASHSCREEN_DURATION),_runApp);
  }
  _runApp(){
    _routeFirstView();
  }

  void _routeFirstView() async {
    print('LandingViewState - _routeFirstView()');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = (prefs.getInt('userId') ?? 0 );
    if (userId == 0){
      print('landingViewState - _routeFirstView() : User wasn\'t connected');

      Navigator.pushNamed(context, '/login');
    }else{
      print('landingViewState - _routeFirstView() : User $userId was already connected');

      Navigator.pushNamed(context, '/home');
    }

  }

  @override
  Widget build(BuildContext context) {
    print('LandingViewState - build()');

    final applicationName = Container(
        color: Colors.lightBlue.shade300,
        padding: EdgeInsets.all(10),
        child: Text(AppSettings.APP_NAME, style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade800)
        )
    );

    final applicationVersion = Container(
      padding: EdgeInsets.all(10),
      child: Text(AppSettings.APP_VERSION, style: TextStyle(
        fontSize: 15,
        color: Colors.white)
      ),
    );


    final circularIndicator = Center(child: CircularProgressIndicator(color: Colors.white));
    return Scaffold(
        backgroundColor: Colors.indigo.shade800,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            applicationName,
            circularIndicator
          ],
        )
    );
  }
}