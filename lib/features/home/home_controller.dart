import 'package:bloc/bloc.dart';
import 'package:tinkercad/features/home/home_state.dart';
import 'package:tinkercad/services/api/api.dart';
import 'package:tinkercad/services/api/models/activity.dart';
import 'package:tinkercad/services/repositories/metrics_repository.dart';

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

  final api = Api();
  final _metrics = MetricsRepository();

  Future<void> _loadActivities() async {
    final activities = await api.loadActivities();
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
    // log analytics event
    //todo

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
}
