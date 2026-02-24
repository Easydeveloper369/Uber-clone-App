import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UberInboxController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

class UberInboxPage extends StatelessWidget {
  UberInboxPage({super.key});

  final UberInboxController controller = Get.put(UberInboxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),   // <-- close the sheet
          child: const Icon(Icons.close, color: Colors.black),
        ),
        title: const Text("Inbox",
            style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
      ),

      body: SafeArea(
        child: Column(
          children: [
        
            // -------------------------  FILTER TABS  -------------------------
            SizedBox(
              height: 45,
              child: Obx(() {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    _filterChip("All", 0),
                    _filterChip("Offers", 1),
                    _filterChip("Support", 2),
                    _filterChip("Updates", 3),
                    _filterChip("Priority", 4),
                  ],
                );
              }),
            ),
        
            const SizedBox(height: 10),
        
            // -----------------------  CONTENT BASED ON TAB -----------------------
            Expanded(
              child: Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                  case 1:
                    return _offersList();
                  case 2:
                    return _emptyMessage(
                        icon: Icons.mail_outline,
                        title: "No messages right now",
                        subtitle:
                            "Check back when you have an active\nSupport issue.");
                  case 3:
                    return _emptyMessage(
                        icon: Icons.campaign_outlined,
                        title: "Stay tuned for new messages",
                        subtitle:
                            "Get the most out of Uber with news\nand updates.");
                  case 4:
                    return _emptyMessage(
                        icon: Icons.mail_outline,
                        title: "Nothing critical right now",
                        subtitle:
                            "Check back for messages that need\nyour attention.");
                  default:
                    return const SizedBox();
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  // ------------------------- FILTER CHIP WIDGET -------------------------
  Widget _filterChip(String text, int index) {
    return Obx(() {
      bool selected = controller.selectedIndex.value == index;
      return GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    });
  }

  // ----------------------- OFFERS LIST UI -----------------------
  Widget _offersList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.verified, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "New for you! ${index + 1}0% off select trip types",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.circle, size: 10, color: Colors.blue),
                ],
              ),

              const SizedBox(height: 5),
              const Text("2 left • Up to ₹50 off • India\nUse by Oct 30, 2025",
                  style: TextStyle(color: Colors.black54)),

              const SizedBox(height: 12),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("Book now",
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("Details"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // --------------------- EMPTY MESSAGE UI ---------------------
  Widget _emptyMessage(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.black54),
          const SizedBox(height: 20),
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20)),
            child: const Text("Refresh"),
          )
        ],
      ),
    );
  }
}
