import 'package:flutter/material.dart';
import 'package:flutter_6/get_started_group_trip_search.dart';

class GroupTrips extends StatefulWidget {
  const GroupTrips({super.key});

  @override
  State<GroupTrips> createState() => _GroupTripsState();
}

class _GroupTripsState extends State<GroupTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/group_trip.png",
                    fit: BoxFit.fill,
                  ),
                ),
        
                // BACK BUTTON
                Positioned(
                  top: 50, // adjust for notch
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Group trips",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Invite friends to join your trip"),
            ),
            SizedBox(height: 10),
        
            ListTile(
              leading: Icon(Icons.groups),
              title: Text("Invite upto 3 friends", style: TextStyle(fontSize: 14)),
            ),
            Divider(indent: 55),
        
            ListTile(
              leading: Icon(Icons.currency_rupee_outlined),
              title: Text("Save versus the cost of riding alone", style: TextStyle(fontSize: 14)),
            ),
            Divider(indent: 55),
        
            ListTile(
              leading: Icon(Icons.energy_savings_leaf),
              title: Text("Reduce emissions by taking one car", style: TextStyle(fontSize: 14)),
            ),
            Divider(indent: 55),
        
            Spacer(),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetStartedGroupTripSearch()),
                    );
                  },
                  child: Center(
                    child: Text("Get started", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
