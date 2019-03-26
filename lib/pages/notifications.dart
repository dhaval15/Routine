import 'package:flutter/material.dart';
import '../ui/brand.dart';

class Notifications extends StatelessWidget {
  static final builder =
      MaterialPageRoute(builder: (context) => Notifications());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: smartBar('Notifications'),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('No Notifications'),
          ),
        ),
      ),
    );
  }
}
