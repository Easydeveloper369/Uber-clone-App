import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'co2_saved_page.dart';

class LeavesSplash extends StatefulWidget {
  const LeavesSplash({super.key});

  @override
  State<LeavesSplash> createState() => _LeavesSplashState();
}

class _LeavesSplashState extends State<LeavesSplash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Co2SavedPage(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Lottie.asset(
          'assets/json/leaves.json',
          fit: BoxFit.cover,   // makes it full screen
        ),
      ),
    );
  }
}
