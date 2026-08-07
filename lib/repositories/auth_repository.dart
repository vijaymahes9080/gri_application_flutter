import '../models/user_profile.dart';

class AuthRepository {
  UserProfile? _currentUser;

  UserProfile? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  Future<bool> login(String email, String password) async {
    // Simulated authentication delay
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = UserProfile.sampleStudent();
    return true;
  }

  Future<bool> register(String name, String email, String registerNumber, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = UserProfile(
      id: 'usr_new',
      name: name,
      email: email,
      role: 'Student',
      department: 'Computer Science',
      registerNumber: registerNumber,
    );
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;
  }
}
