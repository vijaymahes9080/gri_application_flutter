class UserProfile {
  final String id;
  final String name;
  final String email;
  final String role; // Student, Faculty, Alumni
  final String department;
  final String registerNumber;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.department,
    required this.registerNumber,
  });

  factory UserProfile.sampleStudent() {
    return UserProfile(
      id: 'usr_001',
      name: 'R. Vijay Kumar',
      email: 'vijay@ruraluniv.ac.in',
      role: 'Student',
      department: 'Computer Science & Applications',
      registerNumber: '21304001',
    );
  }
}
