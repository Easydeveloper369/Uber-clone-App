import 'package:flutter/material.dart';
import 'invitepage.dart';
import 'teenaccountpage.dart';

class HowOldAreYouPage extends StatefulWidget {
  const HowOldAreYouPage({super.key});

  @override
  State<HowOldAreYouPage> createState() => _HowOldAreYouPageState();
}

class _HowOldAreYouPageState extends State<HowOldAreYouPage> {
  String selected = "adult";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          height: 200, // fixed height
          width: double.infinity,
          child: Image.asset(
            'assets/images/social.png',
            fit: BoxFit.fill, // keeps full width & crops excess
          ),
        ),
        
        
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("How old are you?",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
        
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Choose your age to start inviting family members.",
                style: TextStyle(color: Colors.black54),
              ),
            ),
        
            const SizedBox(height: 20),
        
            RadioListTile(
             activeColor: Colors.black,
              title: const Text("Adult"),
              subtitle: const Text("18 or older"),
              value: "adult",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
            ),
        
            RadioListTile(
           activeColor: Colors.black,
              title: const Text("Teen"),
              subtitle: const Text("13–17"),
              value: "teen",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
            ),
        
            const Spacer(),
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                ),
                onPressed: () {
                  if (selected == "adult") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const InvitePage()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TeenAccountPage()),
                    );
                  }
                },
                child: const Text("Next",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
