import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themePrefKey = 'is_dark_mode';
  bool _isDarkMode = false;
  double _textScaleFactor = 1.0;

  bool get isDarkMode => _isDarkMode;
  double get textScaleFactor => _textScaleFactor;

  ThemeProvider() {
    _loadThemePreference();
  }

  void _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(_themePrefKey) ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePrefKey, _isDarkMode);
    notifyListeners();
  }

  void zoomInText() {
    if (_textScaleFactor < 1.4) {
      _textScaleFactor += 0.1;
      notifyListeners();
    }
  }

  void zoomOutText() {
    if (_textScaleFactor > 0.8) {
      _textScaleFactor -= 0.1;
      notifyListeners();
    }
  }

  void resetTextZoom() {
    _textScaleFactor = 1.0;
    notifyListeners();
  }
}
