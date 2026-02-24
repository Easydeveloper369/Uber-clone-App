import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddTripsPage extends StatefulWidget {
  const AddTripsPage({Key? key}) : super(key: key);

  @override
  State<AddTripsPage> createState() => _AddTripsPageState();
}

class _AddTripsPageState extends State<AddTripsPage> {
  // Example controllers for the top text fields
  final TextEditingController _pickupController =
      TextEditingController(text: "Unnamed Road");
  final TextEditingController _stopController =
      TextEditingController(text: "LuLu International Shopping Mall");
  final TextEditingController _addStopController = TextEditingController();

  // Map center roughly matches the screenshot area (Kerala coastline)
  final LatLng _initialCenter = LatLng(9.9800, 76.3000);
  final double _initialZoom = 8.5;

  // Example polyline coordinates forming a route similar to screenshot.
  final List<LatLng> _route = [
    LatLng(11.2588, 75.7804), // Kochi
    LatLng(10.5127, 76.2144), // Alappuzha-ish
    LatLng(9.4820, 76.6700),  // inland near south
  ];

  @override
  void dispose() {
    _pickupController.dispose();
    _stopController.dispose();
    _addStopController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen sizes for layout
    final Size screen = MediaQuery.of(context).size;

    return Scaffold(
      // AppBar with back icon like screenshot
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const Text('Add trips', style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Map in background
            // FlutterMap(
            //   options: MapOptions(
            //     center: _initialCenter,
            //     zoom: _initialZoom,
            //     interactiveFlags: InteractiveFlag.all,
            //   ),
            //   nonRotatedChildren: const [],
            //   children: [
            //     TileLayer(
            //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //       userAgentPackageName: 'com.example.app',
            //     ),
            //     PolylineLayer(
            //       polylines: [
            //         Polyline(
            //           points: _route,
            //           strokeWidth: 4.0,
            //           // color not specified explicitly by instruction: using default (will be applied)
            //           color: Colors.black,
            //         ),
            //       ],
            //     ),
            //     // MarkerLayer(
            //     //   markers: [
            //     //     Marker(
            //     //       width: 40,
            //     //       height: 40,
            //     //       point: _route.first,
            //     //       builder: (ctx) => const Icon(
            //     //         Icons.location_on,
            //     //         size: 36,
            //     //         color: Colors.black,
            //     //       ),
            //     //     ),
            //     //     Marker(
            //     //       width: 32,
            //     //       height: 32,
            //     //       point: _route.last,
            //     //       builder: (ctx) => const Icon(
            //     //         Icons.fiber_manual_record,
            //     //         size: 18,
            //     //         color: Colors.blue,
            //     //       ),
            //     //     ),
            //     //   ],
            //     // ),
            //   ],
            // ),
        
            // Top card with stops (semi-transparent background)
            Positioned(
              top: 8,
              left: 12,
              right: 12,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Row with back/drag handle style and fields
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                // Pickup
                                _buildStopTile(
                                  leadingIndex: null,
                                  child: TextField(
                                    controller: _pickupController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Unnamed Road',
                                    ),
                                  ),
                                ),
        
                                const Divider(height: 1),
        
                                // Stop 1
                                _buildStopTile(
                                  leadingIndex: 1,
                                  child: TextField(
                                    controller: _stopController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'LuLu International Shopping Mall',
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _stopController.clear();
                                      });
                                    },
                                  ),
                                ),
        
                                const Divider(height: 1),
        
                                // Add a stop
                                _buildStopTile(
                                  leadingIndex: null,
                                  child: TextField(
                                    controller: _addStopController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Add a stop',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Circular floating control on right (mimics screenshot)
                          const SizedBox(width: 8),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.menu, color: Colors.white),
                          ),
                        ],
                      ),
        
                      const SizedBox(height: 8),
        
                      // Start a group trip button (outline style like screenshot)
                      InkWell(
                        onTap: () {
                          // implement action
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.group_add, color: Colors.black87),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Start a group trip',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        
            // Bottom label showing "Unnamed Road" like screenshot
            Positioned(
              bottom: 18,
              left: 18,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 6,
                    )
                  ],
                ),
                child: const Text('Unnamed Road',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
        
            // Circular floating action (bottom-right) similar to screenshot
            Positioned(
              bottom: 18,
              right: 18,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.navigation, color: Colors.white),
                  onPressed: () {
                    // implement action
                  },
                ),
              ),
            ),
        
            // A small preview of the uploaded screenshot (for reference only)
            // NOTE: If you want to show the uploaded image inside the UI during development,
            // uncomment the code below. The file path used for reference is provided by you:
            // /mnt/data/ee48b34f-b950-41ed-922c-f28080866e09.png
            //
            // Positioned(
            //   top: screen.height * 0.35,
            //   right: 12,
            //   child: SizedBox(
            //     width: 120,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(8),
            //       child: Image.file(
            //         File('/mnt/data/ee48b34f-b950-41ed-922c-f28080866e09.png'),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Helper for stop row appearance
  Widget _buildStopTile({
    int? leadingIndex,
    required Widget child,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          if (leadingIndex != null)
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                leadingIndex.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          else
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              child: const Icon(Icons.drag_indicator, size: 18),
            ),
          const SizedBox(width: 8),
          Expanded(child: child),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
