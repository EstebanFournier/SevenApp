import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/view_model/retiredcar/retiredcarForm_view_model.dart';

class RetiredcarFormView extends StatefulWidget{

  RetiredcarFormView({Key? key}) : super(key: key);
  @override
  RetiredcarFormViewState createState() => RetiredcarFormViewState();
}

class RetiredcarFormViewState extends State<RetiredcarFormView>{

  late RetiredCarFormViewModel _lvm;

  @override
  void initState(){
    print ('RetiredcarFormViewState - initState()');
    this._lvm=Provider.of<RetiredCarFormViewModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print('RetiredcarFormViewState - build()');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppSettings.APP_RETIREDCARFORM),
      ),
    );

  }

}
