import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule.dart';

class ScheduleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<Schedule>(context, listen: true);
    return Column(
      children: <Widget>[
        Text(schedule.startHour.toString()),
        Text(schedule.endHour.toString()),
        Text(schedule.endHour.toString()),
      ],
    );
  }
}
