import 'package:flutter/material.dart';
import 'package:routine/api/routine.dart';
import 'package:routine/ui/add_task.dart';
import 'package:routine/ui/brand.dart';
import 'package:routine/ui/time_picker.dart';

class AddRoutine extends StatefulWidget {
  static final builder = MaterialPageRoute(builder: (context) => AddRoutine());

  @override
  AddRoutineState createState() => AddRoutineState();
}

class AddRoutineState extends State<AddRoutine> {
  List<TaskData> tasks = [];
  TimeOfDay lastTime = TimeOfDay(hour: 7, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: smartBar('Add Routine'),
      body: SafeArea(
        child: Container(
            child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(tasks[index].label),
                subtitle: Text(
                    '${format(tasks[index].from)} --> ${format(tasks[index].to)}'),
              ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: AddTask(
                    data: TaskData(
                      from: lastTime,
                      to: lastTime.replacing(hour: lastTime.hour + 1),
                    ),
                    onConfirm: (task) {
                      Navigator.of(context).pop();
                      setState(() {
                        lastTime = task.to;
                        tasks.add(task);
                      });
                    },
                  ),
                )
              ],
            ));
  }
}
