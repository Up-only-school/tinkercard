import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/features/routine/create_activity/create_activity_screen.dart';
import 'package:tinkercad/features/routine/overview/routine_state.dart';
import 'package:tinkercad/services/api/models/activity.dart';
import 'package:tinkercad/services/repositories/metrics_repository.dart';
import 'package:tinkercad/services/stores/local_store.dart';
import 'package:tinkercad/services/tracker/tracker.dart';

final routineControllerProvider = StateNotifierProvider<RoutineBloc, RoutineState>((ref) => RoutineBloc(ref));

class RoutineBloc extends StateNotifier<RoutineState> {
  RoutineBloc(Ref ref)
      : _localStore = ref.read(storeProvider),
        _analytics = ref.read(trackerProvider),
        super(RoutineState(
          allTasksComplete: false,
          error: null,
          isLoading: true,
          activities: [],
        )) {
    _loadActivities();
  }

  final Store _localStore;
  final Tracker _analytics;
  final _metrics = MetricsRepository();

  Future<void> _loadActivities() async {
    final activities = await _localStore.getActivities();
    emit(RoutineState(
      allTasksComplete: false,
      error: null,
      isLoading: false,
      activities: activities,
    ));
  }

  void doSomething() {
    emit(RoutineState(
      allTasksComplete: false,
      error: null,
      isLoading: false,
      activities: [],
    ));
  }

  Future<void> onNegativePressed(Activity activity) async {
    _onActivityCompleted(activity, false);
  }

  Future<void> onPositivePressed(Activity activity) async {
    _onActivityCompleted(activity, true);
  }

  void _onActivityCompleted(Activity activity, bool isCompleted) {
    _analytics.logEvent('ActivityCompleted', args: {'isCompleted': isCompleted});

    // store event for app metrics
    _metrics.store(
      activity: activity,
      isCompleted: false,
      date: DateTime.now(),
    );

    // remove current card
    final currentActivities = state.activities;
    currentActivities.remove(activity);

    emit(RoutineState(
      allTasksComplete: currentActivities.isEmpty,
      error: null,
      isLoading: false,
      activities: currentActivities,
    ));
  }

  //todo BuildContext must not be used in Bloc
  Future<void> onAddActivityClicked(BuildContext context) async {
    _analytics.logEvent('AddActivityClicked');

    final navigator = Navigator.of(context);
    await navigator.push(MaterialPageRoute(
      builder: (context) => const CreateActivityPage(),
    ));

    _loadActivities();
  }

  void emit(RoutineState homeState) {
    state = homeState;
  }
}
