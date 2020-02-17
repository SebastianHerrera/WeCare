import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecareapp/Pages/user/messages_view.dart';
import 'package:wecareapp/Pages/user/notifications_view.dart';
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
      MessagesView(),
      TellView(),
      NotificationsView(),
      ProfileView()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Text('${widget.user.email} | v0.1a 021420', style: TextStyle(fontSize: 15.0),)
      ),
      backgroundColor: Color.fromARGB(250, 10, 17, 54),
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: _children[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home, color: Colors.grey ),
           title: Text('Inicio', style: TextStyle(color: Colors.black38),),
           activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 255, 178, 68))
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.question_answer, color: Colors.grey),
           title: Text('Mensajes', style: TextStyle(color: Colors.black38),),
           activeIcon: Icon(Icons.question_answer, color: Color.fromARGB(255, 255, 178, 68))
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.add_circle, color: Colors.grey),
           title: Text('Contar', style: TextStyle(color: Colors.black38),),
           activeIcon: Icon(Icons.add_circle, color: Color.fromARGB(255, 255, 178, 68))
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.notifications, color: Colors.grey),
           title: Text('Profile', style: TextStyle(color: Colors.black38),),
           activeIcon: Icon(Icons.notifications, color: Color.fromARGB(255, 255, 178, 68))
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.face, color: Colors.grey),
           title: Text('Profile', style: TextStyle(color: Colors.black38),),
           activeIcon: Icon(Icons.face, color: Color.fromARGB(255, 255, 178, 68))
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
