import 'package:flutter/material.dart';
import 'screens/movie_list_screen.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Movie App',
      debugShowCheckedModeBanner: false,
      // Cấu hình Theme sáng
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      // Cấu hình Theme tối
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MovieListScreen(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}
