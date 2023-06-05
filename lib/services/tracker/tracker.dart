import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackerProvider = Provider((ref) => Tracker());

class Tracker {
  void logEvent(String s, {required Map<String, String> args}) {
    //todo
  }
}
