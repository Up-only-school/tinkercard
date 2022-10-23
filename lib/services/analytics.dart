import 'package:flutter/foundation.dart';

class Analytics {
  void addEvent(String event, {Map<String, dynamic>? args}) {
    if (kDebugMode) {
      // print('track event: $event\n$args');
    }
  }
}
