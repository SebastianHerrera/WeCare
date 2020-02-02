import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecareapp/Pages/Auth/singUp.dart';
import 'package:wecareapp/Pages/home.dart';
import 'package:wecareapp/controllers/AuthService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(250, 10, 17, 54),
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'lib/images/logo-complete 1.png',
                width: 250,
                height: 250,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Por favor escribe un correo';
                        }
                      },
                      style: TextStyle(
                        color: Colors.white
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 178, 68), width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          icon: Icon(
                            Icons.email,
                            size: 30,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (input) {
                        if (input.length < 6) {
                          return 'Tu contraseña debe de tener minimo 5 carácteres.';
                        }
                      },
                      style: TextStyle(
                        color: Colors.white
                      ),
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                          labelText: 'Clave',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 178, 68), width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          icon: Icon(
                            Icons.vpn_key,
                            size: 30,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    Container(
                      child: RaisedButton(
                        onPressed: navigateToSinUp,
                        color: Color.fromARGB(250, 10, 17, 54),
                        child: Text(
                          'No tengo una cuenta.',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 178, 68),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 10000,
                      child: RaisedButton(
                        color: Color.fromARGB(255, 255, 178, 68),
                        textTheme: ButtonTextTheme.accent,
                        textColor: Colors.white,
                        onPressed: singIn,
                        child: Text(
                          'Iniciar sesion',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void navigateToSinUp() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SingUpPage(), fullscreenDialog: true));
  }

  void singIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      AuthService().loginUser(email: _email, password: _password).then((user) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      });
    }
  }
}

//
