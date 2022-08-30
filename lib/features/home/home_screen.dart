// MVP, MVC, MVVM
//
import 'package:flutter/material.dart';
import 'package:tinkercad/features/home/home_controller.dart';

const blaBla = 'dfln';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I\'m home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                controller.doSomething();
              },
              child: const Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}
