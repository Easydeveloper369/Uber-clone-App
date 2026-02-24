import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  String selectedTab = "Offers";

  final tabs = ["All", "Offers", "Support", "Updates", "Priority"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
        
            /// STICKY HEADER
            SliverAppBar(
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 120,
        
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        
                    /// Title Row
                    const Text(
                      "Inbox",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    const SizedBox(height: 12),
        
                    /// FILTER TABS
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: tabs.map((tab) {
                          final isSelected = tab == selectedTab;
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => setState(() => selectedTab = tab),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.black : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  tab,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
        
                    const SizedBox(height: 12),
        
                    /// ADD OFFER CODE BAR
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.add, size: 20, color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            "Add offer code",
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            /// BODY CONTENT
            SliverToBoxAdapter(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  /// CHANGES CONTENT BASED ON FILTER
  Widget _buildTabContent() {
    switch (selectedTab) {
      case "Offers":
        return _offersFromScreenshot();

      case "Support":
        return _emptyScreenshot(
          imagePath: "assets/icons/mail.png", // replace with your image
          title: "No messages right now",
          subtitle: "Check back when you have an active Support issue.",
        );

      case "Updates":
        return _emptyScreenshot(
          imagePath: "assets/icons/megaphone.png",
          title: "Stay tuned for new messages",
          subtitle: "Get the most out of Uber with news and updates.",
        );

      case "Priority":
        return _emptyScreenshot(
          imagePath: "assets/icons/mail.png",
          title: "Nothing critical right now",
          subtitle: "Check back for messages that need your attention.",
        );

      case "All":
      default:
        return _offersFromScreenshot();
    }
  }

  /// --- OFFERS EXACTLY AS IN SCREENSHOT ---
  Widget _offersFromScreenshot() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          // 🔹 OFFER 1
          _offerItem(
            title: "New for you! 40% off uberGO and other select trip types",
            details: "2 left • Up to ₹50 off • India",
            expiry: "Use by Nov 13, 2025",
          ),

          // 🔹 OFFER 2
          _offerItem(
            title: "New for you! 15% off select trip types",
            details: "2 left • Up to ₹100 off • India",
            expiry: "Use by Feb 3, 2026",
          ),

          // 🔹 OFFER 3
          _offerItem(
            title: "New for you! 50% off select trip types",
            details: "2 left • Up to ₹50 off • India",
            expiry: "Use by Oct 30, 2025",
          ),

          // 🔹 OFFER 4
          _offerItem(
            title: "New for you! 5% off select trip types",
            details: "1 left • Up to ₹500 off • Kochi",
            expiry: "Use by Feb 6, 2026",
          ),

          // 🔹 OFFER 5
          _offerItem(
            title: "New for you! 50% off Go Sedan and other select trip types",
            details: "2 left • Up to ₹50 off • India",
            expiry: "Use by Nov 30, 2025",
          ),
        ],
      ),
    );
  }

  /// --- OFFER LIST TILE UI (Matches Screenshot) ---
  Widget _offerItem({required String title, required String details, required String expiry}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.verified, size: 22, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.circle, size: 10, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 6),
          Text(details, style: const TextStyle(color: Colors.black54)),
          Text(expiry, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 12),

          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Book now"),
              ),
              const SizedBox(width: 15),
              const Text(
                "Details",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// --- EMPTY STATE EXACTLY LIKE SCREENSHOT ---
  Widget _emptyScreenshot({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, color: Colors.black),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          /// REFRESH BUTTON
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
