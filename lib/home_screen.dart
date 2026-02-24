import 'package:flutter/material.dart';
import 'package:flutter_6/account.dart';
import 'package:flutter_6/activity.dart';
import 'package:flutter_6/add_a_teenager.dart';
import 'package:flutter_6/group_trips.dart';
import 'package:flutter_6/plan_your_intercity_trip.dart';
import 'package:flutter_6/plan_your_ride.dart';
import 'package:flutter_6/reserve.dart';
import 'package:flutter_6/rider_insurance_page.dart';
import 'package:flutter_6/seniors.dart';
import 'package:flutter_6/services.dart';
import 'package:flutter_6/sign_in1.dart';
import 'package:flutter_6/uber_rentals.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      
        // 🔹 Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == _selectedIndex) return;
      
            switch (index) {
              case 0: // Home
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                break;
      
              case 1: // Services
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Services()),
                );
                break;
      
              case 2: // Activity
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Activity()),
                );
                break;
      
              case 3: // Account
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Account()),
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services),
              label: "Services",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Account",
            ),
          ],
        ),
      
        body: CustomScrollView(
          slivers: [
            // 🔹 Title — scrolls away normally
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: false,
              automaticallyImplyLeading: false,
              expandedHeight: 40,
              toolbarHeight: 40,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(top: 14),
                title: Text(
                  "Uber",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
      
            // 🔹 Sticky Search Bar — stays pinned at top
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickySearchBarDelegate(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: SearchBar(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PlanYourRide()),
                      );
                    },
                    side: WidgetStatePropertyAll(BorderSide(color: Colors.black)),
                    elevation: WidgetStatePropertyAll(0),
                    leading: Icon(Icons.search),
                    hintText: "Where to?",
                    hintStyle: WidgetStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                ),
              ),
            ),
      
            // 🔹 Entire Existing Screen Content — unchanged
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 1),
      
                    _buildLocationCard("Kottayam", "Kerala"),
                    const SizedBox(height: 10),
      
                    _buildLocationCard(
                      "LuLu International Shopping Mall",
                      "34/1000, Old NH 47, Eda…",
                    ),
                    const SizedBox(height: 20),
      
                    // ⬆ Keep all your original content from here on...
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Suggestions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      children: [
                        _buildSuggestionItem(
                          'assets/images/trip.png',
                          "Trip",
                          "50%",
                        ),
                        _buildSuggestionItem(
                          'assets/images/intercity.png',
                          "Intercity",
                          "Promo",
                        ),
                        _buildSuggestionItem(
                          'assets/images/reserve1.png',
                          "Reserve",
                          "Promo",
                        ),
                        _buildSuggestionItem(
                          'assets/images/rentals.png',
                          "Rentals",
                          null,
                        ),
                        _buildSuggestionItem(
                          'assets/images/group_trip1.png',
                          "Group ride",
                          "50%",
                        ),
                        _buildSuggestionItem(
                          'assets/images/teens2.png',
                          "Teens",
                          null,
                        ),
                        _buildSuggestionItem(
                          'assets/images/seniors.png',
                          "Seniors",
                          null,
                        ),
                        _buildSuggestionItem(
                          'assets/images/see_all.png',
                          "See all",
                          null,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              promoCardWithTap(context),
                              promoCardWithTap2(context),
                              promoCardWithTap3(context),
                              promoCardWithTap4(context),
                              promoCardWithTap5(context),
                              promoCardWithTap6(context),
                              promoCardWithTap7(context),
                              promoCardWithTap8(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
      
                    const Text(
                      "More ways to use Uber",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _featureCard(
                          image: 'assets/images/insure.png',
                          title: 'Insure your rides',
                          subtitle: '₹10L coverage, OPD & more',
                          onTap: () => Get.to(() => const RiderInsurancePage()),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                    const SizedBox(height: 30),
      
                    const Text(
                      "Ride as you like it",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _rideCard(
                            image: 'assets/images/city.png',
                            title: 'Book Intercity',
                            subtitle: 'Travel outstation with ease',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PlanYourIntercityTrip(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 12),
                          _rideCard(
                            image: 'assets/images/reserve_ride.png',
                            title: 'Reserve your ride',
                            subtitle: 'Reliable airport trips',
                            onTap: () {
                              print("Intercity tapped");
                            },
                          ),
                        ],
                      ),
                    ),
      
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Bottom Sheet Method
  void _showPromoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        initialChildSize: 0.8,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button

              // Promo Image
              Stack(
                children: [
                  // 🔹 Full-width promo image filling the top of the bottom sheet
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/ad.png', // <-- use your file
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover, // <-- fills fully like Uber
                    ),
                  ),

                  // 🔹 Close (X) button floating above the image
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                "50% off your next trip. Up to ₹50 per trip.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 15),
              const Text(
                "Expiry",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const Text(
                "Expires Oct 30, 2025.",
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 15),
              const Text(
                "Restrictions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const Text(
                "Congrats! You have unlocked 40% discount on your next Uber ride. "
                "Promo amount and validity subject to change.\n"
                "• Only valid on: Bike, Bike Saver, Uber Bike.\n"
                "• Up to ₹50 per trip.",
                style: TextStyle(height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 15),
              const Text(
                "Terms",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const Text(
                "Discount does not apply to surcharges, government fees, tolls or tips and cannot be combined with other offers. "
                "For accounts with multiple valid promo codes, the promo with the highest savings will be applied automatically to a rider's next trip. "
                "Offer is non-transferable. Offer and terms are subject to change.",
                style: TextStyle(height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              // Book now button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Book now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Helper widgets
  Widget _buildLocationCard(String title, String subtitle) => Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(210, 230, 225, 225)),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color.fromARGB(183, 219, 218, 218),
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.watch_later_outlined, size: 16),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

              /// 🔹 FIX: Prevent overlap
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildSuggestionItem(String imagePath, String label, String? badge) {
    return GestureDetector(
      onTap: () {
        // 🔹 Navigate based on the label
        switch (label) {
          case "Trip":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlanYourRide()),
            );
            break;

          case "Intercity":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlanYourIntercityTrip(),
              ),
            );
            break;

          case "Reserve":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Reserve()),
            );
            break;

          case "Rentals":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UberRentals()),
            );
            break;

          case "Group ride":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GroupTrips()),
            );
            break;

          case "Teens":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddATeenager()),
            );
            break;

          case "Seniors":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SeniorsPage()),
            );
            break;

          case "See all":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Services()),
            );
            break;

          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Page for '$label' not implemented yet.")),
            );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔹 Grey Rounded Container
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 238, 238),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // 🔹 Centered Image (slightly smaller)
                Center(
                  child: Image.asset(
                    imagePath,
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                ),

                // 🔹 Label at bottom center inside the same container
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Badge (top-right corner)
          if (badge != null)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: badge == "50%"
                      ? const Color.fromARGB(255, 17, 123, 18)
                      : const Color.fromARGB(255, 47, 133, 49),
                  borderRadius: BorderRadius.circular(6),
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
        ],
      ),
    );
  }

  Widget _featureCard({
    required String image,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Top Banner Image (Ride Card Style)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                height: 120,
                width: 280,
                fit: BoxFit.fill,
              ),
            ),

            /// 🔹 Text Section
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rideCard({
    required String image,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.asset(
                image,
                height: 90,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // 🔥 Combined text padding (no big gap)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4), // very small gap
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget promoCardWithTap(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 233, 231, 231),
          ),
        ),
        child: Row(
          children: [
            // LEFT CONTENT WITH ITS OWN PADDING
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enjoy 50% off select trips",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Book now",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 10),

            // RIGHT IMAGE FULL HEIGHT
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: SizedBox.expand(
                  // <<<< THIS FORCES FULL HEIGHT
                  child: Image.asset(
                    "assets/images/car.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget promoCardWithTap2(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "40% off your first two rides",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Take a trip",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/take_a_trip.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardWithTap3(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: const Color.fromARGB(255, 138, 70, 45),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "50% Off Annual Plan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Get Annual Plan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/gold.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardWithTap4(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: const Color.fromARGB(255, 24, 58, 115),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Go outstation with Uber",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Try Intercity",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/help.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardWithTap5(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: const Color.fromARGB(189, 132, 88, 251),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reserve it, forget it",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Try Reserve",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/night_city.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardWithTap6(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: const Color.fromARGB(255, 104, 189, 201),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ride between cities",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Try Intercity",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/mount.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardWithTap7(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Easy rides for loved ones",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Send invite",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/two.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardWithTap8(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPromoBottomSheet(context),
      child: Container(
        width: 300,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // LEFT BLACK SECTION
              Expanded(
                flex: 6,
                child: Container(
                  color: const Color.fromARGB(255, 242, 178, 243),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ready? Then let's roll",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      // Button slightly lower
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Ride with Uber",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),

              // RIGHT IMAGE — full bleed
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/open.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCardNoTap(String imagePath) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Special offer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  "Check now",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ⬇ ADD THIS BELOW (outside the widget class)
class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickySearchBarDelegate({required this.child});

  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 70;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
