import 'package:flutter/material.dart';
import 'package:wecareapp/Pages/Auth/singIn.dart';
import 'package:wecareapp/Pages/Auth/singUp.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 10, 17, 54),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'lib/images/logo-complete-1.png',
              width: 250,
              height: 250,
            ),
            RaisedButton(
              color: Color.fromARGB(255, 255, 178, 68),
              textTheme: ButtonTextTheme.accent,
              textColor: Colors.white,
              onPressed: navigateToSingIn,
              child: Text('Iniciar Sesión',  style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Color.fromARGB(255, 255, 178, 68),
              textTheme: ButtonTextTheme.accent,
              textColor: Colors.white,
              onPressed: navigateToSingUp,
              child: Text('Registrarse',  style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }

  void navigateToSingIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSingUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingUpPage(), fullscreenDialog: true));
  }
}
