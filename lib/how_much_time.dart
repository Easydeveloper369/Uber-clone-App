import 'package:flutter/material.dart';
import 'package:flutter_6/no_trips_available.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class HowMuchTime extends StatefulWidget {
  const HowMuchTime({super.key});

  @override
  State<HowMuchTime> createState() => _HowMuchTimeState();
}

class _HowMuchTimeState extends State<HowMuchTime> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar with circular back button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(1, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "How much time do you need?",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Minus, Slider, Plus
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Minus button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_sliderValue > 0) _sliderValue -= 1;
                      });
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                    ),
                  ),

                  // Slider
                  Expanded(
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 10,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey.shade300,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),

                  // Plus button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_sliderValue < 10) _sliderValue += 1;
                      });
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                         Get.to(
    () => const NoTripsAvailable(),
    transition: Transition.downToUp, // slide-up animation
    duration: const Duration(milliseconds: 100),
  );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Choose a trip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
}
