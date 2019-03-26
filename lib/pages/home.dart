import 'package:flutter/material.dart';
import 'package:routine/ui/smart_drawer.dart';
import '../ui/brand.dart';

class Home extends StatefulWidget {
  static final builder = MaterialPageRoute(builder: (context) => Home());

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: smartBar('Routine'),
      body: SafeArea(
        child: Container(
          child: Column(),
        ),
      ),
      drawer: SmartDrawer(),
    );
  }
}
