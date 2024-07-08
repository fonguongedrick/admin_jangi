import 'package:admin_jangi/views/auth/signin/signin.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:admin_jangi/views/auth/signin/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
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
