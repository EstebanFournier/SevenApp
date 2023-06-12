import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/view/component/nav_drawable_widget.dart';
import 'package:sp1appli/view_model/profile/profile_view_model.dart';
import 'package:sp1appli/view_model/reservation/reservation-view-model.dart';

class ProfileView extends StatefulWidget{

  ProfileView({Key? key}) : super(key: key);
  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {

  late ProfileViewModel _lvm;

  @override
  void initState() {
    print('ProfileViewState - initState()');
    this._lvm = Provider.of<ProfileViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print('ProfileViewState - build()');
    
    return Scaffold(
        appBar: AppBar(
        title: const Text(AppSettings.APP_PROFILE)
        ),
    body: Container(
      child: FutureBuilder(
      future: this._lvm.getProfile(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                        leading: Text(snapshot.data[index].role.name),
                        title: Text(snapshot.data[index].firstname),
                        subtitle: Text(snapshot.data[index].lastname),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              child: Icon(
                                Icons.more,
                                color: Colors.blue,
                              ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      )
                  );
                }
            );
          }
        }
      )
      ),
        drawer: NavDrawableWidget(),
    );
  }
}