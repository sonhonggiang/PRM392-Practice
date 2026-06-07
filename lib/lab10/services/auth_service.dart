import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = 'https://dummyjson.com/auth/login';
  static const String _tokenKey = 'jwt_token';

  // LOGIN: Authenticate with DummyJSON and save token
  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'expiresInMins': 30, // Optional
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['accessToken']; // Updated for newer DummyJSON API

        // Save token to local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_tokenKey, token);
        return true;
      }
      return false;
    } catch (e) {
      print('Auth Error: $e');
      return false;
    }
  }

  // GET TOKEN: Retrieve stored session
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // LOGOUT: Clear session
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
