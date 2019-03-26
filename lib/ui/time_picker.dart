import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final TimeController controller;

  const TimePicker({this.controller});

  @override
  TimePickerState createState() => TimePickerState();
}

class TimePickerState extends State<TimePicker> {
  TimeController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null)
      _controller = TimeController();
    else
      _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: _pickTime,
      child: Text(_controller.formattedTime),
    );
  }

  _pickTime() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: _controller.time.hour, minute: _controller.time.minute));
    if (time != null)
      setState(() {
        _controller.time = time;
      });
  }
}

class TimeController {
  TimeOfDay time;

  String get formattedTime => format(time);

  TimeController({this.time}) {
    if (time == null) time = TimeOfDay.now();
  }
}

String format(TimeOfDay time) {
  int h = ((time.hour) % 12);
  final b = StringBuffer();
  if (h == 0) h = 12;
  if (h < 10) b.write('0');
  b.write('$h');

  b.write(':');

  int m = time.minute;
  if (m < 10) b.write('0');
  b.write('$m');
  b.write('  ');
  b.write(h < 12 ? 'AM' : 'PM');
  return b.toString();
}
