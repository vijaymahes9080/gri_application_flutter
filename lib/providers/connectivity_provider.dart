import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier {
  bool _isOnline = true;
  bool _isSyncing = false;
  DateTime? _lastSyncedAt = DateTime.now();

  bool get isOnline => _isOnline;
  bool get isSyncing => _isSyncing;
  DateTime? get lastSyncedAt => _lastSyncedAt;

  void setOnlineStatus(bool status) {
    if (_isOnline != status) {
      _isOnline = status;
      notifyListeners();
    }
  }

  Future<void> syncWithServer() async {
    _isSyncing = true;
    notifyListeners();
    // Simulate real-time API sync check
    await Future.delayed(const Duration(seconds: 1));
    _isSyncing = false;
    _lastSyncedAt = DateTime.now();
    notifyListeners();
  }
}
