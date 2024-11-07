// lib/data/datasources/local/auth_local_datasource.dart

import 'dart:convert';
import 'package:shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const userKey = 'CACHED_USER';

  AuthLocalDataSource({required this.sharedPreferences});

  Future<Map<String, dynamic>> getCachedUser() async {
    final jsonString = sharedPreferences.getString(userKey);
    if (jsonString != null) {
      return json.decode(jsonString);
    } else {
      throw Exception('No cached user found');
    }
  }

  Future<void> cacheUser(Map<String, dynamic> userData) async {
    await sharedPreferences.setString(userKey, json.encode(userData));
  }

  Future<void> clearUser() async {
    await sharedPreferences.remove(userKey);
  }
}