import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tinkercad/features/create_activity/create_activity_screen.dart';
import 'package:tinkercad/features/home/home_state.dart';
import 'package:tinkercad/services/analytics.dart';
import 'package:tinkercad/services/api/models/activity.dart';
import 'package:tinkercad/services/repositories/metrics_repository.dart';
import 'package:tinkercad/services/stores/local_store.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc()
      : super(HomeState(
          allTasksComplete: false,
          error: null,
          isLoading: true,
          activities: [],
        )) {
    _loadActivities();
  }

  final _localStore = GetIt.instance.get<LocalStore>();

  //todo move to GetIt
  final _metrics = MetricsRepository();
  final _analytics = Analytics();

  Future<void> _loadActivities() async {
    final activities = await _localStore.getActivities();
    emit(HomeState(
      allTasksComplete: false,
      error: null,
      isLoading: false,
      activities: activities,
    ));
  }

  void doSomething() {
    emit(HomeState(
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
    _analytics.addEvent('ActivityCompleted', args: {'isCompleted': isCompleted});

    // store event for app metrics
    _metrics.store(
      activity: activity,
      isCompleted: false,
      date: DateTime.now(),
    );

    // remove current card
    final currentActivities = state.activities;
    currentActivities.remove(activity);

    emit(HomeState(
      allTasksComplete: currentActivities.isEmpty,
      error: null,
      isLoading: false,
      activities: currentActivities,
    ));
  }

  //todo BuildContext must not be used in Bloc
  Future<void> onAddActivityClicked(BuildContext context) async {
    _analytics.addEvent('AddActivityClicked');

    final navigator = Navigator.of(context);
    await navigator.push(MaterialPageRoute(
      builder: (context) => const CreateActivityPage(),
    ));

    _loadActivities();
  }
}
