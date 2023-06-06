import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:tinkercad/features/create_activity/create_activity_state.dart';
import 'package:tinkercad/services/analytics.dart';
import 'package:tinkercad/services/api/models/activity.dart';
import 'package:tinkercad/services/stores/local_store.dart';

class CreateActivityBloc extends Cubit<CreateActivityState> {
  CreateActivityBloc()
      : super(CreateActivityState(
          allTasksComplete: false,
          error: null,
          isLoading: true,
          activities: [],
        ));

  final _localStore = GetIt.instance.get<Store>();
  final _analytics = GetIt.instance.get<Analytics>();

  //todo remove context
  Future<void> onSaveClicked(
    BuildContext context, {
    required String name,
    required String description,
  }) async {
    _analytics.addEvent('OnSaveClicked');

    await _localStore.addActivity(Activity(
      name: name,
      description: description,
    ));

    Navigator.of(context).pop();
  }
}
