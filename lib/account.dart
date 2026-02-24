import 'package:flutter/material.dart';
import 'package:flutter_6/howoldareyoupage.dart';
import 'package:flutter_6/leaves_splash.dart';
import 'package:flutter_6/privacy_check_up_page.dart';
import 'package:flutter_6/rider_insurance_page.dart';
import 'package:flutter_6/safety_check_up_page.dart';
import 'package:flutter_6/uber_account_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'home_screen.dart';
import 'services.dart';
import 'activity.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int _selectedIndex = 3;

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

  // -------------------------------------------------------------
  // YOUR ORIGINAL WIDGETS (NO CHANGES MADE)
  // -------------------------------------------------------------

  Widget _buildQuickAction(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 85,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F1F4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.black),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isNew = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (isNew)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "NEW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, String assetImage,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F1F4),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                assetImage,
                width: 73,
                height: 73,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // UPDATED BUILD METHOD WITH STICKY HEADER
  // -------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------------------------------------------------
            // 🔥 FIXED / STICKY HEADER (DOES NOT SCROLL)
            // ---------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abhishek A",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.star,
                                size: 14, color: Colors.black),
                            SizedBox(width: 4),
                            Text(
                              "5.00",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        UberAccountPage(),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                      );
                    },
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0),
                              ],
                              radius: 0.45,
                            ),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ---------------------------------------------------------
            // 🔥 SCROLLABLE CONTENT
            // ---------------------------------------------------------
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10),

                    // Quick Actions
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: _buildQuickAction(
                                Icons.help_outline, "Help",
                                onTap: () {}),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: _buildQuickAction(
                                Icons.account_balance_wallet_outlined, "Wallet",
                                onTap: () {}),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: _buildQuickAction(
                                Icons.mail_outline, "Inbox",
                                onTap: () {}),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // All Info Cards
                    _buildCard(
                      "You have multiple promos",
                      "We’ll automatically apply the one that saves you the most",
                      'assets/images/account_tag.png',
                    ),

                    _buildCard(
                      "Rider insurance",
                      "₹10L cover for ₹3/trip",
                      'assets/images/account_umbrella.png',
                      onTap: () {
                        Get.bottomSheet(
                          const RiderInsurancePage(),
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                        );
                      },
                    ),

                    _buildCard(
                      "Safety check-up",
                      "Learn ways to make rides safer",
                      'assets/images/account_safety_check.png',
                      onTap: () {
                        Get.to(
                          () => const SafetyCheckupPage(),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 400),
                        );
                      },
                    ),

                    _buildCard(
                      "Privacy check-up",
                      "Take an interactive tour of your privacy settings",
                      'assets/images/account_clipboard.png',
                      onTap: () {
                        Get.to(
                          () => const PrivacyCheckupPage(),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 280),
                        );
                      },
                    ),

                    _buildCard(
                      "Estimated CO₂ saved",
                      "",
                      'assets/images/account_leaf.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const LeavesSplash(),
                            transitionsBuilder: (_, anim, __, child) =>
                                SlideTransition(
                              position: Tween(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero)
                                  .animate(anim),
                              child: child,
                            ),
                          ),
                        );
                      },
                    ),

                    _buildCard(
                      "Uber for Teens",
                      "Invite your teenager to set up their own account",
                      'assets/images/uber_for_teens.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HowOldAreYouPage()),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // Account List Items
                  GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HowOldAreYouPage()),
    );
  },
  child: _buildListItem(
    icon: Icons.group,
    title: "Family",
    subtitle: "Manage teen, adult and senior accounts",
  ),
),


                    _buildListItem(
                        icon: Icons.settings, title: "Settings"),

                    _buildListItem(
                      icon: Icons.phone_iphone,
                      title: "Simple mode",
                      subtitle: "A simplified app for older adults",
                      isNew: true,
                    ),

                    _buildListItem(
                      icon: Icons.shield_outlined,
                      title: "Rider insurance",
                      subtitle: "₹10L cover for ₹3/trip",
                    ),

                    _buildListItem(
                        icon: Icons.card_giftcard, title: "Send a gift"),

                    _buildListItem(
                      icon: Icons.auto_awesome,
                      title: "Uber One",
                      subtitle:
                          "Earn up to 15% Uber One credits on rides",
                    ),

                    _buildListItem(
                        icon: Icons.motorcycle,
                        title: "Earn by driving or delivering"),

                    _buildListItem(
                      icon: Icons.group_outlined,
                      title: "Saved groups",
                      isNew: true,
                    ),

                    _buildListItem(
                      icon: Icons.business_center_outlined,
                      title: "Set up your business profile",
                      subtitle: "Automate work travel & meal expenses",
                    ),

                    _buildListItem(
                        icon: Icons.business, title: "Uber for Business"),

                    _buildListItem(
                        icon: Icons.manage_accounts_outlined,
                        title: "Manage Uber account"),

                    _buildListItem(
                        icon: Icons.info_outline, title: "Legal"),

                    const SizedBox(height: 20),

                    const Text(
                      "v3.691.10002",
                      style:
                          TextStyle(fontSize: 13, color: Colors.black45),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Activity",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
