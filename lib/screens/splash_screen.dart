import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void homeScreen() {
     Timer(const Duration(seconds: 2),(){ Navigator.pushReplacementNamed(context, '/home');});
  }

  @override
  void initState() {
   super.initState();
   homeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text("Flutter by example"),
      ),
    );
  }
}
