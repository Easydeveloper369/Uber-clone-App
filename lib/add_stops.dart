import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddStops extends StatefulWidget {
  const AddStops({super.key});

  @override
  State<AddStops> createState() => _AddStopsState();
}

class _AddStopsState extends State<AddStops> {
  List<String> stops = ["Unnamed Road", "Kottayam"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 🌍 MAP BACKGROUND
            FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(9.3859, 76.5741), // Thiruvalla
                initialZoom: 11,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=v7sZAOQIvj8JRXvA3syq',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
        
            // 🧭 Back button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),
        
            // 🧭 Floating black indicator (right middle gray circle placeholder)
            Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height * 0.45,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        
            // ⬆️ Bottom Sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
        
                    // Title
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add stops",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
        
                    // Pick-up later + For me buttons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Pick-up later",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.arrow_drop_down, color: Colors.white)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "For me",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
        
                    // 🧭 Stops list
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          for (int i = 0; i < stops.length; i++)
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    i == 0 ? Colors.black : Colors.white,
                                radius: 10,
                                child: Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                      color: i == 0
                                          ? Colors.white
                                          : Colors.black87,
                                      fontSize: 12),
                                ),
                              ),
                              title: Text(stops[i],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.drag_handle,
                                      color: Colors.black54),
                                  if (i == stops.length - 1)
                                    IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.black),
                                      onPressed: () {
                                        setState(() {
                                          stops.removeAt(i);
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ListTile(
                            leading: const Icon(Icons.add, color: Colors.black54),
                            title: const Text("Add a stop",
                                style: TextStyle(color: Colors.black54)),
                            onTap: () {
                              setState(() {
                                stops.add("New stop");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
        
                    // ✅ Done button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Done",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
