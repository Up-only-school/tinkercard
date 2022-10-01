import 'package:flutter/material.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'All is tracked!',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          'See you tomorrow',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
