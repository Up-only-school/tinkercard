import 'package:go_router/go_router.dart';
import 'package:tinkercad/features/monitor/monitor_screen.dart';

class MonitorRoute extends StatefulShellBranch {
  MonitorRoute()
      : super(
          initialLocation: '/monitor',
          routes: <RouteBase>[
            GoRoute(
              path: '/monitor',
              name: 'Monitor',
              builder: (context, state) => const MonitorScreen(),
            ),
          ],
        );
}
