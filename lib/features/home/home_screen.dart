// MVP, MVC, MVVM
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinkercad/features/home/home_controller.dart';
import 'package:tinkercad/features/home/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I\'m home'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state.isLoading) const Center(child: CircularProgressIndicator()),
                if (!state.isLoading)
                  Text(
                    'Cards must be displayed',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => bloc.doSomething(),
                  child: const Text('Press me'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
