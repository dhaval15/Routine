import 'package:flutter/material.dart';
import 'package:routine/pages/splash.dart';
import 'package:routine/ui/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
