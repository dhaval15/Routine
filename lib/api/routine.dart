import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RoutineData {
  String key;
  List<TaskData> tasks;
}

class Time {
  final int hour;
  final int minutes;

  Time({this.hour = 7, this.minutes = 0});
}

class TaskData {
  String key;
  final String label;
  final double weight;
  final TimeOfDay from;
  final TimeOfDay to;

  TaskData({this.key, this.label, this.weight, this.from, this.to});

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        key: json['k'],
        label: json['l'],
        weight: json['w'],
        from: decodeTime(json['f']),
        to: decodeTime(json['t']),
      );

  Map<String, dynamic> toJson() => {
        'k': key,
        'l': label,
        'w': weight,
        'f': encodeTime(from),
        't': encodeTime(to),
      };
}

TimeOfDay decodeTime(Map<String, dynamic> json) => TimeOfDay(
      hour: json['h'],
      minute: json['m'],
    );

Map<String, dynamic> encodeTime(TimeOfDay time) => {
      'h': time.hour,
      'm': time.minute,
    };
