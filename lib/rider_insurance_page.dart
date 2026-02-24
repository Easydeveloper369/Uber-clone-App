import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderInsurancePage extends StatefulWidget {
  const RiderInsurancePage({super.key});

  @override
  State<RiderInsurancePage> createState() => _RiderInsurancePageState();
}

class _RiderInsurancePageState extends State<RiderInsurancePage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    // Simulate loading time before showing content
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() => _loading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
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
          // ----------- SCROLLABLE CONTENT -----------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- HEADER ----------
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.close, size: 26),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Insure your rides",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 22),

                  // ---------- IMAGE ----------
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/insure_your_rides.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Reliance General Insurance can help you, and "
                    "everyone riding with you, with medical costs and more.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),

                  const SizedBox(height: 22),

                  _bullet(Icons.currency_rupee,
                      "Pay only ₹3 more per ride (includes GST)."),

                  _bullet(Icons.local_hospital_outlined,
                      "Get up to ₹10,00,000 if an accident results in serious or fatal injury."),

                  _bullet(Icons.flight_takeoff_outlined,
                      "Receive up to ₹7,500 to cover missed flight."),

                  _bullet(Icons.security,
                      "Sign up to get coverage for all future eligible rides, including ongoing trip."),

                  _bullet(Icons.cancel_outlined,
                      "Cancel any time in the Account menu."),

                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Learn about more benefits",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // ----------- FIXED BOTTOM SECTION -----------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "By selecting Sign up, I confirm that I have read and "
                  "agree to the exclusions, terms & conditions.",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),

                const SizedBox(height: 12),

                // ---------- SIGN UP BUTTON ----------
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  // Bullet point widget
  Widget _bullet(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.35),
            ),
          )
        ],
      ),
    );
  }
}
