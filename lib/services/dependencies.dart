import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tinkercad/services/analytics.dart';
import 'package:tinkercad/services/stores/local_store.dart';

Future<void> initDependencies() async {
  final getIt = GetIt.instance;

  await Hive.initFlutter();

  final localStore = LocalStore();
  await localStore.init();
  getIt
    ..registerSingleton(localStore)
    ..registerLazySingleton(() => Analytics())
  ;

}
