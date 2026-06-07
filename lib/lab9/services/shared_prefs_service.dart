import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _darkModeKey = 'isDarkMode';

  // Save Dark Mode state
  Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, isDark);
  }

  // Retrieve Dark Mode state (default to false if not set)
  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }
}
