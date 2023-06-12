import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/view_model/login_view_model.dart';

class LoginView extends StatefulWidget{
  LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('LoginView- createState()');
    return new LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {

  TextEditingController _tecEmail = TextEditingController();
  TextEditingController _tecPassword = TextEditingController();

  late LoginViewModel _lvm;

  @override
  void initState(){
    print ('LoginViewState - initState()');
    this._lvm=Provider.of<LoginViewModel>(context,listen: false);
  }

  late Scaffold _screen;
  @override
  Widget build(BuildContext context) {
    print('LoginViewState - build()');

    final applicationName = Container(
      color: Colors.lightBlue.shade300,
      padding: EdgeInsets.all(10),
      child: Text(AppSettings.APP_NAME, style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade800
      ),
      ),
    );

    final title = Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(AppSettings.strings.loginTitle, style: TextStyle(
            fontSize: 25,
            color: Colors.grey
        ),)
    );

    final email = Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: this._tecEmail,
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email, color: Colors.grey),
            labelText: AppSettings.strings.emailLabel,
            border: OutlineInputBorder(),
          ),
        )
    );

    final password = Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: this._tecPassword,
          autofocus: true,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password, color: Colors.grey),
            labelText: AppSettings.strings.passwordLabel,
            border: OutlineInputBorder(),
          ),
        )
    );

    final signInButton = Container(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
            child: Text(AppSettings.strings.signInButton),
            onPressed: () {
              Future<bool> isUserConnected = this._lvm.signInButtonOnClickCommand(
                  this._tecEmail.text, this._tecPassword.text);
              isUserConnected.then((isConnected) {
                if(isConnected){
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                }
              });
            }
        )
    );

    final space = Container(
      height: 20,
    );

    final form = Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        email,
        password,
        space,
        signInButton
      ],
    ),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          applicationName,
          space,
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                title,
                form
              ],
            ),
          ),
        ],
      ),
    );
  }

}