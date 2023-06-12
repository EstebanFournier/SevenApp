import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/app_settings.dart';
import '../../view_model/restituedcar/update_restituedcar_view_model.dart';

class UpdateRestituedcarView extends StatefulWidget{
    const UpdateRestituedcarView({Key? key}) : super(key: key);

  @override
  UpdateRestituedcarViewState createState() => UpdateRestituedcarViewState();
}

class UpdateRestituedcarViewState extends State<UpdateRestituedcarView> {

  UpdateRestituedCarViewModel updateRestituedCar = UpdateRestituedCarViewModel();
  TextEditingController _tecModel = TextEditingController() ;
  TextEditingController _tecLicensePlate = TextEditingController();
  TextEditingController _tecStatusVehicle = TextEditingController() ;

  late UpdateRestituedCarViewModel _lvm;

  @override
  void initState(){
    print ('UpdateRestituedCarViewState - initState()');
    this._lvm=Provider.of<UpdateRestituedCarViewModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print('UpdateRestituedCarViewState - build()');
    final args = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    if(args[1].isNotEmpty){
      _tecModel.text = args[1];
    }
    if(args[2].isNotEmpty){
      _tecLicensePlate.text = args[2];
    }
    if(args[3].isNotEmpty){
      _tecStatusVehicle.text = args[3];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppSettings.APP_UPDATERESTITUEDCAR),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 62, left: 10.0, right: 10.0, bottom: 10.0),
          children: <Widget>[
            Container(
              height: 70,
              child: new TextField(
                controller: _tecModel,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.model,
                ),
              ),
            ),
            Container(
              height: 70,
              child: new TextField(
                controller: _tecLicensePlate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.licensePlate,
                ),
              ),
            ),
            Container(
              height: 70,
              child: new TextField(
                controller: _tecStatusVehicle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.statusVehicle,
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0),),

            Container(
              height: 35,
              child: new ElevatedButton(
                onPressed: () async {
                  this._lvm.updateRestituedcar(args[0].toString(),
                     _tecModel.text.trim(), _tecLicensePlate.text.trim(), _tecStatusVehicle.text.trim());
                  Navigator.popAndPushNamed(context, '/restituedcar');
                },
                child: new Text('Modifier',
                  style: new TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue),),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0))
          ],
        ),
      ),
    );
  }
}