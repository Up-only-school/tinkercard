import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/features/routine/create_activity/create_activity_state.dart';
import 'package:tinkercad/services/api/models/activity.dart';
import 'package:tinkercad/services/stores/local_store.dart';
import 'package:tinkercad/services/tracker/tracker.dart';

final createActivityControllerProvider =
    StateNotifierProvider<CreateActivityController, CreateActivityState>((ref) => CreateActivityController(ref));

class CreateActivityController extends StateNotifier<CreateActivityState> {
  CreateActivityController(Ref ref)
      : _localStore = ref.read(storeProvider),
        _analytics = ref.read(trackerProvider),
        super(CreateActivityState(
          allTasksComplete: false,
          error: null,
          isLoading: true,
          activities: [],
        ));

  final Store _localStore;
  final Tracker _analytics;

  //todo remove context
  Future<void> onSaveClicked(
    BuildContext context, {
    required String name,
    required String description,
  }) async {
    _analytics.logEvent('OnSaveClicked');

    await _localStore.addActivity(Activity(
      name: name,
      description: description,
    ));
  }
}
