import 'package:flutter/material.dart';
import '../repositories/auth_repository.dart';
import '../models/user_profile.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  bool _isAuthenticating = false;
  String? _errorMessage;

  bool get isAuthenticating => _isAuthenticating;
  bool get isAuthenticated => _authRepository.isAuthenticated;
  UserProfile? get currentUser => _authRepository.currentUser;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isAuthenticating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success = await _authRepository.login(email, password);
      _isAuthenticating = false;
      notifyListeners();
      return success;
    } catch (e) {
      _errorMessage = 'Invalid login credentials';
      _isAuthenticating = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String regNo, String password) async {
    _isAuthenticating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success = await _authRepository.register(name, email, regNo, password);
      _isAuthenticating = false;
      notifyListeners();
      return success;
    } catch (e) {
      _errorMessage = 'Registration failed';
      _isAuthenticating = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    notifyListeners();
  }
}
