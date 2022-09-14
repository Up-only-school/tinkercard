import 'package:tinkercad/services/api/models/activity.dart';

class Api {
  Future<List<Activity>> loadActivities() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const Activity(
        name: 'Push ups',
        description: '20 push ups',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Man_Doing_Push_Ups_Cartoon.svg/1200px-Man_Doing_Push_Ups_Cartoon.svg.png',
      ),
      const Activity(
        name: 'Yoga',
        description: 'Yoga with Adrienne',
        imageUrl: 'https://previews.123rf.com/images/jemastock/jemastock1704/jemastock170401666/75346751-man-doing-yoga-cartoon-icon-over-white-background-colorful-design-vector-illustration.jpg',
      ),
      const Activity(
        name: 'Planks',
        description: '5 minute planks',
        imageUrl: 'https://st2.depositphotos.com/4293685/8642/v/950/depositphotos_86427412-stock-illustration-perfect-body-with-the-plank.jpg',
      ),
    ];
  }
}
