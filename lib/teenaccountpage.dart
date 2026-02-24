import 'package:flutter/material.dart';

class TeenAccountPage extends StatelessWidget {
  const TeenAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              /// TOP IMAGE
             SizedBox(
          height: 200, // fixed height
          width: double.infinity,
          child: Image.asset(
            'assets/images/teen_account.png',
            fit: BoxFit.cover, // keeps full width & crops excess
          ),
        ),
        
        
              /// TITLE
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  "Get more with a teen account",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
        
              /// DESCRIPTION
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enjoy the benefits of having a teen account. Just "
                  "choose a parent or guardian to send a request.",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
        
              const SizedBox(height: 25),
        
              /// FEATURES (LIST)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.star_border, size: 28),
                      title: Text("Top-rated drivers only",
                          style: TextStyle(fontSize: 16)),
                    ),
                    ListTile(
                      leading: Icon(Icons.shield_outlined, size: 28),
                      title: Text("Automatic safety features",
                          style: TextStyle(fontSize: 16)),
                    ),
                    ListTile(
                      leading: Icon(Icons.mic_none_outlined, size: 28),
                      title: Text("Audio recording (optional)",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 10),
        
              /// INFO BOX
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Ask for your guardian’s approval to continue to use your account.",
                  style: TextStyle(fontSize: 15),
                ),
              ),
        
              const SizedBox(height: 100), // space above button
            ],
          ),
        ),
      ),

      /// BOTTOM BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -3),
            )
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
              shadowColor: Colors.black.withOpacity(0.4),
            ),
            child: const Text(
              "Choose a guardian",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
