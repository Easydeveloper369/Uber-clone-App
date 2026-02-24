import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SafetyCheckupPage extends StatefulWidget {
  const SafetyCheckupPage({super.key});

  @override
  State<SafetyCheckupPage> createState() => _SafetyCheckupPageState();
}

class _SafetyCheckupPageState extends State<SafetyCheckupPage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    // Show loading for 100ms
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: _loading
          ? const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: CircularProgressIndicator(color: Colors.black),
              ),
            )
          : _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ------------ HEADER -------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, size: 26, color: Colors.black),
                  ),
                ],
              ),
            ),

            // Scrollable body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ------------ ILLUSTRATION -------------
                    Center(
                      child: Image.asset(
                        'assets/images/safety_check_up.png',
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Safety check-up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "To help keep yourself safe on every trip, review your current safety settings.",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),

                    const SizedBox(height: 26),

                    // ------------ LIST ITEMS -------------

                    _tile(
                      title: "Safety help",
                      subtitle: "Learn how to get help during a trip",
                    ),

                    _tile(
                      title: "Audio recording",
                      subtitle:
                          "Record audio during your rides so you can report an issue to Uber if anything unexpected happens",
                    ),

                    _tile(
                      title: "Trusted contacts",
                      subtitle:
                          "Choose friends or family so you can quickly share your location, trip status and other details",
                    ),

                    _tile(
                      title: "RideCheck",
                      subtitle:
                          "Receiving automatic check-ins and help notifications if your ride goes off course or is disrupted",
                      checked: true,
                    ),

                    _tile(
                      title: "Driver safety standards",
                      subtitle:
                          "Learn about our safety standards for drivers",
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------ SINGLE TILE WIDGET ------------
  Widget _tile({
    required String title,
    required String subtitle,
    bool checked = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            checked ? Icons.check_circle : Icons.circle_outlined,
            size: 24,
            color: checked ? Colors.green : Colors.black45,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black45),
        ],
      ),
    );
  }
}
