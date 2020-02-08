import 'package:flutter/material.dart';

class TellView extends StatefulWidget {
  TellView({Key key}) : super(key: key);

  @override
  _TellViewState createState() => _TellViewState();
}

class _TellViewState extends State<TellView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Contar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
       )
    );
  }
}