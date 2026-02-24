import 'package:flutter/material.dart';
import 'package:flutter_6/choose_a_time.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math'; // <-- needed for asin, cos used in _calculateDistance

class PlanYourRide extends StatefulWidget {
  const PlanYourRide({super.key});

  @override
  State<PlanYourRide> createState() => _PlanYourRideState();
}

class _PlanYourRideState extends State<PlanYourRide> {
  final TextEditingController _controller = TextEditingController();
  String selectedPickup = "Now"; // Default Uber behavior

  bool showMap = false;

  // ------------------ ADDED (fixes errors) ------------------
  // controllers referenced by suggestion-handling logic
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropController = TextEditingController();

  // suggestions list used by _buildSuggestionList()
  List<Map<String, dynamic>> suggestions = [];

  // track which field is active ("pickup" or "drop")
  String activeField = "";

  // ----------------------------------------------------------

  @override
  void dispose() {
    _controller.dispose();
    pickupController.dispose();
    dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ❌ REMOVE APP BAR — we are placing it inside the white panel
      appBar: null,

      body: SafeArea(
        child: Stack(
          children: [
            // ------------------ MAP IN BACKGROUND ------------------
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
            // ------------------ FOREGROUND UI ------------------
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 60), // space above panel now
                  // ❌ REMOVE FILTER CHIPS HERE — MOVED INTO WHITE PANEL
        
                  // ---------------- WHITE PANEL ----------------
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
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
        
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                            // ---- Light Grey Bar ----
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 8), // moved UP
          child: Center(
            child: Container(
        width: 40,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(3),
        ),
            ),
          ),
        ),
        
                          // --------------------------------------------------
                          // ✅ BACK BUTTON + TITLE NOW INSIDE WHITE PANEL
                          // --------------------------------------------------
                        Stack(
        alignment: Alignment.center,
        children: [
          // BACK BUTTON (left aligned)
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, size: 28),
            ),
          ),
        
          // CENTER TITLE
          const Text(
            "Plan your ride",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
            ),
        
                          const SizedBox(height: 15),
        
                          // --------------------------------------------------
                          // ✅ FILTER CHIPS MOVED INTO WHITE PANEL
                          // --------------------------------------------------
                          Row(
                            children: [
                              _optionChip(
                                selectedPickup == "Now"
                                    ? "Pick-up now"
                                    : "Pick-up later",
                                Icons.watch_later_outlined,
                                onTap: () => _showPickupBottomSheet(),
                              ),
        
                              const SizedBox(width: 10),
                              _optionChip("For me", Icons.person_2_outlined),
                            ],
                          ),
        
                          const SizedBox(height: 20),
        
                          // ---------------- PICKUP & DROP BOX ----------------
                          // ---------------- PICKUP & DROP BOX (UPDATED) ----------------
                          // ---------------- PICKUP & DROP BOX (UPDATED WITH LINE + MOVED + BUTTON) ----------------
                          // ---------------- PICKUP & DROP BOX (FINAL FIX) ----------------
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    6,
                                    16,
                                    10,
                                  ), // ↓ reduced height
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // LEFT ICON + LINE
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.all(1.5),
                                            child: Container(
                                              width: 14,
                                              height: 14,
                                              decoration: const BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 3,
                                                  height: 3,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                            
                                          Container(
                                            width: 2,
                                            height: 41, // ↓ reduced line height
                                            color: Colors.black,
                                          ),
                            
                                          Padding(
                                            padding: const EdgeInsets.all(1.5),
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  2,
                                                ),
                                                color: Colors.black,
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                            
                                      const SizedBox(width: 12),
                            
                                      // RIGHT TEXT FIELDS
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // PICKUP
                                            TextField(
                                              controller: pickupController,
                                              decoration: const InputDecoration(
                                                hintText: "Unnamed Road",
                                                hintStyle: TextStyle(fontSize: 15),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 4,
                                                    ), // ↓ reduced
                                              ),
                                              onTap: () => setState(
                                                () => activeField = "pickup",
                                              ),
                                              onChanged: (value) {
                                                activeField = "pickup";
                                                searchFromOSM(value);
                                              },
                                              onSubmitted: (_) =>
                                                  _checkAndNavigate(),
                                            ),
                            
                                            Container(
                                              margin: const EdgeInsets.symmetric(
                                                vertical: 5,
                                              ),
                                              height: 1,
                                              color: Colors.black12, // light grey
                                            ),
                                            // ↓ reduced spacing
                            
                                            // DROP
                                            TextField(
                                              controller: dropController,
                                              decoration: const InputDecoration(
                                                hintText: "Where to?",
                                                hintStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                ),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 4,
                                                    ), // ↓ reduced
                                              ),
                                              onTap: () => setState(
                                                () => activeField = "drop",
                                              ),
                                              onChanged: (value) {
                                                activeField = "drop";
                                                searchFromOSM(value);
                                              },
                                              onSubmitted: (_) =>
                                                  _checkAndNavigate(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            
                                // PLUS BUTTON (unchanged)
                                Positioned(
                                  right: -38,
                                  top: 42, // ↓ slightly adjusted for new height
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.add, size: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
        
                          const SizedBox(height: 20),
        
                          // ---------------- LOCATIONS LIST ----------------
                          Expanded(
                            child: suggestions.isNotEmpty
                                ? _buildSuggestionList()
                                : _buildDefaultList(),
                          ),
                        ],
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

  void _checkAndNavigate() {
    if (pickupController.text.trim().isNotEmpty &&
        dropController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChooseATime()),
      );
    }
  }

  Widget _locationTile(String title, String subtitle, int distance) {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text("$distance km"),
    );
  }

  Widget _simpleTile(IconData icon, String text) {
    return ListTile(leading: Icon(icon), title: Text(text));
  }

  Widget _buildDefaultList() {
    return ListView(
      children: [
        _locationTile("Kottayam", "Kerala", 42),
        _locationTile(
          "LuLu International Shopping Mall",
          "Edappally, Kochi",
          86,
        ),
        _locationTile(
          "Ernakulam South Railway Station",
          "Ernakulam South, Kochi",
          81,
        ),
        _locationTile("Aster Medcity", "South Chittoor, Kochi", 89),
        _locationTile("Amrita Hospital, Kochi", "Edappally", 87),
        const SizedBox(height: 12),
        _simpleTile(Icons.search, "Search in a different city"),
        _simpleTile(Icons.location_on, "Set location on map"),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildSuggestionList() {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.location_pin),
          title: Text(
            item["title"],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(item["sub"]),
          trailing: Text("${item["km"]} km"),
          onTap: () {
            if (activeField == "pickup") {
              pickupController.text = item["title"];
            } else {
              dropController.text = item["title"];
            }

            setState(() => suggestions = []);
          },
        );
      },
    );
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    const p = 0.017453292519943295;
    final c =
        0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(c));
  }

  Future<void> searchFromOSM(String query) async {
    if (query.isEmpty) {
      setState(() => suggestions = []);
      return;
    }

    final url = Uri.parse(
      "https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1",
    );

    final response = await http.get(url, headers: {"User-Agent": "FlutterApp"});

    if (response.statusCode != 200) return;

    List data = jsonDecode(response.body);

    List<Map<String, dynamic>> results = data.map((item) {
      return {
        "title": item["display_name"].toString().split(",")[0],
        "sub": item["display_name"]
            .toString()
            .replaceFirst(
              "${item["display_name"].toString().split(",")[0]},",
              "",
            )
            .trim(),
        "lat": item["lat"],
        "lon": item["lon"],
        "km": 0, // we calculate next
      };
    }).toList();

    // calculate distance
    results = results.map((loc) {
      double km = _calculateDistance(
        9.5916,
        76.5222,
        double.parse(loc["lat"]),
        double.parse(loc["lon"]),
      );
      loc["km"] = km.toInt();
      return loc;
    }).toList();

    setState(() => suggestions = results);
  }

  // ---------------- SMALL CHIPS ----------------
Widget _optionChip(String label, IconData icon, {VoidCallback? onTap}) {
  final bool isSelected = label.contains("later"); // detect 'Pick-up later'

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.black : Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ],
      ),
    ),
  );
}



  // ---------------- SIMPLE OPTION TILE ----------------
  void _showPickupBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        String tempSelection =
            selectedPickup; // temporary selection inside sheet

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    "When do you need a trip?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 25),

                  // NOW option
                  InkWell(
                    onTap: () {
                      setModalState(() => tempSelection = "Now");
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, size: 26),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Now",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Request a trip, hop in and go",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: "Now",
                          groupValue: tempSelection,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setModalState(() => tempSelection = value!);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // LATER option
                  InkWell(
                    onTap: () {
                      setModalState(() => tempSelection = "Later");
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month, size: 26),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Later",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Reserve for extra peace of mind",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: "Later",
                          groupValue: tempSelection,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setModalState(() => tempSelection = value!);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Black bottom button
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedPickup = tempSelection;
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
