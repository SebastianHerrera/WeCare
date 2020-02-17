import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wecareapp/Pages/Auth/singIn.dart';
import 'package:wecareapp/Pages/Auth/singUp.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}
final List<String> images = [
    "lib/images/draw3.png",
    "lib/images/draw4.png",
    "lib/images/logo-complete-1.png",
  ];

  final List<String> text0 = [
    "Aquí podrás contarnos cualquier cosa que te suceda, desahogarte y recivir consejos.",
    "Puedes leer también a otras personas. aconsejarlas y hacer amigos. ",
    "!Bienvenido a WeCare!",
  ];
final List child = map<Widget>(
  images,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            child: Image.asset(i, fit: BoxFit.cover, width: 1000.0),
          ),
          SizedBox(height: 60.0),
          Container(
            child: Text(text0[index], style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
          )
        ]
      )
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _WelcomePageState extends State<WelcomePage> {

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 10, 17, 54),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: [
                CarouselSlider(
                  items: child,
                  height: 400.0,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  viewportFraction: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(images, (index, url){
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromARGB(255, 255, 178, 68)
                              : Colors.white),
                    );
                  })
                ),
              ]
            ),
            RaisedButton(
              color: Color.fromARGB(255, 255, 178, 68),
              textTheme: ButtonTextTheme.accent,
              textColor: Colors.white,
              onPressed: navigateToSingIn,
              child: Text('Iniciar Sesión',  style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Color.fromARGB(255, 255, 178, 68),
              textTheme: ButtonTextTheme.accent,
              textColor: Colors.white,
              onPressed: navigateToSingUp,
              child: Text('Registrarse',  style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      )
    );
  }

  void navigateToSingIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSingUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingUpPage(), fullscreenDialog: true));
  }
}
