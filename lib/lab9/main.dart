import 'package:flutter/material.dart';
import 'screens/notes_screen.dart';
import 'services/shared_prefs_service.dart';

void main() async {
  // Ensure Flutter is initialized before calling async services
  WidgetsFlutterBinding.ensureInitialized();

  final prefsService = SharedPrefsService();
  final isDarkMode = await prefsService.getDarkMode();

  runApp(Lab9App(initialDarkMode: isDarkMode));
}

class Lab9App extends StatefulWidget {
  final bool initialDarkMode;
  const Lab9App({super.key, required this.initialDarkMode});

  @override
  State<Lab9App> createState() => _Lab9AppState();
}

class _Lab9AppState extends State<Lab9App> {
  late bool _isDarkMode;
  final SharedPrefsService _prefsService = SharedPrefsService();

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialDarkMode;
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    _prefsService.setDarkMode(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 9 - Storage App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: NotesScreen(
        initialDarkMode: _isDarkMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}
