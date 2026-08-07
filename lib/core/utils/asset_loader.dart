import 'dart:convert';
import 'package:flutter/services.dart';

class AssetLoader {
  static Future<Map<String, dynamic>> loadJsonObject(String assetPath) async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      return json.decode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  static Future<List<dynamic>> loadJsonList(String assetPath) async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      return json.decode(jsonString) as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}
