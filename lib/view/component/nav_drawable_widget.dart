import 'package:flutter/material.dart';

import '../../config/app_settings.dart';

class NavDrawableWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Text(AppSettings.APP_NAME, style: TextStyle(color: Colors.white, fontSize: 25)),
              decoration: BoxDecoration(color: Colors.blue)
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text(AppSettings.strings.homeTitle),
            onTap: () => {Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home'))},
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text(AppSettings.strings.restituedCarFormTitle),
            onTap: () => {Navigator.pushNamedAndRemoveUntil(context, '/restituedcar', ModalRoute.withName('/restituedcar'))},
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text(AppSettings.strings.retiredCarFormTitle),
            onTap: () => {Navigator.pushNamedAndRemoveUntil(context, '/retiredcar', ModalRoute.withName('/retiredcar'))},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(AppSettings.strings.profileTitle),
            onTap: () => {Navigator.pushNamedAndRemoveUntil(context, '/profile', ModalRoute.withName('/profile'))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(AppSettings.strings.logoutTitle),
            onTap: () => {Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName('/login'))},
          ),
        ],
      ),
    );
  }
}