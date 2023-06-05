import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/services/dependencies.dart';
import 'package:tinkercad/services/navigation/app_router.dart';

//todo error on getting Activity from HiveBox when restarting the App
//todo Implement storing and reading list of acitivities, not just one
//todo disable save acitivity button when required fields are empty
//todo Add image for an activity
void main() async {
  await initDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouterProvider);

    return MaterialApp.router(
      routerConfig: router.delegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
