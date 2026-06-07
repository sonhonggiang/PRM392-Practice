import 'package:flutter/material.dart';
import 'screens/signup_form_screen.dart';

void main() {
  runApp(const Lab7App());
}

class Lab7App extends StatelessWidget {
  const Lab7App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 7 - Signup Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF5F5F5),
        ),
      ),
      home: const SignupFormScreen(),
    );
  }
}
