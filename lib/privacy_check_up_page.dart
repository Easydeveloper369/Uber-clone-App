import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyCheckupPage extends StatefulWidget {
  const PrivacyCheckupPage({super.key});

  @override
  State<PrivacyCheckupPage> createState() => _PrivacyCheckupPageState();
}

class _PrivacyCheckupPageState extends State<PrivacyCheckupPage>
    with SingleTickerProviderStateMixin {
  bool _loading = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Top loading bar animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // After ~1.8 seconds show the actual page
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        setState(() {
          _loading = false;
          _controller.stop();
        });
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
    return Scaffold(
      backgroundColor: Colors.white,

      // Top loading bar
      body: _loading ? _buildLoadingBar() : _buildContent(),
    );
  }

  // -----------------------------------------------------------
  // TOP BLUE ANIMATED LOADING BAR (Uber style)
  // -----------------------------------------------------------
  Widget _buildLoadingBar() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double width = MediaQuery.of(context).size.width;
              double position = _controller.value * (width - 80);

              return Container(
                height: 4,
                child: Stack(
                  children: [
                    Positioned(
                      left: position,
                      child: Container(
                        width: 80,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // -----------------------------------------------------------
  // PAGE CONTENT AFTER LOADING
  // -----------------------------------------------------------
  Widget _buildContent() {
    return SafeArea(
      child: Column(
        children: [
          // HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, size: 26),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  Center(
                    child: Image.asset(
                      "assets/images/privacy.png",
                      height: 190,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Privacy checkup",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Take a quick interactive tour of key privacy settings and personalize your Uber app experience.",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: const [
                      Icon(Icons.timer_outlined, size: 20),
                      SizedBox(width: 10),
                      Text("Under 2 minutes to complete",
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    "What we'll cover:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  _bullet(Icons.location_on_outlined, "Location sharing"),
                  _bullet(Icons.settings, "Explore your data"),
                  _bullet(Icons.apps, "Connected apps"),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // BOTTOM BUTTON
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // BULLET ROW
  Widget _bullet(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
