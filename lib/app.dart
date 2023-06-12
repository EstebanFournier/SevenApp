import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp1appli/view/profile/profile_view.dart';
import 'package:sp1appli/view/restituedCar/add_restituedcar_view.dart';
import 'package:sp1appli/view/restituedCar/update_restituedcar_view.dart';
import 'package:sp1appli/view/retiredCar/add_retiredcar_view.dart';
import 'package:sp1appli/view/retiredCar/retiredcarForm_view.dart';
import 'package:sp1appli/view/retiredCar/update_retiredcar_view.dart';
import 'package:sp1appli/view_model/restituedcar/add_restituedcar_view_model.dart';
import 'package:sp1appli/view_model/restituedcar/update_restituedcar_view_model.dart';
import 'package:sp1appli/view_model/retiredcar/add_retiredcar_view_model.dart';
import 'package:sp1appli/view_model/retiredcar/retiredcarForm_view_model.dart';
import 'package:sp1appli/view_model/retiredcar/update_retiredcar_view_model.dart';
import 'view_model/profile/profile_view_model.dart';

import 'view/retiredCar/retired_car_view.dart';
import 'view/restituedCar/restituedcar_view.dart';
import 'view/authenticate/login_view.dart';
import 'view/dashboard/dashboard_view.dart';
import 'view/landing_view.dart';
import 'view_model/login_view_model.dart';
import 'view_model/reservation/reservation-view-model.dart';
import 'view_model/restituedcar/restituedcar-view-model.dart';
import 'view_model/retiredcar/retiredcar-view-model.dart';

class App{
  // Properties
  late MaterialApp _startUpView;

  App() {
    this._startUpView = MaterialApp(title: "Seven",
        debugShowCheckedModeBanner: false,
        initialRoute:  '/',
        routes: {
          '/': (context) => LandingView(),
          '/login': (context) => ChangeNotifierProvider(create: (context) => LoginViewModel(), child: LoginView()),
          '/home': (context) => ChangeNotifierProvider(create: (context) => ReservationViewModel(), child: ReservationView()),
          '/restituedcar': (context) => ChangeNotifierProvider(create: (context) => RestituedcarViewModel(), child: RestituedcarView()),
          '/retiredcar': (context) => ChangeNotifierProvider(create: (context) => RetiredcarViewModel(), child: RetiredcarView()),
          '/profile': (context) => ChangeNotifierProvider(create: (context) => ProfileViewModel(), child: ProfileView()),

          // CRUD retiredcar
          '/addRetiredCar': (context) => ChangeNotifierProvider(create: (context) => AddRetiredcarViewModel(), child: AddRetiredcarView()),
          '/updateRetiredCar': (context) => ChangeNotifierProvider(create: (context) => UpdateRetiredCarViewModel(), child: UpdateRetiredcarView()),
          '/retiredcarForm': (context) => ChangeNotifierProvider(create: (context) => RetiredCarFormViewModel(), child: RetiredcarFormView()),


          //CRUD restituedcar
          '/addRestituedCar': (context) => ChangeNotifierProvider(create: (context) => AddRestituedcarViewModel(), child: AddRestituedcarView()),
          '/updateRestituedCar': (context) => ChangeNotifierProvider(create: (context) => UpdateRestituedCarViewModel(), child: UpdateRestituedcarView()),
        },
    );
  }

  MaterialApp getStartUpView(){
    return this._startUpView;
  }
}

