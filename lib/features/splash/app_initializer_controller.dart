import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/features/splash/app_initializer_state.dart';
import 'package:tinkercad/firebase_options.dart';

final appInitializerControllerProvider =
    StateNotifierProvider<AppInitializerController, AsyncValue<AppInitializerState>>(
  (ref) => AppInitializerController(ref),
);

class AppInitializerController extends StateNotifier<AsyncValue<AppInitializerState>> {
  AppInitializerController(Ref ref) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    state = AsyncValue.data(AppInitializerState());
  }
}
