import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/schedule.dart';
import '../helpers/methods_helper.dart';

class Schedules with ChangeNotifier {
  Map<DateTime, List<Schedule>> _mapSchedules = {};
  Map<DateTime, List> _mapEventSchedules = {};


  Map<DateTime, List<Schedule>> get mapSchedules {
    return _mapSchedules;
  }


  Future<void> fetchSchedule() async {
    if (_mapSchedules.isNotEmpty) {
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
        final Map<DateTime, List<Schedule>> mapLoadedSchedules = {};
        extractedDatas.forEach((scheData) {
          final List<Schedule> loadedSchedules = [];
          loadedSchedules.add(Schedule(
            endHour: stringToHHMM(scheData['end']),
            startHour: stringToHHMM(scheData['start']),
            dateTime: DateTime.parse(scheData['date']),
            name: scheData['name'],
            address: scheData['address'],
          ));
          if (mapLoadedSchedules.containsKey(DateTime.parse(scheData['date']))) {
            print("contains key");
            mapLoadedSchedules[DateTime.parse(scheData['date'])].add(Schedule(
              endHour: stringToHHMM(scheData['end']),
              startHour: stringToHHMM(scheData['start']),
              dateTime: DateTime.parse(scheData['date']),
              name: scheData['name'],
              address: scheData['address'],
            ));
          }else{
            print("not contains key");
            mapLoadedSchedules.putIfAbsent(
                DateTime.parse(scheData['date']), () => loadedSchedules);
          }
        });
        print(mapLoadedSchedules);
        _mapSchedules = mapLoadedSchedules;
        notifyListeners();
      } catch (error) {
        print(error);
      }
    }
  }
}
