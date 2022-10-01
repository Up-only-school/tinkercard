import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tinkercad/services/api/models/activity.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    required this.activity,
    Key? key,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
              imageUrl: activity.imageUrl ?? '',
              errorWidget: (_, __, ___) => Container(color: Colors.amber),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: _Description(activity: activity),
                ),
                _Buttons(
                  onPositivePressed: () {},
                  onNegativePressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.onPositivePressed,
    required this.onNegativePressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPositivePressed;
  final VoidCallback onNegativePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ActionButton(
          color: Colors.red.shade300,
          text: '👎',
          onPressed: onNegativePressed,
        ),
        _ActionButton(
          color: Colors.blue.shade400,
          text: '👍',
          onPressed: onPositivePressed,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.text,
    required this.color,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({required this.activity, Key? key}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final description = activity.description;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            activity.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              description,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
      ],
    );
  }
}
