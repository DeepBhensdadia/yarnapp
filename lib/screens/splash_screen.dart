import 'dart:async';
import 'package:flutter/material.dart';
import '../const/themes.dart';
import 'auth-section/login-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.appBarColor,
      body: Center(
        child: Container(
            height: 125,width: 125,
            child: Image(image: AssetImage('images/RR_Textiles-r.png')))
      ),
    );
  }
}
