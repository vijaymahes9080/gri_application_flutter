class Department {
  final String id;
  final String schoolId;
  final String name;
  final String code;
  final String hod;
  final List<String> programmes;
  final List<String> researchAreas;

  Department({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.code,
    required this.hod,
    required this.programmes,
    required this.researchAreas,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] ?? '',
      schoolId: json['school_id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      hod: json['hod'] ?? '',
      programmes: List<String>.from(json['programmes'] ?? []),
      researchAreas: List<String>.from(json['research_areas'] ?? []),
    );
  }
}
