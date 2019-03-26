import 'package:flutter/material.dart';

class OverView extends StatelessWidget {
  final Widget main;

  final Widget top;

  final Widget bottom;

  const OverView({this.main, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: Align(
            child: main,
            alignment: Alignment.center,
          ),
        ),
        Align(
          child: top,
          alignment: Alignment.topCenter,
        ),
        Align(
          child: bottom,
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}
