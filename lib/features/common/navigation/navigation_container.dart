import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinkercad/features/common/navigation/app_navigation_bar.dart';
import 'package:tinkercad/services/tracker/tracker.dart';

class NavigationContainer extends HookConsumerWidget {
  const NavigationContainer({
    required this.navigationShell,
    Key? key,
  }) : super(key: const ValueKey('NavigationContainer'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracker = ref.watch(trackerProvider);

    return Column(
      children: [
        Expanded(child: navigationShell),
        AppNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onSelected: (index) {
            tracker.logEvent("NavigationTabPressed", args: {"tab": _getTabName(index)});
            final initialLocation = navigationShell.currentIndex == index;
            navigationShell.goBranch(index, initialLocation: initialLocation);
          },
        ),
      ],
    );
  }

  String _getTabName(int index) {
    switch (index) {
      case 0:
        return "Activity";
      case 1:
        return 'Monitor';
      case 2:
        return 'Settings';
      default:
        return 'Unknown';
    }
  }
}
