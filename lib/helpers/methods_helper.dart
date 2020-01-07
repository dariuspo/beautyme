import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay stringToHHMM(String timeString) {
  String hour = timeString.substring(0, 2);
  String min = timeString.substring(3, 5);
  TimeOfDay time = TimeOfDay(hour: int.parse(hour), minute: int.parse(min));
  return time;
}

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.Hm(); //"6:00 AM"
  return format.format(dt);
}
