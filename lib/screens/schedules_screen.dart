import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/schedules.dart';

import '../widget/schedules_grid.dart';
import '../widget/navigation_bottom_bar.dart';

class SchedulesScreen extends StatefulWidget {
  @override
  _SchedulesScreenState createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  var _isInit = true;
  var _isInitBuild = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit && this.mounted) {
      setState(() {
        _isLoading = true;
      }); // is the id!
      print('fetching');
      Provider.of<Schedules>(context).fetchSchedule().then((_) {
        setState(() {
          _isLoading = false;
          _isInit =false;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*if (_isInitBuild) {
      print('init build');
      _isLoading = true;
      Provider.of<Schedules>(context).fetchSchedule().then((_) {
        _isInitBuild = false;
        setState(() {
          _isLoading = false;
        });
      });
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal'),
      ),
      bottomNavigationBar: NavigationBottomBar(1),
      body: _isLoading
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SchedulesGrid(),
    );
  }
}
