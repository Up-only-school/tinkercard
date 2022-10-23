import 'package:hive/hive.dart';
import 'package:tinkercad/services/api/models/activity.dart';

class LocalStore {
  LocalStore();

  late Box<Map<String, dynamic>> _activitiesBox;

  Future<void> init() async {
    _activitiesBox = await Hive.openBox('preferences');
  }

  Future<List<Activity>> getActivities() async {
    var json = _activitiesBox.get('activities');
    if (json == null) {
      return [];
    } else {
      return [
        Activity(
          name: json['name'],
          description: json['description'],
          imageUrl: json['imageUrl'],
        )
      ];
    }
  }

  Future<void> addActivity(Activity activity) => _activitiesBox.put(
        'activities',
        activity.toJson(),
      );
}
