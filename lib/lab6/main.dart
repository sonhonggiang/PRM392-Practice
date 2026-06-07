import 'package:flutter/material.dart';
import 'screens/movie_browsing_screen.dart';

void main() {
  runApp(const Lab6App());
}

class Lab6App extends StatelessWidget {
  const Lab6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 6 - Responsive Movie Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        chipTheme: const ChipThemeData(
          selectedColor: Colors.blueAccent,
          labelStyle: TextStyle(fontSize: 13),
        ),
      ),
      home: const MovieBrowsingScreen(),
    );
  }
}
