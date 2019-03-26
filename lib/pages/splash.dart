import 'package:flutter/material.dart';
import 'package:routine/ui/style.dart';
import '../pages/home.dart';
import '../pages/phone_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ui/brand.dart';

class Splash extends StatefulWidget {
  static final builder = MaterialPageRoute(builder: (context) => Splash());

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _wait();
  }

  _wait() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => user == null ? PhoneAuth() : Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: primaryColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(),
              SizedBox(height: 20),
              AppTitle(),
            ],
          ),
        ),
      ),
    );
  }
}
