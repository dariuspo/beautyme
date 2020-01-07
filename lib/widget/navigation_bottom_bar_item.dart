import 'package:flutter/material.dart';

class NavigationBottomBarItem extends StatelessWidget {
  final String subtitle;
  final String routeName;
  final IconData iconData;
  final int index;
  final int selectedIndex;

  NavigationBottomBarItem({
    this.subtitle,
    this.routeName,
    this.iconData,
    this.index,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Icon(
                iconData,
                color: selectedIndex == index ? Colors.yellow : Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: selectedIndex == index
                  ? Theme.of(context).textTheme.headline
                  : Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
