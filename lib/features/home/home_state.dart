import 'package:tinkercad/services/api/models/activity.dart';

/// POJO - plain old java object
/// equals, hashcode, copyWith
class HomeState {
  HomeState({
    this.activities = const [],
    this.error,
    this.isLoading = false,
    this.allTasksComplete = false,
  });

  final List<Activity> activities;
  final Object? error;
  final bool isLoading;
  final bool allTasksComplete;
}
