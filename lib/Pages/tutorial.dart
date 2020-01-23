import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class TutorialPage extends StatefulWidget {
  TutorialPage({Key key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int _slideIndex = 0;

  final List<String> text0 = [
    "Aquí podrás contarnos cualquier cosa que te suceda, desahogarte y recivir consejos.",
    "Puedes leer también a otras personas. aconsejarlas y hacer amigos. ",
    "!Bienvenido a WeCare!",
  ];

  final List<String> images = [
    "lib/images/logo-complete 1.png",
    "lib/images/draw1.png",
    "lib/images/draw2.png",
  ];

  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
      pageSnapping: true,
      onPageChanged: (index) {
        setState(() {
          this._slideIndex = index;
        });
      },
      loop: false,
      transformer:
          PageTransformerBuilder(builder: (Widget child, TransformInfo info) {
        return new Material(
          color: Color.fromARGB(250, 10, 17, 54),
          elevation: 8.0,
          textStyle: new TextStyle(color: Colors.white),
          borderRadius: new BorderRadius.circular(12.0),
          child: Container(
            alignment: Alignment.center,
            color: Color.fromARGB(250, 10, 17, 54),
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ParallaxContainer(
                    child: Text(
                      text0[info.index],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold),
                    ),
                    position: info.position,
                    opacityFactor: .8,
                    translationFactor: 400.0,
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  ParallaxContainer(
                    child: Image.asset(images[info.index]),
                    position: info.position,
                    translationFactor: 300.0,
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  
                ],
              ),
            ),
          ),
        );
      }),
      itemCount: 3,
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 10, 17, 54),
      body: transformerPageView,
    );
  }
}
