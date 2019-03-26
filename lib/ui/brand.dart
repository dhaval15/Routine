import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../ui/style.dart';
import 'package:line_icons/line_icons.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'title',
      child: Text(
        'Routine',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'icon',
      child: Icon(
        LineIcons.tasks,
        size: 96,
        color: Colors.white,
      ),
    );
  }
}

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: loadingColor,
      lineWidth: 2,
      size: 48,
    );
  }
}

AppBar smartBar(String title) => AppBar(
      centerTitle: true,
      title: Text(title),
      elevation: 0,
      backgroundColor: primaryColor,
    );
