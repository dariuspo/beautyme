import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/schedule.dart';
import '../helpers/methods_helper.dart';

class Schedules with ChangeNotifier {
  Map<DateTime, List<Schedule>> _mapSchedules = {};
  final Map<String, Schedule> _dailyEvents = {
    '3':null,
    '4':null,
    '5':null,
    '6':null,
    '7':null,
    '8':null,
    '9':null,
    '10':null,
    '11':null,
    '12':null,
    '13':null,
    '14':null,
    '15':null,
    '16':null,
    '17':null,
  };

  Map<DateTime, List<Schedule>> get mapSchedules {
    return _mapSchedules;
  }

  Map<String, Schedule> renderTimeline(List<Schedule> schedules){
    schedules.forEach((schedule){
      int start = int.parse(schedule.startHour.substring(0,2));
      int end = int.parse(schedule.endHour.substring(0,2));
      for(int i=start; i<=end; i++){
        _dailyEvents[i.toString()] = schedule;
      }
    });
    return _dailyEvents;
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
            endHour: scheData['end'].substring(0,5),
            startHour: scheData['start'].substring(0,5),
            dateTime: DateTime.parse(scheData['date']),
            name: scheData['name'],
            address: scheData['address'],
          ));
          if (mapLoadedSchedules.containsKey(DateTime.parse(scheData['date']))) {
            mapLoadedSchedules[DateTime.parse(scheData['date'])].add(Schedule(
              endHour: scheData['end'].substring(0,5),
              startHour: scheData['start'].substring(0,5),
              dateTime: DateTime.parse(scheData['date']),
              name: scheData['name'],
              address: scheData['address'],
            ));
          }else{
            mapLoadedSchedules.putIfAbsent(
                DateTime.parse(scheData['date']), () => loadedSchedules);
          }
        });
        _mapSchedules = mapLoadedSchedules;
        notifyListeners();
      } catch (error) {
        print(error);
      }
    }
  }


}
