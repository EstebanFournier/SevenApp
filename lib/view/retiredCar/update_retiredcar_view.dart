import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp1appli/view_model/retiredcar/update_retiredcar_view_model.dart';
import '../../config/app_settings.dart';

class UpdateRetiredcarView extends StatefulWidget{
    const UpdateRetiredcarView({Key? key}) : super(key: key);

  @override
  UpdateRetiredcarViewState createState() => UpdateRetiredcarViewState();
}

class UpdateRetiredcarViewState extends State<UpdateRetiredcarView> {

  UpdateRetiredCarViewModel updateRetiredCar = UpdateRetiredCarViewModel();
  TextEditingController _tecModel = TextEditingController() ;
  TextEditingController _tecLicensePlate = TextEditingController();
  TextEditingController _tecStatusVehicle = TextEditingController() ;
  TextEditingController _tecVehicleId = TextEditingController();

  late UpdateRetiredCarViewModel _lvm;

  @override
  void initState(){
    print ('UpdateRetiredCarViewState - initState()');
    this._lvm=Provider.of<UpdateRetiredCarViewModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print('UpdateRetiredCarViewState - build()');
    final args = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    print("args : ");
    print(args);
    if(args[1].isNotEmpty){
      _tecModel.text = args[1];
    }
    if(args[2].isNotEmpty){
      _tecLicensePlate.text = args[2];
    }
    if(args[3].isNotEmpty){
      _tecStatusVehicle.text = args[3];
    }
    _tecVehicleId.text = args[4];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppSettings.APP_UPDATERETIREDCAR),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 60, left: 10.0, right: 10.0, bottom: 10.0),
          children: <Widget>[
            Container(
                height: 70,
                child: new TextField(
                    controller: _tecModel,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                  labelText: AppSettings.strings.model,
                  ),
                )),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Container(
              height: 70,
              child:
              new TextField(
                controller: _tecLicensePlate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.model,
              ),)
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Container(
              height: 70,
              child: new TextField(
                controller: _tecStatusVehicle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppSettings.strings.model,
              ),)
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0),),

            Container(
              height: 35,
              child: new ElevatedButton(
                onPressed: () async {
                  this._lvm.updateRetiredcar(args[0].toString(),
                     _tecModel.text.trim(),
                      _tecLicensePlate.text.trim(),
                      _tecStatusVehicle.text.trim(),
                      _tecVehicleId.text.trim(),);
                  Navigator.popAndPushNamed(context, '/retiredcar');
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