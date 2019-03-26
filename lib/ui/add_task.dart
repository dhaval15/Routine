import 'package:flutter/material.dart';
import 'package:routine/api/routine.dart';
import 'package:routine/ui/style.dart';
import 'package:routine/ui/time_picker.dart';

class AddTask extends StatefulWidget {
  final Function(TaskData) onConfirm;
  final GestureTapCallback onCancelled;

  final TaskData data;

  const AddTask({this.data, this.onConfirm, this.onCancelled});

  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  TextEditingController _labelController;
  TimeController _fromController;
  TimeController _toController;

  @override
  void initState() {
    super.initState();
    var data = widget.data;
    if (data == null) data = TaskData();
    _labelController = TextEditingController(text: data.label);
    _fromController = TimeController(time: data.from);
    _toController = TimeController(time: data.to);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Add Task'),
        TextField(
          controller: _labelController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Label',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('From : '),
            TimePicker(
              controller: _fromController,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('To : '),
            TimePicker(
              controller: _toController,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: widget.onCancelled,
              child: Text('Cancel'),
              textColor: buttonColor,
            ),
            MaterialButton(
              onPressed: () {
                widget.onConfirm(TaskData(
                  from: _fromController.time,
                  label: _labelController.text,
                  to: _toController.time,
                ));
              },
              child: Text('Add'),
              color: buttonColor,
              textColor: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}
