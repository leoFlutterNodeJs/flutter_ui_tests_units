class AppNotifications {
  final int id;
  final String title, description;
  final Object content;
  final DateTime createdAt;

  AppNotifications({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.createdAt,
  });
}
