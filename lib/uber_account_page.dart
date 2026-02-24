import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'uber_account_controller.dart'; // <-- add your controller import

class UberAccountPage extends StatefulWidget {
  const UberAccountPage({super.key});

  @override
  State<UberAccountPage> createState() => _UberAccountPageState();
}

class _UberAccountPageState extends State<UberAccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  // ADD THIS → GetX controller
  final UberAccountController accountController = Get.put(
    UberAccountController(),
  );

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Get.back(); // closes the bottom sheet
          },
        ),

        title: Text("Uber Account", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _controller,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black,
              tabs: const [
                Tab(text: "Home"),
                Tab(text: "Personal info"),
                Tab(text: "Security"),
                Tab(text: "Privacy & Data"),
              ],
            ),
          ),
        ),
      ),

      // 🔥 ONLY THIS PART CHANGES → loading + tabs
      body: SafeArea(
        child: Obx(() {
          if (accountController.isLoading.value) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: CircularProgressIndicator(),
              ),
            );
          }
        
          // Original TabBarView (UNCHANGED)
          return TabBarView(
            controller: _controller,
            children: [
              _homeTab(),
              _personalInfoTab(),
              _securityTab(),
              _privacyDataTab(),
            ],
          );
        }),
      ),
    );
  }

  // -------------------------------
  // HOME TAB (unchanged)
  // -------------------------------
  Widget _homeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4D9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_outlined, size: 26),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "Secure your account\nAdd another login method",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 239, 199, 99),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Set up"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Column(
            children: [
              Container(
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
                        colors: [Colors.white, Colors.white.withOpacity(0)],
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
              SizedBox(height: 10),
              Text(
                "Abhishek A",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bigButton(Icons.person, "Personal info", 1),
              _bigButton(Icons.security, "Security", 2),
              _bigButton(Icons.lock, "Privacy & Data", 3),
            ],
          ),

          const SizedBox(height: 30),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Suggestions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Complete your account checkup",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Complete your account checkup to make Uber work better for you and keep you secure.",
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Begin checkup"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bigButton(IconData icon, String title, int tabIndex) {
    return GestureDetector(
      onTap: () => _controller.animateTo(tabIndex),
      child: Container(
        width: 95,
        height: 105, // <-- increased height to avoid overflow
        padding: const EdgeInsets.all(12), // <-- slightly reduced padding
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 4), // <-- reduced spacing
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2, // prevents text from expanding too much
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------
  // PERSONAL INFO TAB (unchanged)
  // -------------------------------
  Widget _personalInfoTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Colors.white, Colors.white.withOpacity(0)],
                            radius: 0.45,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 28,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.bottomRight,
                        child: Icon(Icons.edit, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _item("Name", "Abhishek A"),
        _item("Gender", "Add your gender"),
        _item(
          "Phone number",
          "+919744235883",
          trailing: const Icon(Icons.check_circle, color: Colors.green),
        ),
        _item("Email", "Add email"),
        _item(
          "Language",
          "Update device language",
          trailing: const Icon(Icons.open_in_new),
        ),
      ],
    );
  }

  // -------------------------------
  // SECURITY TAB (unchanged)
  // -------------------------------
  Widget _securityTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Logging in to Uber",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _item("Passkeys", "Passkeys are easier and more secure"),
        _item("Password", ""),
        _item("Authenticator app", "Set up your auth app"),
        _item("2-step verification", "Add additional security"),
        _item("Recovery phone", "Add a backup phone"),
        const SizedBox(height: 20),
        const Text(
          "Connected social apps",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          "Once you've allowed social apps to sign in to your Uber account, you'll see them here.",
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 20),
        const Text(
          "Login activity",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "iPhone 14 Pro Max",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Your current login", style: TextStyle(color: Colors.blue)),
              SizedBox(height: 6),
              Text("Kochi, India"),
              Text("Uber Web, Uber Rider"),
            ],
          ),
        ),
      ],
    );
  }

  // -------------------------------
  // PRIVACY & DATA TAB (unchanged)
  // -------------------------------
  Widget _privacyDataTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Privacy & Data",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _item("Privacy Center", "Take control of your privacy"),
        const SizedBox(height: 20),
        const Text(
          "Third-party apps with account access",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          "Once you allow access to third-party apps, you'll see them here.",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  // Generic list item (unchanged)
  Widget _item(String title, String subtitle, {Widget? trailing}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: subtitle.isNotEmpty
              ? Text(subtitle, style: const TextStyle(color: Colors.black54))
              : null,
          trailing:
              trailing ??
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
        ),
        const Divider(),
      ],
    );
  }
}
