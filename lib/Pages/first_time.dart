import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wecareapp/Pages/Setup/singIn.dart';
import 'package:wecareapp/Pages/tutorial.dart';

class FirstTimePage extends StatefulWidget {
  FirstTimePage({Key key}) : super(key: key);

  @override
  _FirstTimePageState createState() => _FirstTimePageState();
}

class _FirstTimePageState extends State<FirstTimePage> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    var _duration = new Duration(seconds: 3);

    if (firstTime != null && !firstTime) {
      return new Timer(_duration, navToHome);
    } else {
      //First Time
      prefs.setBool('first_time', true);
      return new Timer(_duration, navToTutorial);
    }
  }

  void navToHome() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navToTutorial() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TutorialPage(), fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 10, 17, 54),
      body: Container(
        child: Center(
          child: Text('Cargando...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
}
