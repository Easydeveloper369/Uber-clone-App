import 'package:flutter/material.dart';
import 'package:flutter_6/plan_your_ride.dart';
import 'package:flutter_6/routeresultspage.dart';
import 'package:flutter_6/searchdestinationpage.dart';
import 'package:flutter_6/searchpagewithtwofields.dart';

import 'package:flutter_6/sign_in1.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PlanYourIntercityTrip extends StatefulWidget {
  const PlanYourIntercityTrip({super.key});

  @override
  State<PlanYourIntercityTrip> createState() => _PlanYourIntercityTripState();
}

class _PlanYourIntercityTripState extends State<PlanYourIntercityTrip> {
  List<Map<String, String>> suggestions = [];
  bool showSuggestions = false;
  bool isEditingPickup = false;
    // ADD THESE
  double? pickupLat;
  double? pickupLng;
  double? dropLat;
  double? dropLng;

  final TextEditingController pickupController = TextEditingController(
    text: "Unnamed Road",
  );
  final TextEditingController dropController = TextEditingController(
    text: "Kottayam",
  );
  bool isOneWaySelected = true;
  void _loadSuggestions(String query) {
    if (query.isEmpty) {
      setState(() => showSuggestions = false);
      return;
    }

    // Mock suggestions (replace later with Google API)
    setState(() {
      suggestions = [
        {"name": "$query Town", "address": "Kerala"},
        {"name": "$query Junction", "address": "Kerala"},
        {"name": "$query Road", "address": "Kerala"},
      ];
      showSuggestions = true;
    });
  }

  void _showRoundTripUnavailableSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // make the corners visible
      builder: (context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Title
                const Text(
                  "Round trip not available",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                // Message
                const Text(
                  "There's currently no round-trip service available from your pick-up location.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 30),

                // OK Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK", style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// 🗺 Background Map
            SizedBox.expand(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(9.5916, 76.5222),
                  initialZoom: 10,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=v7sZAOQIvj8JRXvA3syq',
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              ),
            ),
        
            /// 📍 Attribution (bottom left)
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 3,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: const Text(
                  "© MapTiler © OpenStreetMap contributors",
                  style: TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ),
            ),
        
            /// 🔲 Foreground White Card
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.92,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: CustomScrollView(
                      slivers: [
                        // Combined Sticky Header: gray handle + title + white background
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _StickyHeaderDelegate(
                            minHeight: 70, // Adjust to include bar + text
                            maxHeight: 70,
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  // Gray handle
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Title
                                  const Text(
                                    "Plan your Intercity trip",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
        
                        // Scrollable content (exactly the same as your existing SliverList)
                        SliverList(
                          delegate: SliverChildListDelegate([
                            const SizedBox(height: 20),
        
                            /// Trip Type Selector
                            /// Trip Type Selector with moving border
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  double width = constraints.maxWidth;
        
                                  return Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Stack(
                                      children: [
                                        // Moving border highlight
                                        AnimatedPositioned(
                                          duration: const Duration(
                                            milliseconds: 150,
                                          ),
                                          curve: Curves.easeOut,
                                          left: 0, // Always One-way
                                          top: 0,
                                          bottom: 0,
                                          width: width / 2,
                                          child: Container(
                                            margin: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                8,
                                              ),
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
        
                                        Row(
                                          children: [
                                            // One-way
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  // Already selected, no action needed
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.all(4),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    "One way\nStarting at ₹1,145",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
        
                                            // Round trip (bounce effect)
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  // Animate highlight temporarily
                                                  setState(() {});
                                                  await Future.delayed(
                                                    const Duration(
                                                      milliseconds: 50,
                                                    ),
                                                  );
        
                                                  // Show bottom sheet
                                                  _showRoundTripUnavailableSheet();
        
                                                  // Optionally: add tiny bounce animation back
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.all(4),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    "Round trip\nNot available",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
        
           RouteInputCard(
          pickupController: pickupController,
          dropController: dropController,
        
          onPickupChanged: (value) async {
            if (value == "focus_pickup") {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchPageWithTwoFields(
              initialPickup: pickupController.text,
              initialDrop: dropController.text,
              focusOn: "pickup",
            ),
          ),
        );
        
        if (result != null) {
          pickupController.text = result["pickupName"];
          dropController.text = result["dropName"];
        }
            }
          },
        
          onDropChanged: (value) async {
            if (value == "focus_drop") {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchPageWithTwoFields(
              initialPickup: pickupController.text,
              initialDrop: dropController.text,
              focusOn: "drop",
            ),
          ),
        );
        
        if (result != null) {
          pickupController.text = result["pickupName"];
          dropController.text = result["dropName"];
        }
            }
          },
        )
        ,
        
        
                            /// Leave now section
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.access_time, size: 20),
                                    SizedBox(width: 10),
                                    Text(
                                      "Leave now",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
        
                            SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: const Text(
                                "Reserve is unavailable for this pick-up location",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 194, 124, 21),
                                  fontSize: 13,
                                ),
                              ),
                            ),
        
                            const SizedBox(height: 20),
        
                            /// Offer Banner
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.discount, color: Colors.green),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Get 5% OFF up to ₹500 on your next trip!",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
        
                            SizedBox(height: 10),
        
                            /// Ride with Confidence Section
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: const Text(
                                "Ride with confidence",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  _ConfidenceItem(
                                    icon: Icons.star_border,
                                    label: "Top-rated drivers",
                                  ),
                                  _ConfidenceItem(
                                    icon: Icons.support_agent,
                                    label: "24/7 live support",
                                  ),
                                  _ConfidenceItem(
                                    icon: Icons.alt_route,
                                    label: "3k+ routes served",
                                  ),
                                  _ConfidenceItem(
                                    icon: Icons.people_alt_outlined,
                                    label: "Trusted by 1Cr+ riders",
                                  ),
                                ],
                              ),
                            ),
        
                            // Popular Destinations Section
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Popular destinations",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
        
                            // Horizontal scroll view
                            SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/trivandrum.png",
                                    name: "Trivandrum",
                                    price: "Starting at Rs 2,099",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/munnar.png",
                                    name: "Munnar",
                                    price: "Starting at Rs 1,899",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/alleppey.png",
                                    name: "Alleppey",
                                    price: "Starting at Rs 1,899",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/thekkady.png",
                                    name: "Thekkady",
                                    price: "Starting at Rs 2,499",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/chittorgarh.png",
                                    name: "Chittorgarh",
                                    price: "Starting at Rs 2,499",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/varkala.png",
                                    name: "Varkala",
                                    price: "Starting at Rs 2,499",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/kozhikode.png",
                                    name: "Kozhikode",
                                    price: "Starting at Rs 3,299",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                  _buildDestinationCard(
                                    context: context,
                                    imagePath: "assets/images/thrissur.png",
                                    name: "Thrissur",
                                    price: "Starting at Rs 3,299",
                                    dropController:
                                        dropController, // 👈 PASS IT HERE
                                  ),
                                ],
                              ),
                            ),
        
                            const SizedBox(height: 20),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        
            /// Back Button (top-left, full circle)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 12,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(
                  30,
                ), // makes tap ripple circular
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ),
        
            /// FAQ Button (top-right, pill-shaped with text + icon)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              right: 16,
              child: InkWell(
                onTap: () {
                  // Open FAQ
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "FAQ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.help_outline, size: 18, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15), // Shadow color
              offset: const Offset(0, -3), // Shadow position (upwards)
              blurRadius: 8, // How soft the shadow is
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteResultPage(
                      pickup: pickupController.text,
                      drop: dropController.text,
                    ),
                  ),
                );
              },
              child: const Text(
                "Search rides",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _StickyHeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return oldDelegate.child != child ||
        oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight;
  }
}

Widget _buildDestinationCard({
  required BuildContext context,
  required String imagePath,
  required String name,
  required String price,
  required TextEditingController dropController, // 👈 ADD THIS
}) {
  return InkWell(
    onTap: () async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SearchDestinationPage()),
      );

      if (result != null) {
        dropController.text = result; // 🔥 Update destination
      }
    },

    borderRadius: BorderRadius.circular(12),
    child: Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16),
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            height: 100,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Name + arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_forward, size: 12),
            ],
          ),

          // Price
          Text(price, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    ),
  );
}

class _ConfidenceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ConfidenceItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Icon(icon, color: Colors.black87, size: 28),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class RouteInputCard extends StatelessWidget {
  final TextEditingController pickupController;
  final TextEditingController dropController;
  final Function(String) onPickupChanged; // <--- NEW
  final Function(String) onDropChanged; // <--- NEW

  const RouteInputCard({
    super.key,
    required this.pickupController,
    required this.dropController,
    required this.onPickupChanged, // NEW
    required this.onDropChanged, // NEW
  });

  @override
  Widget build(BuildContext context) {
    const Color originOuterColor = Colors.black;
    const Color originInnerColor = Colors.white;
    const Color destinationOuterColor = Colors.black;
    const Color destinationInnerColor = Colors.white;

    const double iconSize = 18;
    const double connectorHeight = 46;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.grey[100],
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column: icons + connector
              Column(
                mainAxisSize: MainAxisSize.min, // shrink-wrap
                children: [
                  // Pickup icon
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: Center(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: originOuterColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: originInnerColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Connector
                  Container(
                    width: 2,
                    height: connectorHeight,
                    color: Colors.black,
                  ),

                  // Drop icon
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: Center(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: destinationOuterColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: destinationInnerColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 12),

              // Right column: TextFields + divider
              Expanded(
                // <-- Give finite width to TextFields
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink-wrap vertically
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            30, // increase height so text appears aligned with icon
                        child: GestureDetector(
                          onTap: () {
                            // open search page for pickup
onPickupChanged("focus_pickup");

                          },
                          child: AbsorbPointer(
                            child: TextField(
                              controller: pickupController,
                              decoration: const InputDecoration(
                                hintText: "Unnamed Road",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      Container(height: 1, color: Colors.grey),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            // open search page for drop
onDropChanged("focus_drop");

                          },
                          child: AbsorbPointer(
                            child: TextField(
                              controller: dropController,
                              decoration: const InputDecoration(
                                hintText: "Kottayam",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
