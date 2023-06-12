import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sp1appli/view/retiredCar/update_retiredcar_view.dart';
import 'package:sp1appli/view_model/retiredcar/retiredcar-view-model.dart';
import '../../config/app_settings.dart';
import '../component/nav_drawable_widget.dart';

class RetiredcarView extends StatefulWidget {
  const RetiredcarView({Key? key}) : super(key: key);
  @override
  RetiredcarViewState createState() => RetiredcarViewState();
}

class RetiredcarViewState extends State<RetiredcarView>{

  late RetiredcarViewModel _lvm;

  @override
  void initState(){
    print ('RetiredcarViewState - initState()');
    this._lvm=Provider.of<RetiredcarViewModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    print('RetiredcarViewState - build()');

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppSettings.APP_RETIREDCAR),
      ),
      body: Container(
        child: FutureBuilder(
          future: this._lvm.getRetiredcar(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              print('data null');
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                  ),
                ),
              );
            } else {
              print('data');
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.popAndPushNamed(context, '/updateRetiredCar', arguments: [
                                  snapshot.data[index].id,
                                  snapshot.data[index].model,
                                  snapshot.data[index].licensePlate,
                                  snapshot.data[index].statusVehicle,
                                  snapshot.data[index].vehicleId,
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
                                    RetiredcarViewModel.deleteRetiredcar(snapshot.data[index].id.toString());
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
                            ),)
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