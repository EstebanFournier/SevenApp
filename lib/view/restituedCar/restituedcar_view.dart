import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sp1appli/model/restituedcar.dart';
import 'package:sp1appli/view_model/restituedcar/restituedcar-view-model.dart';
import '../../config/app_settings.dart';
import '../component/nav_drawable_widget.dart';

class RestituedcarView extends StatefulWidget {
  const RestituedcarView({Key? key}) : super(key: key);
  @override
  RestituedcarViewState createState() => RestituedcarViewState();
}

class RestituedcarViewState extends State<RestituedcarView>{

  late RestituedcarViewModel _lvm;

  @override
  void initState(){
    print ('RestituedcarViewState - initState()');
    this._lvm=Provider.of<RestituedcarViewModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    print('RestituedViewState - build()');

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppSettings.APP_RESTITUEDCAR),
        /*actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/addRestituedCar', ModalRoute.withName('/addRestituedCar'));},
            icon: Icon(Icons.add),
            label: Text(""),
          ),
        ],*/
      ),
      body: Container(
        child: FutureBuilder(
          future: this._lvm.getRestituedcar(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
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
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.popAndPushNamed(context, '/updateRestituedCar', arguments: [
                                snapshot.data[index].id,
                                snapshot.data[index].model,
                                snapshot.data[index].licensePlate,
                                snapshot.data[index].statusVehicle,
                              ]);
                            },
                            child: ListTile(
                              leading: Text(snapshot.data[index].model),
                              title: Text(snapshot.data[index].licensePlate),
                              subtitle: Text(snapshot.data[index].statusVehicle),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: (){
                                      RestituedcarViewModel.deleteRestituedcar(snapshot.data[index].id.toString());
                                    },
                                  ),
                                  /*TextButton(
                                    child: Icon(
                                      Icons.more,
                                      color: Colors.blue,
                                    ),
                                    onPressed: (){
                                       Navigator.pushNamedAndRemoveUntil(context, '/retiredcarForm', ModalRoute.withName('/retiredcarForm'));;
                                    },
                                  ),*/
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      drawer: NavDrawableWidget(),
    );
  }
}