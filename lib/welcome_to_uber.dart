import 'package:flutter/material.dart';
import 'home_screen.dart'; // 👈 import your HomeScreen file

class WelcomeToUber extends StatefulWidget {
  const WelcomeToUber({super.key});

  @override
  State<WelcomeToUber> createState() => _WelcomeToUberState();
}

class _WelcomeToUberState extends State<WelcomeToUber>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    // Wait for 3 seconds, then fade out and go to Home
    Future.delayed(const Duration(seconds: 3), () async {
      await _controller.reverse(); // fade out
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              const Center(
                child: Text(
                  "Uber",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Customising your experience...",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 92, 87, 87),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 90),
              const Icon(Icons.arrow_forward, size: 90),
            ],
          ),
        ),
      ),
    );
  }
}
