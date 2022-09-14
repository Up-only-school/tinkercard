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
    final description = activity.description;

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

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
