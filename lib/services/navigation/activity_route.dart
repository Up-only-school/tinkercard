import 'package:go_router/go_router.dart';
import 'package:tinkercad/features/home/home_screen.dart';

class ActivityRoute extends StatefulShellBranch {
  ActivityRoute()
      : super(
          initialLocation: '/activity',
          routes: <RouteBase>[
            GoRoute(
              path: '/activity',
              name: 'Activity',
              builder: (context, state) => const HomePage(),
            ),
          ],
        );
}
