import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/features/splash/app_initializer_state.dart';
import 'package:tinkercad/firebase_options.dart';
import 'package:tinkercad/services/stores/local_store.dart';

final appInitializerControllerProvider =
    StateNotifierProvider<AppInitializerController, AsyncValue<AppInitializerState>>(
  (ref) => AppInitializerController(ref),
);

class AppInitializerController extends StateNotifier<AsyncValue<AppInitializerState>> {
  AppInitializerController(this._ref) : super(const AsyncValue.loading()) {
    _init();
  }

  final Ref _ref;

  Future<void> _init() async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      await _ref.read(storeProvider).init();

      state = AsyncValue.data(AppInitializerState());
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }
}
