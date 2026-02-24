import 'package:flutter/material.dart';
import 'addmembersheet.dart';

class InvitePage extends StatelessWidget {
  const InvitePage({super.key});

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
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            'assets/images/sun.png',
            fit: BoxFit.fill,
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(20),
          child: Text("Invite teenagers and adults",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Create a family profile to help make life easier — for you and your loved ones.",
            style: TextStyle(color: Colors.black),
          ),
        ),

        const SizedBox(height: 5),

        ListTile(
          leading: const Icon(Icons.shield, color: Colors.black),
          title: const Text("Teenager account safety"),
          subtitle: const Text("Teens get built-in safety features and top-rated drivers."),
        ),

        ListTile(
          leading: const Icon(Icons.directions_car_outlined, color: Colors.black),
          title: const Text("Book trips for family"),
          subtitle: const Text("They can request their own trips, or you can do it for them."),
        ),

        ListTile(
          leading: const Icon(Icons.location_on_outlined, color: Colors.black),
          title: const Text("Follow trips in real time"),
          subtitle: const Text("Track your family's live location."),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 55),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (_) => const AddMemberSheet(),
              );
            },
            child: const Text("Invite family",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ),
      ],
    ),
  ),
),

    );
  }
}
