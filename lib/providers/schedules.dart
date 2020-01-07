import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/schedule.dart';
import '../helpers/methods_helper.dart';

class Schedules with ChangeNotifier {
  List<Schedule> _schedules = [];
  List<Schedule> _items = [];
  String _hello;

  List<Schedule> get schedules {
    return [..._schedules];
  }

  List<Schedule> get items {
    return [..._items];
  }

  String get stringHello {
    return _hello;
  }

  Future<void> fetchSchedule() async {
    if (_items.isNotEmpty) {
      return;
    } else {
      var url = 'https://api.litamua.com/jadwalmakeup/items/schedule';
      try {
        final response = await http.get(url);
        var extractedDatas = json.decode(response.body);
        extractedDatas = extractedDatas['data'] as List<dynamic>;
        if (extractedDatas == null) {
          return;
        }
        final List<Schedule> loadedSchedules = [];
        extractedDatas.forEach((scheData) {
          loadedSchedules.add(Schedule(
            endHour: MethodsHelper().stringToHhMm(scheData['end']),
            startHour: MethodsHelper().stringToHhMm(scheData['start']),
            dateTime: DateTime.parse(scheData['date']),
          ));
        });
        _schedules = loadedSchedules;
        _items = loadedSchedules;
        _hello = _schedules[0].dateTime.toIso8601String();

        print(['get date', _schedules[0].dateTime]);
        print(_hello);
        notifyListeners();
      } catch (error) {
        print(error);
      }
    }
  }
}
