import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecareapp/Pages/user/profile_view.dart';
import 'package:wecareapp/Pages/user/tell_view.dart';
import 'package:wecareapp/Pages/user/user_home.dart';
class Home extends StatefulWidget {
  const Home({key, this.user}) : super(key: key);
  final FirebaseUser user;


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
      UserHome(),
      TellView(),
      ProfileView()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 10, 17, 54),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home, color: Color.fromARGB(255, 255, 178, 68)),
           title: Text('Inicio'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.mail, color: Color.fromARGB(255, 255, 178, 68)),
           title: Text('Contar'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person, color: Color.fromARGB(255, 255, 178, 68)),
           title: Text('Profile')
         )
       ],
     ),
    );
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}
//
