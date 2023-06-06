import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/features/splash/app_initializer_controller.dart';

class AppInitializer extends ConsumerWidget {
  const AppInitializer({required this.app, super.key});

  final Widget app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(appInitializerControllerProvider);
    return state.when(
      data: (data) => app,
      error: (error, st) => const _SplashText('error'),
      loading: () => const _SplashText('Splash'),
    );
  }
}

class _SplashText extends StatelessWidget {
  const _SplashText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
