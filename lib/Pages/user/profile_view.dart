import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecareapp/Pages/Auth/singIn.dart';
import 'package:wecareapp/controllers/AuthService.dart';

class ProfileView extends StatefulWidget {
  final FirebaseUser user;
  ProfileView({Key key, this.user}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child:RaisedButton(
           color: Colors.white,
            child: Text("Cerrar sesión", style: TextStyle(color: Color.fromARGB(255, 255, 178, 68), fontWeight: FontWeight.bold, fontSize: 25.0),),
            onPressed: () async {
              await AuthService().logout();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(),
                      fullscreenDialog: true));
            })
       ),
    );
  }
}