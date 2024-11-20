import 'package:townsquare/domain/entities/activity.dart';

class ActivityViewModel {
  final List<Activity> activities = [
    Activity(
      time: '08:00',
      duration: '60 min',
      title: 'Beach Yoga',
      location: 'La Playa de la Rada',
      price: 9,
      spotsLeft: 8,
      tags: ['light'],
      instructor: 'Maria',
    ),
    Activity(
      time: '09:00',
      duration: '60 min',
      title: 'Reformer Pilates',
      location: 'Wellness Studios',
      price: 15,
      spotsLeft: 4,
      tags: ['medium', 'childcare'],
      instructor: 'Ana',
    ),
    Activity(
      time: '12:30',
      duration: '45 min',
      title: '5-a-side Football',
      location: 'Municipal Sports Center',
      price: 19,
      spotsLeft: 0,
      tags: ['high', 'childcare'],
      instructor: 'Carlos',
      isSoldOut: true,
    ),
    Activity(
      time: '13:15',
      duration: '60 min',
      title: 'Standing Tapas Lunch',
      location: 'Casa Marina',
      price: 15,
      spotsLeft: 8,
      tags: [],
    ),
    Activity(
      time: '15:00',
      duration: 'Drop-in until 20:00',
      title: 'Kids LEGO Club',
      location: 'La Bloqueria',
      price: 10,
      spotsLeft: 7,
      tags: ['high', 'childcare'],
    ),
  ];
}
