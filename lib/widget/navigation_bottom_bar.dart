import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/calendar_screen.dart';

import 'navigation_bottom_bar_item.dart';

class NavigationBottomBar extends StatelessWidget {
  final int selectedIndex;

  NavigationBottomBar(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavigationBottomBarItem(
              subtitle: "Home",
              iconData: Icons.home,
              index: 1,
              routeName: '/',
              selectedIndex: selectedIndex,
            ),
            NavigationBottomBarItem(
              subtitle: "Calendar",
              iconData: Icons.calendar_today,
              index: 2,
              routeName: CalendarScreen.routeName,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
