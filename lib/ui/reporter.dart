import 'package:flutter/material.dart';
import 'package:routine/ui/style.dart';

class BugReporter extends StatefulWidget {
  @override
  BugReporterState createState() => BugReporterState();
}

class BugReporterState extends State<BugReporter> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ErrorTap extends StatelessWidget {
  final double size;
  final GestureTapCallback onPressed;
  final Color color;

  final String error;

  final double fontSize;

  const ErrorTap({
    this.size = 72,
    this.onPressed,
    this.color = buttonColor,
    this.error = 'Error',
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.error,
            size: size,
            color: color,
          ),
        ),
        SizedBox(height: 16),
        Text(
          error,
          style: TextStyle(fontSize: fontSize),
        )
      ],
    );
  }
}
