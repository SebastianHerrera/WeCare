import 'package:flutter/material.dart';
import 'package:wecareapp/Pages/Auth/singIn.dart';
import 'package:wecareapp/controllers/AuthService.dart';

class UserHome extends StatefulWidget {
  final String user;
  UserHome({Key key, this.user}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
       ),
    );
  }
}