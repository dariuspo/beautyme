
import 'package:flutter/material.dart';

class Schedule{
  final TimeOfDay startHour;
  final TimeOfDay endHour;
  final DateTime dateTime;
  final String name;
  final String address;

  Schedule({
    @required this.startHour,
    @required this.endHour,
    @required this.dateTime,
    this.name,
    this.address
  });
}
