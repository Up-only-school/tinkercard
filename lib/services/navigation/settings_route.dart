import 'package:go_router/go_router.dart';
import 'package:tinkercad/features/settings/settings_screen.dart';

class SettingsRoute extends StatefulShellBranch {
  SettingsRoute()
      : super(
          initialLocation: '/settings',
          routes: <RouteBase>[
            GoRoute(
              path: '/settings',
              name: 'Settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        );
}
