import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(250, 10, 17, 54),
      child: Center(
        child: SpinKitChasingDots(
          color: Color.fromARGB(255, 255, 178, 68),
          size: 50.0
        )
      ),
    );
  }
}