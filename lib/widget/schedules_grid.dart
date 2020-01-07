import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedules.dart';
import '../widget/schedule_item.dart';
/*class SchedulesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedulesData = Provider.of<Schedules>(context).mapSchedules;
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      itemCount: schedulesData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: schedulesData[i],
        child: ScheduleItem(),
      ),
    );
  }
}*/
