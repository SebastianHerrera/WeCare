import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Setup/singIn.dart';

class Home extends StatefulWidget {
  const Home({key, this.user}) : super(key: key);

  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
              await FirebaseAuth.instance.signOut();
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
