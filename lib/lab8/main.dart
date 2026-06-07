import 'package:flutter/material.dart';
import 'screens/api_data_screen.dart';

void main() {
  runApp(const Lab8App());
}

class Lab8App extends StatelessWidget {
  const Lab8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 8 - API Data App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ApiDataScreen(),
    );
  }
}
