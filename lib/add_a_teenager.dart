import 'package:flutter/material.dart';
import 'package:flutter_6/add_a_teenager_contact.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- add this import

class AddATeenager extends StatefulWidget {
  const AddATeenager({super.key});

  @override
  State<AddATeenager> createState() => _AddATeenagerState();
}

class _AddATeenagerState extends State<AddATeenager> {
  // ✅ Official Uber Teen Accounts URL
  final Uri _uberTeenUrl = Uri.parse('https://www.uber.com/in/en/ride/safety/teen/');

  // ✅ Function to launch the link
  Future<void> _launchUberTeenPage() async {
    if (!await launchUrl(_uberTeenUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_uberTeenUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add a teenager",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/add_a_teenager.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Invite your teenager to Uber",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Now you can let your teenager (ages 13–17) request trips with:",
                  style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
                ),
                const SizedBox(height: 16),
                _buildBulletPoint("Top-rated drivers only"),
                _buildBulletPoint("Unexpected event sensing"),
                _buildBulletPoint("Live trip tracking"),
                _buildBulletPoint("PIN verification"),
                _buildBulletPoint("Audio recording"),
                const SizedBox(height: 20),
                const Text(
                  "Choose a teenager to add to your family profile, and we’ll send them an invitation.",
                  style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
                ),
                const SizedBox(height: 12),
        
                // ✅ InkWell to open Uber Teen Account page
                InkWell(
                  onTap: _launchUberTeenPage, // <-- opens Uber page
                  child: const Text(
                    "Learn more about teenager accounts",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),

      // Bottom button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddATeenagerContact(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 6,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Choose contact",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 8, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
