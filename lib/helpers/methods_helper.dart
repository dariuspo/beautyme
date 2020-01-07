import 'package:flutter/material.dart';

class MethodsHelper {
  TimeOfDay stringToHhMm(String timeString) {
    String hour = timeString.substring(0, 2);
    String min = timeString.substring(3, 5);
    TimeOfDay time = TimeOfDay(hour: int.parse(hour), minute: int.parse(min));
    return time;
  }
}
