import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NoTripsAvailable extends StatefulWidget {
  const NoTripsAvailable({super.key});

  @override
  State<NoTripsAvailable> createState() => _NoTripsAvailableState();
}

class _NoTripsAvailableState extends State<NoTripsAvailable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌍 MAP BACKGROUND
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(9.3859, 76.5741), // Thiruvalla
              initialZoom: 12,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=v7sZAOQIvj8JRXvA3syq',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),

          // 🧭 Back button + Search bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.topLeft,
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
                  const SizedBox(height: 20),

                  // Search bar
                 
                ],
              ),
            ),
          ),

          // ⬆️ Wider Bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity, // ✅ makes it full width
              height: 230, // slightly taller for better balance
              margin: const EdgeInsets.symmetric(horizontal: 4), // small side margin
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Small top drag handle
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),

                  // Center icon
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 3),
                    ),
                    child:  Center(
                      child: Icon(
                        Icons.error_sharp,
                        color: Colors.black,
                        size: 59,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Message
                  const Text(
                    "No trips available",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
