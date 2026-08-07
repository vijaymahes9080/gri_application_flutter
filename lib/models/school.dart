class School {
  final String id;
  final String name;
  final String code;
  final String dean;
  final String description;
  final int departmentsCount;

  School({
    required this.id,
    required this.name,
    required this.code,
    required this.dean,
    required this.description,
    required this.departmentsCount,
  });

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      dean: json['dean'] ?? '',
      description: json['description'] ?? '',
      departmentsCount: json['departments_count'] ?? 0,
    );
  }
}
