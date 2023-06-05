import 'package:flutter/material.dart';
import 'package:tinkercad/features/common/navigation/navigation_tab.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.currentIndex,
    this.onSelected,
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: context.appTheme.colors.scaffoldBackground,
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            NavigationTab(
              label: 'Activity',
              index: 0,
              selectedIndex: currentIndex,
              onSelected: onSelected,
            ),
            NavigationTab(
              label: 'Monitor',
              index: 1,
              selectedIndex: currentIndex,
              onSelected: onSelected,
            ),
            NavigationTab(
              label: 'Settings',
              index: 2,
              selectedIndex: currentIndex,
              onSelected: onSelected,
            ),
          ],
        ),
      ),
    );
  }
}
