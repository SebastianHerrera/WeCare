import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TellView extends StatefulWidget {
  final FirebaseUser user;

  TellView({Key key, this.user}) : super(key: key);

  @override
  _TellViewState createState() => _TellViewState();
}

class _TellViewState extends State<TellView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Para que te desahogues :3.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
       )
    );
  }
}