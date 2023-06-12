import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp1appli/view_model/retiredcar/add_retiredcar_view_model.dart';
import 'package:sp1appli/config/app_settings.dart';

class AddRetiredcarView extends StatefulWidget{
  const AddRetiredcarView({Key? key}) : super(key: key);
  @override
  AddRetiredcarViewState createState() => AddRetiredcarViewState();
}

class AddRetiredcarViewState extends State<AddRetiredcarView> {

  AddRetiredcarViewModel addRetiredCar = new AddRetiredcarViewModel();

   TextEditingController _tecModel = new TextEditingController() ;
   TextEditingController _tecLicensePlate = new TextEditingController();
   TextEditingController _tecStatusVehicle = new TextEditingController() ;

  late AddRetiredcarViewModel _lvm;

  @override
  void initState(){
    print ('AddRetiredCarViewState - initState()');
    this._lvm=Provider.of<AddRetiredcarViewModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print('AddRetiredCarViewState - build()');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppSettings.APP_ADDRETIREDCAR),
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
                  hintText: "Modèle",
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
                  hintText: "Plaque d'immatriculation",
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
                  hintText: "Statut du véhicule",
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0),),

            Container(
              height: 35,
              child: new ElevatedButton(
                onPressed: (){
                  this._lvm.AddRetiredcar(
                      _tecModel.text.trim(), _tecLicensePlate.text.trim(), _tecStatusVehicle.text.trim());
                  Navigator.pushNamedAndRemoveUntil(context, '/retiredcar', ModalRoute.withName('/retiredcar'));
                },
                child: new Text('Ajouter',
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