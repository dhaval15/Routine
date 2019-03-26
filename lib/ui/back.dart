import 'package:flutter/material.dart';
import 'package:routine/ui/style.dart';
import '../ui/brand.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginBackGround extends StatelessWidget {
  final Widget child;

  const LoginBackGround({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WaveWidget(
              config: CustomConfig(
                colors: [
                  Colors.white70,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ],
                durations: [9000, 11000, 8000, 5000],
                heightPercentages: [0.38, 0.41, 0.43, 0.45],
                blur: MaskFilter.blur(BlurStyle.solid, 0),
              ),
              backgroundColor: primaryColor[600],
              size: Size(double.infinity, double.infinity),
              waveAmplitude: 0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Logo(),
                      SizedBox(height: 12),
                      AppTitle(),
                    ],
                  )),
                ),
                Flexible(
                  flex: 1,
                  child: child,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
