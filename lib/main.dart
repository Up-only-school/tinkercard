import 'package:flutter/material.dart';
import 'package:tinkercad/features/home/home_screen.dart';
import 'package:tinkercad/services/dependencies.dart';

//todo error on getting Activity from HiveBox when restarting the App
//todo Implement storing and reading list of acitivities, not just one
//todo Add image for an activity
void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const HomePage(),
    );
  }
}
