class EventItem {
  final String id;
  final String title;
  final String date;
  final String venue;
  final String time;
  final String organizer;
  final String description;

  EventItem({
    required this.id,
    required this.title,
    required this.date,
    required this.venue,
    required this.time,
    required this.organizer,
    required this.description,
  });

  factory EventItem.fromJson(Map<String, dynamic> json) {
    return EventItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      venue: json['venue'] ?? '',
      time: json['time'] ?? '',
      organizer: json['organizer'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
