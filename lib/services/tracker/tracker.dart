import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackerProvider = Provider((ref) => Tracker());

class Tracker {
  void logEvent(String s, {Map<String, dynamic>? args}) {
    //todo
  }
}
