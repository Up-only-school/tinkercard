

import 'package:hive/hive.dart';

class LocalStore {
  LocalStore() {
    print('Local store instance created ${hashCode}');
  }

  late Box _prefs;

  Future<void> init() async {
    _prefs = await Hive.openBox('preferences');
  }

  bool getActivities() => _prefs.get('activities') == true;

  void addActivity(bool value) {
    print('LocalStore#addActivity');
    // _prefs.put('activities', value);
  }

}