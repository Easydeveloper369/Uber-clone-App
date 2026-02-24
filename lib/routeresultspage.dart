import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_6/paymentoptionspage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class RouteResultPage extends StatefulWidget {
  final String pickup;
  final String drop;

  const RouteResultPage({
    super.key,
    required this.pickup,
    required this.drop,
  });

  @override
  _RouteResultPageState createState() => _RouteResultPageState();
}

class _RouteResultPageState extends State<RouteResultPage> {
  LatLng pickupPoint = LatLng(9.266, 76.550);
  LatLng dropPoint = LatLng(9.300, 76.580);

  List<LatLng> roadRoute = [];

  @override
  void initState() {
    super.initState();
    getRoadRoute();
  }

  /// ⭐ Fetch road-following polyline from OSRM
  Future<void> getRoadRoute() async {
    final url =
        "https://router.project-osrm.org/route/v1/driving/${pickupPoint.longitude},${pickupPoint.latitude};${dropPoint.longitude},${dropPoint.latitude}?overview=full&geometries=geojson";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final coords = data["routes"][0]["geometry"]["coordinates"];

      setState(() {
        roadRoute = coords
            .map<LatLng>((c) => LatLng(c[1], c[0])) // lat, lng
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: pickupPoint,
                initialZoom: 12.5,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=v7sZAOQIvj8JRXvA3syq',
                  userAgentPackageName: 'com.example.app',
                ),
        
                /// ⭐ Road Route Polyline (not straight)
                if (roadRoute.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: roadRoute,
                        strokeWidth: 5,
                        color: Colors.black
        
                      ),
                    ],
                  ),
        
                /// ⭐ Markers + Text Labels
              MarkerLayer(
          markers: [
            // ------------------------------------------------ PICKUP MARKER ------------------------------------------------
            Marker(
        point: pickupPoint,
        width: 350,
        height: 110,
        child: Column(
          children: [
            // White rounded location label
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.pickup,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("Kerala",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54)),
                    ],
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right, color: Colors.black),
                ],
              ),
            ),
        
            SizedBox(height: 4),
        
            // Small black square marker (screenshot 1)
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
            ),
        
            // ------------------------------------------------ DROP MARKER ------------------------------------------------
            Marker(
        point: dropPoint,
        width: 350,
        height: 120,
        child: Column(
          children: [
            // Black circle (screenshot 2 destination marker)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
        
            SizedBox(height: 6),
        
            // White info box (screenshot 2)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Time box (optional)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "10 MIN",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
        
                  SizedBox(width: 8),
        
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.drop,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("Kerala",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54)),
                    ],
                  ),
        
                  SizedBox(width: 8),
        
                  Icon(Icons.chevron_right, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
            ),
          ],
        )
        
              ],
            ),
        Positioned(
          top: 50,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        
            // ---------------------------- BOTTOM SHEET ----------------------------
           Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
          )
        ],
            ),
            child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Center(
            child: Text(
              "Choose a trip",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        
          SizedBox(height: 12),
        
          // TRIP CARD
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/intercity.png",
                  height: 55,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Go Intercity",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(width: 6),
                          Icon(Icons.person, size: 16),
                          Text("4", style: TextStyle(fontSize: 14)),
                        ],
                      ),
        
                      SizedBox(height: 4),
        
                      Text(
                        "5:30 PM • 10 min",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
        
                // PRICE
                Text(
                  "₹352.50",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        
          SizedBox(height: 18),
        
          // PAYMENT SECTION (NEW)
          GestureDetector(
          onTap: () {
            showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => PaymentOptionsPage(),
            );
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.account_balance_wallet, color: Colors.black87),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal - UPI Scan and Pay",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Select payment method",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
        ],
            ),
          ),
        ),
        
        
          SizedBox(height: 20),
        
          // BUTTON
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Review trip",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
            ),
          ),
        )
        
          ],
        ),
      ),
    );
  }
}
