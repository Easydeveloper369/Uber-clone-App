import 'package:flutter/material.dart';
import 'package:flutter_6/account.dart';
import 'package:flutter_6/activity.dart';
import 'home_screen.dart'; // Import HomeScreen

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int _selectedIndex = 1; // Services tab selected

void _onItemTapped(int index) {
  if (index == _selectedIndex) return;

  switch (index) {
    case 0:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      break;
    case 1:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Services()),
      );
      break;
    case 2:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Activity()),
      );
      break;
    case 3:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Account()),
      );
      break;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),

      // 🔹 Page Content
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Services",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Go anywhere, get anything",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
        
              // 🔹 Services Grid
              Expanded(
          child: Column(
            children: [
        // TOP ROW — 3 LARGE CARDS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildServiceCard("Trip", "assets/images/trip.png", "50%", large: true)),
            const SizedBox(width: 12),
            Expanded(child: _buildServiceCard("Intercity", "assets/images/intercity.png", "Promo", large: true)),
            const SizedBox(width: 12),
            Expanded(child: _buildServiceCard("Reserve", "assets/images/reserve1.png", "Promo", large: true)),
          ],
        ),
        
        const SizedBox(height: 14),
        
        // BOTTOM ROW — 4 SMALLER CARDS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildServiceCard("Rentals", "assets/images/rentals.png", null, large: false)),
            const SizedBox(width: 12),
            Expanded(child: _buildServiceCard("Group ride", "assets/images/group_trip1.png", "50%", large: false)),
            const SizedBox(width: 12),
            Expanded(child: _buildServiceCard("Teens", "assets/images/teens.png", null, large: false)),
            const SizedBox(width: 12),
            Expanded(child: _buildServiceCard("Seniors", "assets/images/seniors.png", null, large: false)),
          ],
        ),
            ],
          ),
        ),
        
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Service Item Widget
Widget _buildServiceCard(String title, String imagePath, String? badge,
    {bool large = true}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          // CARD — remains constrained by Expanded
          Container(
            width: constraints.maxWidth, // ensures equal width
            height: large ? 120 : 90,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 238, 238),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: large ? 13 : 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // BADGE ABOVE CARD
          if (badge != null)
            Positioned(
              top: -12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: badge == "50%" ? Colors.green : Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}





}
