import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  MessagesView({Key key}) : super(key: key);

  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Messages', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
       )
    );
  }
}