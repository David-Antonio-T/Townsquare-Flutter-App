class Activity {
  final String time;
  final String duration;
  final String title;
  final String location;
  final double price;
  final int spotsLeft;
  final List<String> tags;
  final String instructor;
  final bool isSoldOut;

  Activity({
    required this.time,
    required this.duration,
    required this.title,
    required this.location,
    required this.price,
    required this.spotsLeft,
    required this.tags,
    this.instructor = '',
    this.isSoldOut = false,
  });
}
