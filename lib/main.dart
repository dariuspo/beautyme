import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './screens/calendar_screen.dart';
import './screens/schedules_screen.dart';
import './providers/schedules.dart';

void main() => runApp(BeautyMe());

class BeautyMe extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Schedules(),
        ),
      ],
      child: MaterialApp(
        home: SchedulesScreen(),
        routes: {
          CalendarScreen.routeName: (ctx) => CalendarScreen(
                title: 'Calendar',
              ),
        },
      ),
    );
  }
}
