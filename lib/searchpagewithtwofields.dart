import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class SearchPageWithTwoFields extends StatefulWidget {
  final String initialPickup;
  final String initialDrop;
  final String focusOn; // "pickup" or "drop"

  SearchPageWithTwoFields({
    this.initialPickup = "",
    this.initialDrop = "",
    required this.focusOn,
    Key? key,
  }) : super(key: key);

  @override
  _SearchPageWithTwoFieldsState createState() =>
      _SearchPageWithTwoFieldsState();
}

class _SearchPageWithTwoFieldsState extends State<SearchPageWithTwoFields> {
  final String apiKey = "v7sZAOQIvj8JRXvA3syq";

  late TextEditingController pickupController;
  late TextEditingController dropController;
  late FocusNode pickupFocus;
  late FocusNode dropFocus;

  List suggestions = [];
  bool typingPickup = true;

  double? pickupLat, pickupLng;
  double? dropLat, dropLng;

  @override
  void initState() {
    super.initState();
    pickupController = TextEditingController(text: widget.initialPickup);
    dropController = TextEditingController(text: widget.initialDrop);

    pickupFocus = FocusNode();
    dropFocus = FocusNode();

    typingPickup = widget.focusOn == "pickup";

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.focusOn == "pickup") {
        FocusScope.of(context).requestFocus(pickupFocus);
      } else {
        FocusScope.of(context).requestFocus(dropFocus);
      }
    });
  }

  @override
  void dispose() {
    pickupController.dispose();
    dropController.dispose();
    pickupFocus.dispose();
    dropFocus.dispose();
    super.dispose();
  }

  Future<void> fetchSuggestions(String text) async {
    if (text.isEmpty) {
      setState(() => suggestions = []);
      return;
    }

    final url =
        "https://api.maptiler.com/geocoding/${Uri.encodeComponent(text)}.json?key=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          suggestions = data["features"] ?? [];
        });
      } else {
        setState(() => suggestions = []);
      }
    } catch (e) {
      setState(() => suggestions = []);
    }
  }

  void returnResult() {
    Navigator.pop(context, {
      "pickupName": pickupController.text,
      "dropName": dropController.text,
      "pickupLat": pickupLat,
      "pickupLng": pickupLng,
      "dropLat": dropLat,
      "dropLng": dropLng,
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: null, // removed — embedded UI handles it

    body: Stack(
      children: [
        // ---------------- MAP IN BACKGROUND ----------------
        SizedBox.expand(
          child: FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(9.5916, 76.5222),
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
        ),

        // ---------------- FOREGROUND UI PANEL ----------------
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
            
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 10,
                          offset: const Offset(0, -3),
                        ),
                      ],
                    ),
            
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---------------- BACK + TITLE ----------------
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.arrow_back, size: 26),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Plan your trip",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
            
                        const SizedBox(height: 20),
            
                        // ---------------- PICKUP + DROP MERGED CARD ----------------
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.circle,
                                      size: 12, color: Colors.black),
                                  const SizedBox(width: 12),
            
                                  Expanded(
                                    child: TextField(
                                      controller: pickupController,
                                      focusNode: pickupFocus,
                                      onTap: () {
                                        setState(() => typingPickup = true);
                                      },
                                      onChanged: (v) {
                                        typingPickup = true;
                                        fetchSuggestions(v);
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Pickup location",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
            
                              const SizedBox(height: 14),
            
                              Row(
                                children: [
                                  const Icon(Icons.square,
                                      size: 12, color: Colors.grey),
                                  const SizedBox(width: 12),
            
                                  Expanded(
                                    child: TextField(
                                      controller: dropController,
                                      focusNode: dropFocus,
                                      onTap: () {
                                        setState(() => typingPickup = false);
                                      },
                                      onChanged: (v) {
                                        typingPickup = false;
                                        fetchSuggestions(v);
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Where to?",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
            
                                  IconButton(
                                    icon: const Icon(
                                        Icons.add_circle_outline_rounded),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
            
                        const SizedBox(height: 20),
            
                        // ---------------- "Saved Places" TITLE ----------------
                        const Text(
                          "Saved places",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
            
                        const SizedBox(height: 8),
            
                        // ---------------- LIST AREA (SAVED + SUGGESTIONS) ----------------
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              // STATIC SAVED PLACES (unchanged)
                              _savedPlace("Thiruvalla", "Kerala", "12 km"),
                              _savedPlace("Kottayam", "Kerala", "42 km"),
                              _savedPlace(
                                  "LuLu International Shopping Mall",
                                  "34/1000, Old NH 47, Edappally Junction, Kerala",
                                  "86 km"),
                              _savedPlace("Mulakuzha", "Kerala", "5.6 km"),
                              _savedPlace(
                                  "ERNAKULAM SOUTH RAILWAY STATION",
                                  "Ernakulam South, Kochi, Kerala",
                                  "81 km"),
            
                              const Divider(),
            
                              ListTile(
                                leading: const Icon(Icons.map),
                                title: const Text("Set location on map"),
                                onTap: () {},
                              ),
            
                              const Divider(),
            
                              // ---------- LIVE SUGGESTIONS (unchanged) ----------
                              ...suggestions.map((place) {
                                final name = place["place_name"] ?? "Unknown";
                                final coords = place["geometry"]
                                    ?["coordinates"];
                                final lat =
                                    coords != null ? coords[1] as double : null;
                                final lng =
                                    coords != null ? coords[0] as double : null;
            
                                return ListTile(
                                  leading:
                                      const Icon(Icons.location_on_outlined),
                                  title: Text(
                                    name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onTap: () {
                                    if (typingPickup) {
                                      pickupController.text = name;
                                      pickupLat = lat;
                                      pickupLng = lng;
                                      FocusScope.of(context)
                                          .requestFocus(dropFocus);
                                      typingPickup = false;
                                    } else {
                                      dropController.text = name;
                                      dropLat = lat;
                                      dropLng = lng;
                                    }
            
                                    setState(() => suggestions = []);
                                  },
                                );
                              }),
                            ],
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
      ],
    ),
  );
}


  // -------------------------------------------------------------
  // STATIC SAVED PLACE TILE (matches Uber screenshot)
  // -------------------------------------------------------------
  Widget _savedPlace(String title, String subtitle, String distance) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.access_time),
          Text(
            distance,
            style: const TextStyle(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      onTap: () {
        // No logic changes — static UI only
      },
    );
  }
}
