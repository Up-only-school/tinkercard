import 'package:go_router/go_router.dart';
import 'package:tinkercad/features/routine/routine_screen.dart';

class RoutineRoute extends StatefulShellBranch {
  RoutineRoute()
      : super(
          initialLocation: '/routine',
          routes: <RouteBase>[
            GoRoute(
              path: '/routine',
              name: 'Routine',
              builder: (context, state) => const RoutineScreen(),
            ),
          ],
        );
}
