import 'package:admin_jangi/views/secretary/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin_jangi/views/auth/signin/signin.dart';
import 'package:admin_jangi/views/dashboard/widgets/dashboard.dart';
import 'package:admin_jangi/views/secretary/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isLoggedIn = prefs.getBool('isLoggedIn');
    final String? userType = prefs.getString('userType');

    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn == true) {
        if (userType == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        } else if (userType == 'secretary') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SecretaryDashboard()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Jangi App-12 1.png'),
      ),
    );
  }
}
