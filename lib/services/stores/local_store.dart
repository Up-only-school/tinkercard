import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/services/api/models/activity.dart';

final storeProvider = Provider((ref) => Store());

class Store {
  Store();

  late final FirebaseFirestore _db;

  // late Box<Map<String, dynamic>> _activitiesBox;

  Future<void> init() async {
    _db = FirebaseFirestore.instance;
    // _activitiesBox = await Hive.openBox('preferences');
  }

  Future<List<Activity>> getActivities() async {
    final snapshot = await _db.collection('activities').get();
    return snapshot.docs.map((e) {
      var json = e.data();
      // return json;

      return Activity(
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
      );
    }).toList();
  }

  Future<void> addActivity(Activity activity) => _db.collection('activities').add(activity.toJson());
}
