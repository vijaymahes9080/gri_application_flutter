class NewsItem {
  final String id;
  final String title;
  final String date;
  final String category;
  final String summary;
  final String content;
  final String imageUrl;
  final bool isImportant;

  NewsItem({
    required this.id,
    required this.title,
    required this.date,
    required this.category,
    required this.summary,
    required this.content,
    required this.imageUrl,
    this.isImportant = false,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      category: json['category'] ?? '',
      summary: json['summary'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isImportant: json['is_important'] ?? false,
    );
  }
}
