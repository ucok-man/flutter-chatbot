import 'package:chatbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  /// Returns true if dark theme is enabled
  bool get isDarkTheme => _isDarkTheme;

  /// Updates the theme and persists it to local storage
  Future<void> setTheme(bool isDark) async {
    if (_isDarkTheme == isDark) return; // Prevent unnecessary updates

    _isDarkTheme = isDark;
    notifyListeners();
    await _saveThemePreference(isDark);
  }

  /// Loads the saved theme preference from local storage
  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool(Constants.themePrefKey) ?? false;
    notifyListeners();
  }

  /// Persists theme preference to SharedPreferences
  Future<void> _saveThemePreference(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.themePrefKey, isDark);
  }
}
