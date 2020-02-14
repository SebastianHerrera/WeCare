import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  final FirebaseUser user;

  NotificationsView({Key key, this.user}) : super(key: key);

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Tus notificaciones estarán aquí uwur', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
       )
    );
  }
}