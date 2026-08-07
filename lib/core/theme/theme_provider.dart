import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themePrefKey = 'is_dark_mode';
  static const String _zoomPrefKey = 'text_scale_factor';

  bool _isDarkMode = false;
  double _textScaleFactor = 1.0;

  bool get isDarkMode => _isDarkMode;
  double get textScaleFactor => _textScaleFactor;

  ThemeProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(_themePrefKey) ?? false;
    _textScaleFactor = prefs.getDouble(_zoomPrefKey) ?? 1.0;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePrefKey, _isDarkMode);
    notifyListeners();
  }

  void zoomInText() async {
    if (_textScaleFactor < 1.4) {
      _textScaleFactor += 0.1;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_zoomPrefKey, _textScaleFactor);
      notifyListeners();
    }
  }

  void zoomOutText() async {
    if (_textScaleFactor > 0.8) {
      _textScaleFactor -= 0.1;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_zoomPrefKey, _textScaleFactor);
      notifyListeners();
    }
  }

  void resetTextZoom() async {
    _textScaleFactor = 1.0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_zoomPrefKey, _textScaleFactor);
    notifyListeners();
  }
}
