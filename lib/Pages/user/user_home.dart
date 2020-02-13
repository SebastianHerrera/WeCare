import 'package:flutter/material.dart';
import 'package:wecareapp/Pages/Auth/singIn.dart';
import 'package:wecareapp/components/tell_card.dart';
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
    return Center(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TellCard(username: "Sebastian Beleño", time_ago: "Hace 10 minutos", tag: "Deprimido", card_text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
            ]),
      ),
    );
  }
}
