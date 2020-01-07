
import 'package:flutter/material.dart';

class Schedule with ChangeNotifier{
  final TimeOfDay startHour;
  final TimeOfDay endHour;
  final DateTime dateTime;

  Schedule({
    @required this.startHour,
    @required this.endHour,
    @required this.dateTime,
  });
}
