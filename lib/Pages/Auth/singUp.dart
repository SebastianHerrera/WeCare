import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecareapp/Pages/Auth/singIn.dart';

class SingUpPage extends StatefulWidget {
  SingUpPage({Key key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'lib/images/draw2.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 10.0,),
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
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 178, 68), width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
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
                            borderSide: new BorderSide(color: Colors.white, width: 2.0),
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
                        onPressed: navigateToSinIn,
                        color: Color.fromARGB(250, 10, 17, 54),
                        child: Text(
                          'Ya tengo una cuenta.',
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
                        onPressed: singUp,
                        child: Text(
                          'Registrarse',
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

  void navigateToSinIn() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }



  void singUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((currentUser) => Firestore.instance
                  .collection("users")
                  .document(currentUser.user.uid)
                  .setData({
                "uid": currentUser.user.uid,
                "email": currentUser.user.email,
                "username": '',
                "icon": 'Default'
              }).then((result) => {
                        currentUser.user.sendEmailVerification(),
                        Navigator.of(context).pop(),
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(),
                                fullscreenDialog: true))
                      }));
    }
  }
}
