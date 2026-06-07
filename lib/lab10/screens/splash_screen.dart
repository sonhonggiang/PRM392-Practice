import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  // Logic for Auto-Login
  Future<void> _checkAuth() async {
    // Small delay for branding/smoothness
    await Future.delayed(const Duration(seconds: 2));

    final token = await _authService.getToken();

    if (!mounted) return;

    if (token != null) {
      // Token exists -> Go to Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      // No token -> Go to Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_person, size: 100, color: Colors.white),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 20),
            Text(
              'PRM392 - Security App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
