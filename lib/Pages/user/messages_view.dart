import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  final FirebaseUser user;
  MessagesView({Key key, this.user}) : super(key: key);

  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Mensajes :D.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
       )
    );
  }
}