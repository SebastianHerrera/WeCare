import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecareapp/Pages/Setup/singIn.dart';
import 'package:wecareapp/Pages/first_time.dart';
import 'package:wecareapp/Pages/home.dart';
import 'package:wecareapp/controllers/AuthService.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<FirebaseUser>(
        future: getUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.error != null){
              print("Error!");
              return Text(snapshot.error.toString());
            }

            return snapshot.hasData ? Home(user: snapshot.data,): LoginPage();
          }else{
            return LoadingCircle();
          }
        },
      )
    );
  }
}
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> getUser() {
    return _auth.currentUser();
}
class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}

