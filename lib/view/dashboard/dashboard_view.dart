import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/view/component/nav_drawable_widget.dart';
import 'package:sp1appli/view_model/reservation/reservation-view-model.dart';

class ReservationView extends StatefulWidget{

   ReservationView({Key? key}) : super(key: key);
  @override
  ReservationViewState createState() => ReservationViewState();
}

class ReservationViewState extends State<ReservationView>{

  late ReservationViewModel _lvm;

  @override
  void initState(){
    print ('ReservationViewState - initState()');
    this._lvm=Provider.of<ReservationViewModel>(context,listen: false);
  }
  /*_buttonPreview(double _height, double _width) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(_width, _height),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.all(0),
  );*/

  @override
  Widget build(BuildContext context) {
    print('ReservationViewState - build()');



    return Scaffold(
      appBar: AppBar(
        title: const Text(AppSettings.APP_DASHBOARD),
      ),
      body: Container(
        child: FutureBuilder(
          future: this._lvm.getReservations(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              print(this._lvm.getReservations());
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
                      leading: Text(snapshot.data[index].number),
                      title: Text(snapshot.data[index].dateStart.toString()),
                      subtitle: Text(snapshot.data[index].status),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                              onPressed: (){
                        ReservationViewModel.deleteReservation(snapshot.data[index].id.toString());
                  },
                              child: Icon(
                            Icons.delete,
                            color: Colors.red,
                  ),)

              ],
        ),
                    )
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

