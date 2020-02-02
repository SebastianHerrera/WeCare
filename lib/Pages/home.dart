import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecareapp/controllers/AuthService.dart';
import 'Auth/singIn.dart';
class Home extends StatefulWidget {
  const Home({key, this.user}) : super(key: key);

  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.user.email}'),
      ),
      body: Container(
        child: RaisedButton(
            child: Text("LOGOUT"),
            onPressed: () async {
              await AuthService().logout();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(),
                      fullscreenDialog: true));
            }),
      ),
    );
  }
}
//
